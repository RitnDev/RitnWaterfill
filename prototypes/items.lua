data:extend({

    --items
    {
        type = "item",
        name = "waterfill",
        icon = "__RitnWaterfill__/graphics/waterfill.png",
        icon_size = 128, icon_mipmaps = 5,
        subgroup = "terrain",
        order = "c1[landfill]-a[dirt]",
        stack_size = 200,
        place_as_tile =
        {
          result = "water",
          condition_size = 1,
          condition = {layers={water_tile=true}},
          --tile_condition = {"water", "deepwater", "water-green", "deepwater-green"}
        }
    },
    {
      type = "item",
      name = "waterfill-dark",
      icons = {
        {
          icon = "__RitnWaterfill__/graphics/waterfill.png",
          icon_size = 128, 
          icon_mipmaps = 5,
          tint = { a = 1,  b = 0.8, g = 0.4, r = 0 }
        }
      },
      subgroup = "terrain",
      order = "c2[landfill]-a[dirt]",
      stack_size = 200,
      place_as_tile =
      {
        result = "deepwater",
        condition_size = 1,
        condition = {layers={water_tile=true}},
      }
  },

    --recipes
    {
        type = "recipe",
        name = "waterfill",
        energy_required = 1,
        enabled = false,
        category = "crafting-with-fluid",
        ingredients =
        {
          {type="fluid", name="water", amount=200}
        },
        results = {
          {type = "item", name = "waterfill", amount = 1}
        },
        result_is_always_fresh = true
    },
    {
      type = "recipe",
      name = "waterfill-dark",
      energy_required = 1,
      enabled = false,
      category = "crafting-with-fluid",
      ingredients =
      {
        {type="fluid", name="water", amount=200},
        {type="item", name="waterfill", amount=1}
      },
      results = {
        {type = "item", name = "waterfill-dark", amount = 1}
      },
      result_is_always_fresh = true
    }
})