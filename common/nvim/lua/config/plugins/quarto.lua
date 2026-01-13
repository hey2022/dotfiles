return {
    {
        "quarto-nvim",
        for_cat = "languages.statistics",
        ft = "quarto",
        after = function(_)
            require("quarto").setup()
        end,
    },
    {
        "otter.nvim",
        deps_of = { "quarto-nvim" },
    },
}
