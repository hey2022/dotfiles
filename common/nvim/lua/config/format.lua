require("lze").load({
    {
        "conform.nvim",
        for_cat = "format",
        -- cmd = { "" },
        -- event = "",
        ft = { "stylua", "nix" },
        keys = {
            { "<leader>FF", desc = "[F]ormat [F]ile" },
        },
        -- colorscheme = "",
        after = function(plugin)
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    -- NOTE: download some formatters in lspsAndRuntimeDeps
                    -- and configure them here
                    -- Conform will run multiple formatters sequentially
                    -- python = { "isort", "black" },
                    -- Use a sub-list to run only the first available formatter
                    -- javascript = { { "prettierd", "prettier" } },
                    cpp = { "clang-format" },
                    css = { "prettier" },
                    json = { "prettier" },
                    lua = { "stylua" },
                    nix = { "nixfmt" },
                    tex = { "tex-fmt" },
                    yaml = { "yamlfmt" },
                    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                },
                format_on_save = {
                    lsp_format = "fallback",
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>FF", function()
                conform.format({
                    lsp_format = "fallback",
                })
            end, { desc = "[F]ormat [F]ile" })
        end,
    },
})
