return {
    {
        "neogit",
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
