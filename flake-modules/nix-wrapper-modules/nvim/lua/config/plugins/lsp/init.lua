-- if nixCats("lspDebugMode") then
--     vim.lsp.set_log_level("debug")
-- end
return {
    {
        "nvim-lspconfig",
        for_cat = "lsp",
        on_require = { "lspconfig" },
        -- NOTE: define a function for lsp,
        -- and it will run for all specs with type(plugin.lsp) == table
        -- when their filetype trigger loads them
        lsp = function(plugin)
            vim.lsp.config(plugin.name, plugin.lsp or {})
            vim.lsp.enable(plugin.name)
        end,
        before = function(_)
            -- BUG: https://github.com/neovim/nvim-lspconfig/issues/3827
            -- vim.lsp.config("*", {
            --     on_attach = require("config.LSPs.on_attach"),
            -- })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local bufnr = args.buf
                    require("config.plugins.lsp.on_attach")(client, bufnr)
                end,
            })
        end,
    },
    {
        -- lazydev makes your lsp way better in your config without needing extra lsp configuration.
        "lazydev.nvim",
        for_cat = "lsp",
        cmd = { "LazyDev" },
        ft = "lua",
        after = function(_)
            require("lazydev").setup({
                library = {
                    { words = { "nixInfo%.lze" }, path = nixInfo("lze", "plugins", "start", "lze") .. "/lua" },
                    {
                        words = { "nixInfo%.lze" },
                        path = nixInfo("lzextras", "plugins", "start", "lzextras") .. "/lua",
                    },
                },
            })
        end,
    },
    {
        -- name of the lsp
        "lua_ls",
        for_cat = "lsp",
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
                        globals = { "nixInfo", "vim" },
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
        for_cat = "lsp",
        lsp = {
            filetypes = { "cpp", "c" },
        },
    },
    {
        "nixd",
        for_cat = "lsp",
        lsp = {
            filetypes = { "nix" },
            settings = {
                nixd = {
                    nixpkgs = {
                        expr = nixInfo(nil, "info", "nix", "nixpkgs"),
                    },
                    options = {
                        nixos = {
                            expr = nixInfo(nil, "info", "nix", "nixos_options"),
                        },
                        ["home-manager"] = {
                            expr = nixInfo(nil, "info", "nix", "home_manager_options"),
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
        "basedpyright",
        for_cat = "lsp",
        lsp = {
            filetypes = { "python" },
        },
    },
    {
        "glsl_analyzer",
        for_cat = "lsp",
        lsp = {
            filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
        },
    },
    {
        "qmlls",
        for_cat = "lsp",
        lsp = {
            filetypes = { "qml" },
        },
    },
}
