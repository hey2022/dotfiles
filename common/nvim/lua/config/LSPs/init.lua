if nixCats("lspDebugMode") then
    vim.lsp.set_log_level("debug")
end

-- NOTE: This file uses lzextras.lsp handler https://github.com/BirdeeHub/lzextras?tab=readme-ov-file#lsp-handler
-- This is a slightly more performant fallback function
-- for when you don't provide a filetype to trigger on yourself.
-- nixCats gives us the paths, which is faster than searching the rtp!
local old_ft_fallback = require("lze").h.lsp.get_ft_fallback()
require("lze").h.lsp.set_ft_fallback(function(name)
    local lspcfg = nixCats.pawsible({ "allPlugins", "opt", "nvim-lspconfig" })
        or nixCats.pawsible({ "allPlugins", "start", "nvim-lspconfig" })
    if lspcfg then
        local ok, cfg = pcall(dofile, lspcfg .. "/lsp/" .. name .. ".lua")
        if not ok then
            ok, cfg = pcall(dofile, lspcfg .. "/lua/lspconfig/configs/" .. name .. ".lua")
        end
        return (ok and cfg or {}).filetypes or {}
    else
        return old_ft_fallback(name)
    end
end)
require("lze").load({
    {
        "nvim-lspconfig",
        for_cat = "general.always",
        on_require = { "lspconfig" },
        -- NOTE: define a function for lsp,
        -- and it will run for all specs with type(plugin.lsp) == table
        -- when their filetype trigger loads them
        lsp = function(plugin)
            vim.lsp.config(plugin.name, plugin.lsp or {})
            vim.lsp.enable(plugin.name)
        end,
        before = function(_)
            vim.lsp.config("*", {
                on_attach = require("config.LSPs.on_attach"),
            })
        end,
    },
    {
        -- lazydev makes your lsp way better in your config without needing extra lsp configuration.
        "lazydev.nvim",
        for_cat = "languages.lua.neovim",
        cmd = { "LazyDev" },
        ft = "lua",
        after = function(_)
            require("lazydev").setup({
                library = {
                    { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. "/lua" },
                },
            })
        end,
    },
    {
        -- name of the lsp
        "lua_ls",
        enabled = nixCats("languages.lua.always") or nixCats("languages.lua.neovim"),
        -- provide a table containing filetypes,
        -- and then whatever your functions defined in the function type specs expect.
        -- in our case, it just expects the normal lspconfig setup options,
        -- but with a default on_attach and capabilities
        lsp = {
            -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
            filetypes = { "lua" },
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    formatters = {
                        ignoreComments = true,
                    },
                    signatureHelp = { enabled = true },
                    diagnostics = {
                        globals = { "nixCats", "vim" },
                        disable = { "missing-fields" },
                    },
                    telemetry = { enabled = false },
                },
            },
        },
        -- also these are regular specs and you can use before and after and all the other normal fields
    },
    {
        "clangd",
        for_cat = "languages.cpp",
        lsp = {
            filetpes = { "cpp", "c" },
        },
    },
    {
        "nixd",
        for_cat = "languages.nix",
        lsp = {
            filetypes = { "nix" },
            settings = {
                nixd = {
                    nixpkgs = {
                        expr = nixCats.extra("nixdExtras.nixpkgs"),
                    },
                    options = {
                        nixos = {
                            expr = nixCats.extra("nixdExtras.nixos_options"),
                        },
                        ["home-manager"] = {
                            expr = nixCats.extra("nixdExtras.home_manager_options"),
                        },
                    },
                    formatting = {
                        command = { "nixfmt" },
                    },
                    diagnostic = {
                        suppress = {
                            "sema-escaping-with",
                        },
                    },
                },
            },
        },
    },
    {
        "rust_analyzer",
        for_cat = "languages.rust",
        lsp = {
            filetypes = {
                "rust",
            },
        },
    },
})
