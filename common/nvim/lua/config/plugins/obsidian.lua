return {
    {
        "obsidian.nvim",
        for_cats = "obsidian",
        keys = {
            { "<leader>zz", "<cmd>Obsidian<cr>", desc = "Obsidian", mode = { "n", "v" } },
            { "<leader>zb", "<cmd>Obsidian backlinks<cr>", desc = "View backlinks" },
            { "<leader>ze", "<cmd>Obsidian extract_note<cr>", desc = "Extract note", mode = "v" },
            { "<leader>zll", "<cmd>Obsidian link<cr>", desc = "Link to existing note", mode = "v" },
            { "<leader>zln", "<cmd>Obsidian link_new<cr>", desc = "Create new link", mode = "v" },
            { "<leader>zlf", "<cmd>Obsidian links<cr>", desc = "View links" },
            { "<leader>zn", "<cmd>Obsidian new<cr>", desc = "New note" },
            { "<leader>zo", "<cmd>Obsidian open<cr>", desc = "Open in obsidian" },
            { "<leader>zp", "<cmd>Obsidian paste_image<cr>", desc = "Paste image" },
            { "<leader>zf", "<cmd>Obsidian quick_switch<cr>", desc = "Find notes" },
            { "<leader>zr", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
            { "<leader>zg", "<cmd>Obsidian search<cr>", desc = "Grep notes" },
            { "<leader>zt", "<cmd>Obsidian tags<cr>", desc = "View tags" },
            { "<leader>zw", "<cmd>Obsidian workspace<cr>", desc = "Switch workspace" },
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
                        return title:sub(1, 1):upper() .. title:sub(2):lower()
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
