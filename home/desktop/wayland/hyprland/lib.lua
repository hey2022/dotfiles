local cfg = require("config")
local lib = {}

function lib.wrap_exec_cmd(cmd, opts)
    opts = opts or {}
    local uwsm_cmd = cmd
    if cfg.uwsm and opts.uwsm then
        if opts.scoped then
            uwsm_cmd = "runapp --scope -- " .. cmd
        else
            uwsm_cmd = "runapp -- " .. cmd
        end
    end

    local proc_name = opts.program or string.match(cmd, "%S+")

    local wrapped_cmd = uwsm_cmd
    if opts.toggle then
        wrapped_cmd = "pkill -x " .. proc_name .. " || " .. uwsm_cmd
    elseif opts.run_once then
        wrapped_cmd = "pgrep -x " .. proc_name .. " || " .. uwsm_cmd
    end

    opts.program = nil
    opts.run_once = nil
    opts.scoped = nil
    opts.toggle = nil
    opts.uwsm = nil
    return wrapped_cmd, opts
end

function lib.exec(cmd, opts)
    local warpped_cmd, rules = lib.wrap_exec_cmd(cmd, opts)
    return hl.dsp.exec_cmd(warpped_cmd, rules)
end

function lib.bind(keys, dispatcher, opts)
    local function wrap_key(key)
        if key:match("^XF86") then
            return key
        else
            return cfg.mainMod .. " + " .. key
        end
    end

    if type(keys) == "table" then
        for _, key in ipairs(keys) do
            hl.bind(wrap_key(key), dispatcher, opts)
        end
    else
        hl.bind(wrap_key(keys), dispatcher, opts)
    end
end

return lib
