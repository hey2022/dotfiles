return {
    {
        "quarto-nvim",
        for_cat = "languages.quarto",
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
