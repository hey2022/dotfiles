local lib = require("lib")
local bind = lib.bind
local exec = lib.exec

bind("V", hl.dsp.window.float({ action = "toggle" }))
bind("Q", hl.dsp.window.close())
bind("SHIFT + Q", exec("hyprctl activewindow -j | jq '.pid' | xargs kill -9"))
bind("CTRL + P", function()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "disable" }))
    end, { timeout = 500, type = "oneshot" })
end)

-- BUG: https://github.com/hyprwm/Hyprland/discussions/14380
bind("F", function()
    hl.dispatch(hl.dsp.layout("colresize +conf"))
    hl.dispatch(hl.dsp.layout("focus r"))
    hl.dispatch(hl.dsp.layout("focus l"))
end)

bind("SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with mainMod + arrow keys
bind("h", hl.dsp.focus({ direction = "left" }))
bind("l", hl.dsp.focus({ direction = "right" }))
bind("k", hl.dsp.focus({ direction = "up" }))
bind("j", hl.dsp.focus({ direction = "down" }))

bind("SHIFT + h", hl.dsp.layout("swapcol l"))
bind("SHIFT + l", hl.dsp.layout("swapcol r"))
bind("SHIFT + k", hl.dsp.window.move({ direction = "up" }))
bind("SHIFT + j", hl.dsp.window.move({ direction = "down" }))

bind("COMMA", hl.dsp.layout("consume"))
bind("PERIOD", hl.dsp.layout("expel"))
bind("SHIFT + PERIOD", hl.dsp.layout("promote"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    bind(" + " .. key, hl.dsp.focus({ workspace = i }))
    bind("SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

bind("TAB", hl.dsp.workspace.toggle_special("scratchpad"))
bind("SHIFT + TAB", hl.dsp.window.move({ workspace = "special:scratchpad" }))

-- Scroll through existing workspaces with mainMod + scroll
bind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })
