return {
    {
        "nvim-lint",
        for_cat = "lint",
        event = "FileType",
        after = function(plugin)
            require("lint").linters_by_ft = {
                -- NOTE: download some linters in lspsAndRuntimeDeps
                -- and configure them here
                -- markdown = {'vale',},
                -- javascript = { 'eslint' },
                -- typescript = { 'eslint' },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
