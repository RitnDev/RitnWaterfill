-- INITIALIZE
-----------------------------------------------------------------
if not ritnlib then require("__RitnLib__/defines") end
local RitnProtoTech = require(ritnlib.defines.class.prototype.tech)
-----------------------------------------------------------------
if not ritnmods then ritnmods = {} end
if not ritnmods.waterfill then ritnmods.waterfill = {} end


local setting_value = settings.startup["ritnmods-waterfill-00"].value

if setting_value then
  data.raw.tile.water.check_collision_with_entities = true
  data.raw.tile["deepwater"].check_collision_with_entities = true
end

-- update 1.5.1 (pouvoir posé sur des souches d'arbres)
data.raw.tile.water.collision_mask = {layers={water_tile=true, player=true, resource=true }}
data.raw.tile["deepwater"].collision_mask = {layers={water_tile=true, player=true, resource=true }}

-- add items, recipes and technology
require("prototypes.items")
require("prototypes.technologies")


if mods["vadatajs_landfill_removal"] then 
  local waterfill = RitnProtoTech("waterfill")
  waterfill:removePrerequisite("landfill")
  waterfill:addPrerequisite("logistic-science-pack")
  waterfill:multipliedPack(2)
end