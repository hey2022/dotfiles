return {
    {
        "typst-preview.nvim",
        for_cat = "typst",
        ft = "typ",
        after = function(_)
            require("typst-preview").setup({})
            vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreview<CR>", { noremap = true, desc = "typst preview" })
        end,
    },
}
