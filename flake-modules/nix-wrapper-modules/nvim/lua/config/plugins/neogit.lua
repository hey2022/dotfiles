return {
    {
        "neogit",
        auto_enable = true,
        keys = {
            {
                "<leader>gg",
                function()
                    require("neogit").open()
                end,
                mode = { "n" },
                desc = "Open neogit",
            },
        },
    },
}
