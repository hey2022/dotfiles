return {
    {
        "obsidian.nvim",
        for_cats = "zettelkasten",
        ft = "markdown",
        keys = {
            { "<leader>oo", "<cmd>Obsidian<cr>", desc = "Obsidian", mode = { "n", "v" } },
            { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "View backlinks" },
            { "<leader>oe", "<cmd>Obsidian extract_note<cr>", desc = "Extract note", mode = "v" },
            { "<leader>oll", "<cmd>Obsidian link<cr>", desc = "Link to existing note", mode = "v" },
            { "<leader>oln", "<cmd>Obsidian link_new<cr>", desc = "Create new link", mode = "v" },
            { "<leader>olf", "<cmd>Obsidian links<cr>", desc = "View links" },
            { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
            { "<leader>oO", "<cmd>Obsidian open<cr>", desc = "Open in obsidian" },
            { "<leader>op", "<cmd>Obsidian paste_image<cr>", desc = "Paste image" },
            { "<leader>off", "<cmd>Obsidian quick_switch<cr>", desc = "Find notes" },
            { "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
            { "<leader>ofg", "<cmd>Obsidian search<cr>", desc = "Grep notes" },
            { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "View tags" },
            { "<leader>ow", "<cmd>Obsidian workspace<cr>", desc = "Switch workspace" },
        },
        after = function(_)
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "personal",
                        path = "~/documents/vaults/personal",
                    },
                },
                legacy_commands = false,
                wiki_link_func = "use_alias_only",
                note_id_func = function(title)
                    if title ~= nil then
                        return title:gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        return tostring(os.time())
                    end
                end,
                disable_frontmatter = true,
                completion = {
                    nvim_cmp = false,
                    blink = true,
                    min_chars = 0,
                },
                ui = {
                    enable = false,
                },
            })
        end,
    },
}
