local load_w_after = function(name)
    vim.cmd.packadd(name)
    vim.cmd.packadd(name .. "/after")
end

return {
    {
        "cmp-cmdline",
        for_cat = "general.blink",
        on_plugin = { "blink.cmp" },
        load = load_w_after,
    },
    {
        "blink.compat",
        for_cat = "general.blink",
        dep_of = { "cmp-cmdline" },
    },
    {
        "friendly-snippets",
        for_cat = "general.blink",
        dep_of = { "luasnip" },
    },
    {
        "luasnip",
        for_cat = "general.blink",
        dep_of = { "blink.cmp" },
        after = function(_)
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").lazy_load({ paths = nixCats.configDir .. "/luasnip" })
            luasnip.config.setup({
                enable_autosnippets = true,
                update_events = { "TextChanged", "TextChangedI" },
            })

            local ls = require("luasnip")

            vim.keymap.set({ "i", "s" }, "<M-n>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
        end,
    },
    {
        "colorful-menu.nvim",
        for_cat = "general.blink",
        on_plugin = { "blink.cmp" },
    },
    {
        "supermaven-nvim",
        for_cat = "general.blink",
        dep_of = { "blink.cmp" },
        after = function(_)
            require("supermaven-nvim").setup({})
        end,
    },
    {
        "blink.cmp",
        for_cat = "general.blink",
        event = "DeferredUIEnter",
        after = function(_)
            require("blink.cmp").setup({
                keymap = {
                    preset = "default",
                },
                cmdline = {
                    enabled = true,
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                    },
                    sources = function()
                        local type = vim.fn.getcmdtype()
                        -- Search forward and backward
                        if type == "/" or type == "?" then
                            return { "buffer" }
                        end
                        -- Commands
                        if type == ":" or type == "@" then
                            return { "cmdline", "cmp_cmdline" }
                        end
                        return {}
                    end,
                },
                fuzzy = {
                    sorts = {
                        "score",
                        "sort_text",
                    },
                },
                signature = {
                    enabled = true,
                    window = {
                        show_documentation = true,
                    },
                },
                completion = {
                    menu = {
                        draw = {
                            treesitter = { "lsp" },
                            components = {
                                label = {
                                    text = function(ctx)
                                        return require("colorful-menu").blink_components_text(ctx)
                                    end,
                                    highlight = function(ctx)
                                        return require("colorful-menu").blink_components_highlight(ctx)
                                    end,
                                },
                            },
                        },
                    },
                    documentation = {
                        auto_show = true,
                    },
                },
                snippets = {
                    preset = "luasnip",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer", "omni" },
                    providers = {
                        path = {
                            score_offset = 50,
                        },
                        lsp = {
                            score_offset = 40,
                        },
                        snippets = {
                            score_offset = 40,
                        },
                        cmp_cmdline = {
                            name = "cmp_cmdline",
                            module = "blink.compat.source",
                            score_offset = -100,
                            opts = {
                                cmp_name = "cmdline",
                            },
                        },
                    },
                },
            })
        end,
    },
}
