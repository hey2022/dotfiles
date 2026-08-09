nixInfo.lze.load({
    { import = "config.plugins.ai" },
    { import = "config.plugins.colorscheme" },
    { import = "config.plugins.completion" },
    { import = "config.plugins.debug" },
    { import = "config.plugins.files" },
    { import = "config.plugins.format" },
    { import = "config.plugins.hardtime" },
    { import = "config.plugins.latex" },
    { import = "config.plugins.lint" },
    { import = "config.plugins.lsp" },
    { import = "config.plugins.markdown" },
    { import = "config.plugins.navigation" },
    { import = "config.plugins.neogit" },
    { import = "config.plugins.notification" },
    { import = "config.plugins.obsidian" },
    { import = "config.plugins.org-mode" },
    { import = "config.plugins.quarto" },
    { import = "config.plugins.rust" },
    { import = "config.plugins.session" },
    { import = "config.plugins.telescope" },
    { import = "config.plugins.treesitter" },
    { import = "config.plugins.typst" },
    { import = "config.plugins.vim-tmux-navigator" },
    {
        "undotree",
        auto_enable = true,
        cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
        keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
        before = function(_)
            vim.g.undotree_WindowLayout = 1
            vim.g.undotree_SplitWidth = 40
        end,
    },
    {
        "comment.nvim",
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(plugin)
            require("Comment").setup()
        end,
    },
    {
        "indent-blankline.nvim",
        auto_enable = true,
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
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(plugin)
            require("nvim-surround").setup()
        end,
    },
    {
        "nvim-autopairs",
        auto_enable = true,
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
        auto_enable = true,
        cmd = { "StartupTime" },
        before = function(_)
            vim.g.startuptime_event_width = 0
            vim.g.startuptime_tries = 10
            vim.g.startuptime_exe_path = nixInfo(vim.v.progpath, "progpath")
        end,
    },
    {
        "fidget.nvim",
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(plugin)
            require("fidget").setup({})
        end,
    },
    -- {
    --   "hlargs",
    --   for_cat = 'general.extra',
    --   event = "DeferredUIEnter",
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
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(plugin)
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    theme = nixInfo(nil, "settings", "colorscheme"),
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
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(_)
            require("barbar").setup({})
        end,
    },
    {
        "gitsigns.nvim",
        auto_enable = true,
        event = "DeferredUIEnter",
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
        auto_enable = true,
        event = "DeferredUIEnter",
        after = function(plugin)
            require("which-key").setup({})
            require("which-key").add({
                { "<leader><leader>", group = "buffer commands" },
                { "<leader>F", group = "Format" },
                { "<leader>c", group = "Code" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>m", group = "Markdown" },
                { "<leader>o", group = "Org" },
                { "<leader>q", group = "Persistence" },
                { "<leader>s", group = "Search" },
                { "<leader>t", group = "Toggles" },
                { "<leader>w", group = "Workspace" },
                { "<leader>z", group = "Obsidian" },
            })
        end,
    },
    {
        "nvim-spectre",
        auto_enable = true,
        event = "DeferredUIEnter",
        keys = {
            {
                "<leader>ss",
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
