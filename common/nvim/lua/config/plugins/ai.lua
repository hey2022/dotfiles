return {
    {
        "supermaven-nvim",
        for_cat = "general.ai",
        after = function(_)
            require("supermaven-nvim").setup({})
            vim.keymap.set("n", "<leader>Ct", function()
                require("supermaven-nvim.api").toggle()
            end, { desc = "Toggle SuperMaven" })
        end,
    },
}
