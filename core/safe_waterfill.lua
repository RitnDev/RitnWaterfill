data:extend({
  {
    type = "item-subgroup",
    name = "safefill",
    group = "logistics",
    order = "m"
  }
})


local do_shallow = true
local do_medium = true
local do_deep = true



local recipe_count = 0
local recipes = { }


--                       ("shallow", "water-shallow", "cb",      do_shallow, 0)
function create_waterfill(suffix,     tilename,        suborder, active,     layer)
  local safename = "safefill-"..suffix
  local tile = data.raw.tile[tilename]
  if (tile == nil) then
    return
  end

  if (active) then
    recipe_count = recipe_count + 1
    recipes[recipe_count] = { type="unlock-recipe", recipe=safename }
  end
  local recipe = {
    type = "recipe",
    name = safename,
    order = "nullius-w"..suborder,
    enabled = false,
    show_amount_in_title = false,
	always_show_products = true,
	always_show_made_in = true,
    result = safename
  }
  
--[[

{
  "ground-tile",
  "water-tile",
  "resource-layer",
  "doodad-layer",
  "floor-layer",
  "item-layer",
  "ghost-layer",
  "object-layer",
  "player-layer",
  "train-layer",
  "rail-layer",
  "transport-belt-layer"
}
]]





  local localised = {"tile-name."..tilename}
  if (tile.localised_name ~= nil) then
    localised = tile.localised_name
  end

  local cond = "water-tile"
  if settings.startup["safefill-water-on-water"].value and (layer > 0) then
    local lnum = (layer + 43)
    cond = "layer-"..lnum
	table.insert(tile.collision_mask, cond)
  end

  data:extend({
    {
      type = "item",
      name = safename,
      icon = "__safefill__/icons/"..suffix..".png",
      icon_size = 128,
      subgroup = "safefill",
      order = "nullius-"..suborder,
      stack_size = 500,
      place_as_tile = {
        result = safename,
        condition_size = 1,
        condition = {cond}
      }
    },
    {
      type = "tile",
      name = safename,
	  localised_name = localised,
      order = "c[watersafefill]-"..tilename,
      collision_mask = {"ground-tile"},
      layer = data.raw.tile[tilename].layer,
      variants = {
        main = data.raw.tile[tilename].variants.main,
        empty_transitions = true
      },
      map_color = data.raw.tile[tilename].map_color,
	  pollution_absorption_per_second = data.raw.tile[tilename].pollution_absorption_per_second
    },
	recipe
  })

  tile.placeable_by = {item = safename, count = 1}
end




create_waterfill("shallow", "water-shallow", "cb", do_shallow, 0)
create_waterfill("medium", "water", "cc", do_medium, 1)
create_waterfill("deep", "deepwater", "cd", do_deep, 2)


create_waterfill("mud", "water-mud", "db", do_shallow, 0)
create_waterfill("green", "water-green", "dc", do_medium, 3)
create_waterfill("deepgreen", "deepwater-green", "dd", do_deep, 4)

