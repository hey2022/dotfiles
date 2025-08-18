return {
    {
        "obsidian.nvim",
        for_cats = "zettelkasten",
        ft = "markdown",
        after = function(_)
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                },
                legacy_commands = false,
            })
        end,
    },
}
