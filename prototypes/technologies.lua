data:extend({

    {
        type = "technology",
        name = "waterfill",
        icon = "__RitnWaterfill__/graphics/waterfill.png",
        prerequisites = {"landfill"},
        icon_size = 128, icon_mipmaps = 5,
        unit =
        {
        count = 50,
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
        },
        time = 30
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "waterfill"
            },
        },
        order = "b-d"
    },
    {
        type = "technology",
        name = "waterfill-dark",
        icons = {
            {
              icon = "__RitnWaterfill__/graphics/waterfill.png",
              icon_size = 128, 
              icon_mipmaps = 5,
              tint = { a = 1,  b = 0.8, g = 0.4, r = 0 }
            }
        },
        prerequisites = {"waterfill"},
        unit =
        {
        count = 50,
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
        },
        time = 30
        },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "waterfill-dark"
            }
        },
        order = "b-e"
    }

})