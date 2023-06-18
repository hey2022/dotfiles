return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    keys = {
        { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
        { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "NvimTree Find File"},
    },
    config = true,
}
