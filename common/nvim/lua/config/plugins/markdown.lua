return {
    {
        "render-markdown.nvim",
        for_cat = "languages.markdown",
        ft = "markdown",
        after = function(_)
            require("render-markdown").setup({})
        end,
    },
    {
        "markdown-preview.nvim",
        for_cat = "languages.markdown",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
        ft = "markdown",
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview <CR>", mode = { "n" }, noremap = true, desc = "markdown preview" },
            {
                "<leader>ms",
                "<cmd>MarkdownPreviewStop <CR>",
                mode = { "n" },
                noremap = true,
                desc = "markdown preview stop",
            },
            {
                "<leader>mt",
                "<cmd>MarkdownPreviewToggle <CR>",
                mode = { "n" },
                noremap = true,
                desc = "markdown preview toggle",
            },
        },
        before = function(plugin)
            vim.g.mkdp_auto_close = 0
        end,
    },
}
