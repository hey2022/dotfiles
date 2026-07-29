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

-- https://github.com/hyprwm/Hyprland/discussions/14380#discussioncomment-17734370
bind("F", function()
    local monitor = hl.get_active_monitor()
    local window = hl.get_active_window()

    if monitor and window and type(window.size) == "table" then
        if window.size.x >= monitor.width / 2 then
            hl.dispatch(hl.dsp.layout("colresize 0.5"))
            hl.dispatch(hl.dsp.layout("focus r"))
            hl.dispatch(hl.dsp.layout("focus l"))
        else
            hl.dispatch(hl.dsp.layout("colresize 1"))
        end
    end
end)

-- bind("F", function()
--     -- BUG: https://github.com/hyprwm/Hyprland/discussions/15564 fullscreen hides windows from gaps
--     hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
--     -- BUG: https://github.com/hyprwm/Hyprland/discussions/14338 focused view is on empty space after toggling fullscreen
--     hl.dispatch(hl.dsp.layout("focus r"))
--     hl.dispatch(hl.dsp.layout("focus l"))
-- end)

bind("SHIFT + F", function()
    hl.dispatch(hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
    -- BUG: https://github.com/hyprwm/Hyprland/discussions/15206 window is shifted after exiting fullscreen
    hl.dispatch(hl.dsp.layout("focus r"))
    hl.dispatch(hl.dsp.layout("focus l"))
end)

bind("R", hl.dsp.layout("colresize +conf"))
bind("SHIFT + R", hl.dsp.layout("colresize -conf"))

-- BUG: https://github.com/hyprwm/Hyprland/pull/15569 cannot change focus in fullscreen
-- Move focus with mainMod + arrow keys
-- bind("h", hl.dsp.focus({ direction = "left" }))
-- bind("l", hl.dsp.focus({ direction = "right" }))
bind("h", hl.dsp.layout("focus l"))
bind("l", hl.dsp.layout("focus r"))

bind("k", hl.dsp.focus({ direction = "up" }))
bind("j", hl.dsp.focus({ direction = "down" }))

bind("SHIFT + h", hl.dsp.layout("swapcol l"))
bind("SHIFT + l", hl.dsp.layout("swapcol r"))
bind("SHIFT + k", hl.dsp.window.move({ direction = "up" }))
bind("SHIFT + j", hl.dsp.window.move({ direction = "down" }))

bind("CTRL + h", hl.dsp.focus({ monitor = "l" }))
bind("CTRL + l", hl.dsp.focus({ monitor = "r" }))
bind("CTRL + k", hl.dsp.focus({ monitor = "u" }))
bind("CTRL + j", hl.dsp.focus({ monitor = "d" }))

bind("CTRL + SHIFT + h", hl.dsp.window.move({ monitor = "l" }))
bind("CTRL + SHIFT + l", hl.dsp.window.move({ monitor = "r" }))
bind("CTRL + SHIFT + k", hl.dsp.window.move({ monitor = "u" }))
bind("CTRL + SHIFT + j", hl.dsp.window.move({ monitor = "d" }))

bind("ALT + h", hl.dsp.workspace.move({ monitor = "l" }))
bind("ALT + l", hl.dsp.workspace.move({ monitor = "r" }))
bind("ALT + k", hl.dsp.workspace.move({ monitor = "u" }))
bind("ALT + j", hl.dsp.workspace.move({ monitor = "d" }))

bind("BRACKETLEFT", hl.dsp.layout("move -col"))
bind("BRACKETRIGHT", hl.dsp.layout("move +col"))
bind("SHIFT + BRACKETLEFT", hl.dsp.layout("move +200"), { repeating = true })
bind("SHIFT + BRACKETRIGHT", hl.dsp.layout("move -200"), { repeating = true })

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
bind("SHIFT + TAB", function()
    local active_window = hl.get_active_window()
    if active_window == nil then
        return
    end
    if active_window.workspace.name == "special:scratchpad" then
        hl.dispatch(hl.dsp.window.move({ workspace = "+0" }))
    else
        hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad" }))
    end
end)

-- Scroll through existing workspaces with mainMod + scroll
bind("mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("mouse:273", hl.dsp.window.resize(), { mouse = true })
