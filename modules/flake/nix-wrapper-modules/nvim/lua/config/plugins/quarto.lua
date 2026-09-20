return {
    {
        "quarto-nvim",
        for_cat = "quarto",
        ft = "quarto",
        after = function(_)
            require("quarto").setup()
        end,
    },
    {
        "otter.nvim",
        auto_enable = true,
        on_plugin = { "quarto-nvim" },
    },
}
