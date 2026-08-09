return {
    {
        "hardtime.nvim",
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(_)
            require("hardtime").setup({
                disable_mouse = false,
            })
        end,
    },
    {
        "nui.nvim",
        auto_enable = true,
        dep_of = { "hardtime.nvim" },
    },
}
