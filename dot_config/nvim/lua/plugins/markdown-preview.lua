return {
    "iamcco/markdown-preview.nvim",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function ()
        vim.g.mkdp_browser = "/usr/bin/librewolf"
        vim.g.mkdp_theme = "dark"
    end,
}
