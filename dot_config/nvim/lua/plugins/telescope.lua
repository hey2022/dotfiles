return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
        { "<leader>fa", "<cmd>Telescope find_files hidden=true<CR>", desc = "Telescope Find Hidden Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope Find" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope Find Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope Find Help" },
    },
}
