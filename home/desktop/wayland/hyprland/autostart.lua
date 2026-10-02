local cfg = require("config")
local lib = require("lib")
local function exec(cmd, opts)
    if opts.uwsm == nil then
        opts.uwsm = true
    end
    if opts.scoped == nil then
        opts.scoped = true
    end
    local wrapped_cmd, rules = lib.wrap_exec_cmd(cmd, opts)
    return hl.exec_cmd(wrapped_cmd, rules)
end

hl.on("hyprland.start", function()
    exec("xrdb -merge " .. cfg.xresources_path, { uwsm = false })
end)
