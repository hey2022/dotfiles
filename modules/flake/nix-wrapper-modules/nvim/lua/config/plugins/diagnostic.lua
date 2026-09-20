return {
    {
        "trouble.nvim",
        auto_enable = true,
        after = function()
            require("trouble").setup()
        end,
        cmd = "Trouble",
        keys = {
            {
                "<leader>cd",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>cD",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>tt",
                "<cmd>Trouble todo toggle<cr>",
                desc = "Toggle todo list",
            },
        },
    },
    {
        "todo-comments.nvim",
        auto_enable = true,
        dep_of = { "trouble.nvim" },
        after = function()
            require("todo-comments").setup()
        end,
    },
}
