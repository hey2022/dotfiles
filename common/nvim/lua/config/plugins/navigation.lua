return {
    {
        "flash.nvim",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        after = function(_)
            require("flash").setup({
                modes = {
                    search = {
                        enabled = true,
                    },
                },
            })
        end,
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    {
        "aerial.nvim",
        for_cat = "general.extra",
        after = function(_)
            require("aerial").setup({
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })
        end,
        keys = {
            {
                "<leader>co",
                function()
                    require("aerial").toggle()
                end,
                desc = "Toggle aerial outline",
            },
        },
    },
}
