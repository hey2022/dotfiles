_G.nixInfo = require(vim.g.nix_info_plugin_name)

---@module 'lzextras'
---@type lzextras | lze
nixInfo.lze = setmetatable(require("lze"), getmetatable(require("lzextras")))

function nixInfo.get_nix_plugin_path(name)
    return nixInfo(nil, "plugins", "lazy", name) or nixInfo(nil, "plugins", "start", name)
end
nixInfo.lze.register_handlers({
    {
        -- adds an `auto_enable` field to lze specs
        -- if true, will disable it if not installed by nix.
        -- if string, will disable if that name was not installed by nix.
        -- if a table of strings, it will disable if any were not.
        spec_field = "auto_enable",
        set_lazy = false,
        modify = function(plugin)
            if type(plugin.auto_enable) == "table" then
                for _, name in pairs(plugin.auto_enable) do
                    if not nixInfo.get_nix_plugin_path(name) then
                        plugin.enabled = false
                        break
                    end
                end
            elseif type(plugin.auto_enable) == "string" then
                if not nixInfo.get_nix_plugin_path(plugin.auto_enable) then
                    plugin.enabled = false
                end
            elseif type(plugin.auto_enable) == "boolean" and plugin.auto_enable then
                if not nixInfo.get_nix_plugin_path(plugin.name) then
                    plugin.enabled = false
                end
            end
            return plugin
        end,
    },
    {
        -- we made an options.settings.cats with the value of enable for our top level specs
        -- give for_cat = "name" to disable if that one is not enabled
        spec_field = "for_cat",
        set_lazy = false,
        modify = function(plugin)
            if type(plugin.for_cat) == "string" then
                plugin.enabled = nixInfo(false, "settings", "cats", plugin.for_cat)
            end
            return plugin
        end,
    },
    -- From lzextras. This one makes it so that
    -- you can set up lsps within lze specs,
    -- and trigger lspconfig setup hooks only on the correct filetypes
    -- It is (unfortunately) important that it be registered after the above 2,
    -- as it also relies on the modify hook, and the value of enabled at that point
    nixInfo.lze.lsp,
})

-- NOTE: This config uses lzextras.lsp handler https://github.com/BirdeeHub/lzextras?tab=readme-ov-file#lsp-handler
-- Because we have the paths, we can set a more performant fallback function
-- for when you don't provide a filetype to trigger on yourself.
-- If you do provide a filetype, this will never be called.
nixInfo.lze.h.lsp.set_ft_fallback(function(name)
    local lspcfg = nixInfo.get_nix_plugin_path("nvim-lspconfig")
    if lspcfg then
        local ok, cfg = pcall(dofile, lspcfg .. "/lsp/" .. name .. ".lua")
        return (ok and cfg or {}).filetypes or {}
    else
        -- the less performant thing we are trying to avoid at startup
        return (vim.lsp.config[name] or {}).filetypes or {}
    end
end)
