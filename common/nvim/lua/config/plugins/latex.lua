return {
    {
        "vimtex",
        for_cat = "languages.latex",
        after = function(_)
            vim.g.vimtex_view_method = "sioyek"
        end,
    },
}
