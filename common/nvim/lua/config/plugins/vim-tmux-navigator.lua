return {
    {
        "vim-tmux-navigator",
        for_cat = "general.always",
        keys = {
            { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
