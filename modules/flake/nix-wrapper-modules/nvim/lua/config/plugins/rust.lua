return {
    {
        "rustaceanvim",
        for_cat = "rust",
        before = function(_)
            vim.g.rustaceanvim = {
                server = {
                    on_attach = require("config.plugins.lsp.on_attach"),
                },
            }
        end,
    },
}
