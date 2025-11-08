return {
    {
        "hardtime.nvim",
        for_cat = "general.extra",
        event = "DeferredUIEnter",
        after = function(_)
            require("hardtime").setup()
        end,
    },
    {
        "nui.nvim",
        for_cat = "general.extra",
        dep_of = { "hardtime.nvim" },
    },
}
