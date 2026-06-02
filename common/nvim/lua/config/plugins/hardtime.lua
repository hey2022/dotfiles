return {
    {
        "hardtime.nvim",
        for_cat = "general.extra",
        event = "DeferredUIEnter",
        after = function(_)
            require("hardtime").setup({
                disable_mouse = false,
            })
        end,
    },
    {
        "nui.nvim",
        for_cat = "general.extra",
        dep_of = { "hardtime.nvim" },
    },
}
