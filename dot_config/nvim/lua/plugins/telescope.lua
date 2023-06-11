return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>" },
        { "<leader>fg", ":Telescope live_grep<CR>" },
        { "<leader>fb", ":Telescope buffers<CR>" },
        { "<leader>fh", ":Telescope help_tags<CR>" },
    },
}
