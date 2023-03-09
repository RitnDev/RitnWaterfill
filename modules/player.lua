-- Module : Player

local function on_player_built_tile(e)

        local setting_value = settings.global["ritnmods-waterfill-01"].value
        
        if setting_value == true then
            local LuaPlayer = game.players[e.player_index]
            local LuaSurface = game.surfaces[e.surface_index]
            local tiles = e.tiles
            local LuaItemPrototype = e.item
           
            if LuaItemPrototype == nil then return end
            
            if  LuaItemPrototype.name == "waterfill"
            or LuaItemPrototype.name == "waterfill-dark" then

                --- INITIALIZATION ---
                if not global.players[LuaPlayer.name] then global.players[LuaPlayer.name] = {
                    surfaces = {}
                } end
                if not global.players[LuaPlayer.name].surfaces[LuaSurface.name] then 
                    global.players[LuaPlayer.name].surfaces[LuaSurface.name] = {
                        ["waterfill"] = 0,
                        ["waterfill-dark"] = 0
                    } 
                end
                -------------------------------------------------------------------
                local waterfill_value = settings.global["ritnmods-waterfill-02"].value  -- 20
                local landfill_value = settings.global["ritnmods-waterfill-03"].value  --1
                global.players[LuaPlayer.name].surfaces[LuaSurface.name][LuaItemPrototype.name] = 
                global.players[LuaPlayer.name].surfaces[LuaSurface.name][LuaItemPrototype.name] + #tiles

                pcall(function()
                    local value = global.players[LuaPlayer.name].surfaces[LuaSurface.name][LuaItemPrototype.name]
                    local result = math.floor(value / waterfill_value) * landfill_value
      
                    if LuaPlayer.can_insert({name="landfill", count=result}) then 
                        LuaPlayer.insert({name="landfill", count=result})
                    end
                    
                    global.players[LuaPlayer.name].surfaces[LuaSurface.name][LuaItemPrototype.name] = 
                    global.players[LuaPlayer.name].surfaces[LuaSurface.name][LuaItemPrototype.name] - ((result*waterfill_value) / landfill_value)
                end)

            end

        end
    
end




-----------------------------------
local module = {events={}}
module.events[defines.events.on_player_built_tile] = on_player_built_tile
-----------------------------------
return module