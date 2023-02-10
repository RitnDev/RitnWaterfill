-- Variable global ritnmods permettant le lien avec d'autres mods Ritnmods
if not ritnlib then require("__RitnLib__/defines") end
if not global.players then global.players = {} end
-- Activation de gvv s'il est présent
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- Chargement de l'event listener :
local event_listener = require(ritnlib.defines.event)
-- envoie des modules à l'event listener :
event_listener.add_libraries(require("core/modules"))
