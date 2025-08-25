return {
    {
        "persistence.nvim",
        for_cat = "general.extra",
        event = "BufReadPre",
        keys = {
            {
                "<leader>qs",
                function()
                    require("persistence").load()
                end,
                mode = { "n" },
                desc = "Load Session",
            },
            {
                "<leader>qS",
                function()
                    require("persistence").select()
                end,
                mode = { "n" },
                desc = "Select Session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load({ last = true })
                end,
                mode = { "n" },
                desc = "Load Last Session",
            },
            {
                "<leader>qd",
                function()
                    require("persistence").stop()
                end,
                mode = { "n" },
                desc = "Stop Persistence",
            },
        },
        after = function(_)
            require("persistence").setup()
        end,
    },
}
