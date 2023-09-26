return {
    "iamcco/markdown-preview.nvim",
    build = function ()
        vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    config = function ()
        vim.keymap.set("n", "<leader>p", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown Preview Toggle" })
        vim.g.mkdp_theme = "dark"
    end,
}
