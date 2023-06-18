return {
    "folke/trouble.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble Toggle" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble Toggle Workspace Diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble Toggle Document Diagnostics" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble Toggle Loc List" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble Toggle Quick Fix" },
        { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble Toogle Lsp References" },
    },
    config = true,
}
