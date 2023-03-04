
    data:extend {

        {
            -- Activation du mode check d'entité
            type = "bool-setting",
            name = "ritnmods-waterfill-00",
            setting_type = "startup",
            default_value = true,
            order = "ritnmods-waterfill-00"
        },

        {
            -- Activation du bonus landfill
            type = "bool-setting",
            name = "ritnmods-waterfill-01",
            setting_type = "runtime-global",
            default_value = true,
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

