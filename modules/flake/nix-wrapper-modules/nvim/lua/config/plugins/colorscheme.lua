return {
    {
        "trigger_colorscheme",
        event = "VimEnter",
        load = function(_name)
            vim.schedule(function()
                vim.cmd.colorscheme(nixInfo(nil, "settings", "colorscheme"))
            end)
        end,
    },
    {
        "catppuccin-nvim",
        auto_enable = true,
        colorscheme = {
            "catppuccin-nvim",
            "catppuccin-latte",
            "catppuccin-frappe",
            "catppuccin-macchiato",
            "catppuccin-mocha",
        },
    },
}
