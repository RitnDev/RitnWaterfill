if mods["vadatajs_landfill_removal"] then 

    data:extend {
        {
            -- Activation du bonus landfill
            type = "bool-setting",
            name = "ritnmods-waterfill-01",
            setting_type = "runtime-global",
            default_value = false,
            order = "ritnmods-waterfill-01"
        },
        {
            -- Nombre de Waterfill pour avoir du remblai en retour
            type = "int-setting",
            name = "ritnmods-waterfill-02",
            setting_type = "runtime-global",
            default_value = 20,
            minimum_value = 1,
            maximum_value = 2000,
            order = "ritnmods-waterfill-02"
        },
        {
            -- nombre de remblais récupéré
            type = "int-setting",
            name = "ritnmods-waterfill-03",
            setting_type = "runtime-global",
            default_value = 1,
            minimum_value = 1,
            maximum_value = 200,
            order = "ritnmods-waterfill-03"
        }
    }

end