local colorschemeName = nixCats("colorscheme")
-- Could I lazy load on colorscheme with lze?
-- sure. But I was going to call vim.cmd.colorscheme() during startup anyway
-- this is just an example, feel free to do a better job!
vim.cmd.colorscheme(colorschemeName)

local ok, notify = pcall(require, "notify")
if ok then
    notify.setup({
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { focusable = false })
        end,
    })
    vim.notify = notify
    vim.keymap.set("n", "<Esc>", function()
        notify.dismiss({ silent = true })
    end, { desc = "dismiss notify popup and clear hlsearch" })
end

-- NOTE: you can check if you included the category with the thing wherever you want.
if nixCats("general.extra") then
    -- I didnt want to bother with lazy loading this.
    -- I could put it in opt and put it in a spec anyway
    -- and then not set any handlers and it would load at startup,
    -- but why... I guess I could make it load
    -- after the other lze definitions in the next call using priority value?
    -- didnt seem necessary.
    vim.g.loaded_netrwPlugin = 1
    require("oil").setup({
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
        },
        columns = {
            "icon",
            "permissions",
            "size",
            -- "mtime",
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
    })
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, desc = "Open Parent Directory" })
    vim.keymap.set("n", "<leader>-", "<cmd>Oil .<CR>", { noremap = true, desc = "Open nvim root directory" })
end

