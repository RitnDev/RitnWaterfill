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

require("prototypes.items")
require("prototypes.technologies")


if mods["vadatajs_landfill_removal"] then 
  local waterfill = RitnProtoTech("waterfill")
  waterfill:removePrerequisite("landfill")
  waterfill:addPrerequisite("logistic-science-pack")
  waterfill:multipliedPack(2)
end