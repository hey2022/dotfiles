return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    opts = {
        load = {
            -- Loads default behaviour
            ["core.defaults"] = {},
            -- Adds pretty icons to your documents
            ["core.concealer"] = {},
            ["core.export"] = {},
            -- Manages Neorg workspaces
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/notes",
                    },
                    default_workspace = "notes",
                },
            },
        },
    },
}
