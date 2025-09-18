return {
    {
        "vimtex",
        for_cat = "latex",
        after = function(_)
            vim.g.vimtex_view_method = "zathura"
        end,
    },
}