require("lze").load({
    { import = "config.plugins.ai" },
    { import = "config.plugins.completion" },
    { import = "config.plugins.latex" },
    { import = "config.plugins.markdown" },
    { import = "config.plugins.neogit" },
    { import = "config.plugins.obsidian" },
    { import = "config.plugins.org-mode" },
    { import = "config.plugins.quarto" },
    { import = "config.plugins.session" },
    { import = "config.plugins.telescope" },
    { import = "config.plugins.treesitter" },
    { import = "config.plugins.typst" },
    { import = "config.plugins.vim-tmux-navigator" },
    {
        "undotree",
        for_cat = "general.extra",
        cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
        keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
        before = function(_)
            vim.g.undotree_WindowLayout = 1
            vim.g.undotree_SplitWidth = 40
        end,
    },
    {
        "comment.nvim",
        for_cat = "general.extra",
        event = "DeferredUIEnter",
        after = function(plugin)
            require("Comment").setup()
        end,
    },
    {
        "indent-blankline.nvim",
        for_cat = "general.extra",
        event = "DeferredUIEnter",
        after = function(plugin)
            require("ibl").setup({
                exclude = {
                    filetypes = {
                        "dashboard",
                    },
                },
            })
        end,
    },
    {
        "nvim-surround",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        -- keys = "",
        after = function(plugin)
            require("nvim-surround").setup()
        end,
    },
    {
        "nvim-autopairs",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        after = function(plugin)
            local npairs = require("nvim-autopairs")
            local Rule = require("nvim-autopairs.rule")

            npairs.setup()
            npairs.add_rules({
                Rule("$", "$", "tex"),
                Rule("\\(", "\\)", "tex"),
                Rule("\\[", "\\]", "tex"),
            })
        end,
    },
    {
        "vim-startuptime",
        for_cat = "general.extra",
        cmd = { "StartupTime" },
        before = function(_)
            vim.g.startuptime_event_width = 0
            vim.g.startuptime_tries = 10
            vim.g.startuptime_exe_path = nixCats.packageBinPath
        end,
    },
    {
        "fidget.nvim",
        for_cat = "general.extra",
        event = "DeferredUIEnter",
        -- keys = "",
        after = function(plugin)
            require("fidget").setup({})
        end,
    },
    -- {
    --   "hlargs",
    --   for_cat = 'general.extra',
    --   event = "DeferredUIEnter",
    --   -- keys = "",
    --   dep_of = { "nvim-lspconfig" },
    --   after = function(plugin)
    --     require('hlargs').setup {
    --       color = '#32a88f',
    --     }
    --     vim.cmd([[hi clear @lsp.type.parameter]])
    --     vim.cmd([[hi link @lsp.type.parameter Hlargs]])
    --   end,
    -- },
    {
        "lualine.nvim",
        for_cat = "general.always",
        -- cmd = { "" },
        event = "DeferredUIEnter",
        -- ft = "",
        -- keys = "",
        -- colorscheme = "",
        after = function(plugin)
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    theme = colorschemeName,
                    component_separators = "|",
                    section_separators = "",
                },
                sections = {
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                            status = true,
                        },
                    },
                },
                inactive_sections = {
                    lualine_b = {
                        {
                            "filename",
                            path = 3,
                            status = true,
                        },
                    },
                    lualine_x = { "filetype" },
                },
                -- tabline = {
                --     lualine_a = { "buffers" },
                --     -- if you use lualine-lsp-progress, I have mine here instead of fidget
                --     -- lualine_b = { 'lsp_progress', },
                --     lualine_z = { "tabs" },
                -- },
            })
        end,
    },
    {
        "barbar.nvim",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        after = function(_)
            require("barbar").setup({})
        end,
    },
    {
        "gitsigns.nvim",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        -- cmd = { "" },
        -- ft = "",
        -- keys = "",
        -- colorscheme = "",
        after = function(plugin)
            require("gitsigns").setup({
                -- See `:help gitsigns.txt`
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map({ "n", "v" }, "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to next hunk" })

                    map({ "n", "v" }, "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Jump to previous hunk" })

                    -- Actions
                    -- visual mode
                    map("v", "<leader>hs", function()
                        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end, { desc = "stage git hunk" })
                    map("v", "<leader>hr", function()
                        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end, { desc = "reset git hunk" })
                    -- normal mode
                    map("n", "<leader>gs", gs.stage_hunk, { desc = "git stage hunk" })
                    map("n", "<leader>gr", gs.reset_hunk, { desc = "git reset hunk" })
                    map("n", "<leader>gS", gs.stage_buffer, { desc = "git Stage buffer" })
                    map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
                    map("n", "<leader>gR", gs.reset_buffer, { desc = "git Reset buffer" })
                    map("n", "<leader>gp", gs.preview_hunk, { desc = "preview git hunk" })
                    map("n", "<leader>gb", function()
                        gs.blame_line({ full = false })
                    end, { desc = "git blame line" })
                    map("n", "<leader>gd", gs.diffthis, { desc = "git diff against index" })
                    map("n", "<leader>gD", function()
                        gs.diffthis("~")
                    end, { desc = "git diff against last commit" })

                    -- Toggles
                    map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "toggle git blame line" })
                    map("n", "<leader>gtd", gs.toggle_deleted, { desc = "toggle git show deleted" })

                    -- Text object
                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
                end,
            })
            vim.cmd([[hi GitSignsAdd guifg=#04de21]])
            vim.cmd([[hi GitSignsChange guifg=#83fce6]])
            vim.cmd([[hi GitSignsDelete guifg=#fa2525]])
        end,
    },
    {
        "which-key.nvim",
        for_cat = "general.extra",
        -- cmd = { "" },
        event = "DeferredUIEnter",
        -- ft = "",
        -- keys = "",
        -- colorscheme = "",
        after = function(plugin)
            require("which-key").setup({})
            require("which-key").add({
                { "<leader><leader>", group = "buffer commands" },
                { "<leader><leader>_", hidden = true },
                { "<leader>c", group = "[c]ode" },
                { "<leader>c_", hidden = true },
                { "<leader>g", group = "[g]it" },
                { "<leader>g_", hidden = true },
                { "<leader>m", group = "[m]arkdown" },
                { "<leader>m_", hidden = true },
                { "<leader>s", group = "[s]earch" },
                { "<leader>s_", hidden = true },
                { "<leader>t", group = "[t]oggles" },
                { "<leader>t_", hidden = true },
                { "<leader>w", group = "[w]orkspace" },
                { "<leader>w_", hidden = true },
            })
        end,
    },
    {
        "nvim-spectre",
        for_cat = "general.always",
        event = "DeferredUIEnter",
        keys = {
            {
                "<leader>S",
                function()
                    require("spectre").toggle()
                end,
                { desc = "Toggle Spectre" },
            },
            {
                "<leader>sw",
                function()
                    require("spectre").open_visual({ select_word = true })
                end,
                { desc = "Search current word" },
            },
            {
                "<leader>sw",
                function()
                    require("spectre").open_visual()
                end,
                mode = "v",
                { desc = "Search current word" },
            },
            {
                "<leader>sp",
                function()
                    require("spectre").open_file_search({ select_word = true })
                end,
                { desc = "Search on current file" },
            },
        },
        after = function(plugin)
            require("spectre").setup({})
        end,
    },
})
