return {
    {
        "nvim-notify",
        auto_enable = true,
        after = function()
            local notify = require("notify")
            notify.setup({
                on_open = function(win)
                    vim.api.nvim_win_set_config(win, { focusable = false })
                end,
            })
            vim.notify = notify
            vim.keymap.set("n", "<Esc>", function()
                notify.dismiss({ silent = true })
                vim.cmd("nohlsearch")
            end, { desc = "dismiss notify popup and clear hlsearch" })
        end,
    },
}
