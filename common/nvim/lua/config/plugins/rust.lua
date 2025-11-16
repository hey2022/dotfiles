return {
    {
        "rustaceanvim",
        for_cat = "languages.rust",
        before = function(_)
            vim.g.rustaceanvim = {
                server = {
                    on_attach = require("config.LSPs.on_attach"),
                },
            }
        end,
    },
}
