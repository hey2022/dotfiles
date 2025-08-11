return {
    {
        "NeogitOrg/neogit",
        for_cat = "git",
        on_require = { "neogit" },
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
