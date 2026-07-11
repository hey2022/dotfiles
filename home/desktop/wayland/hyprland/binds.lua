local cfg = require("config")
local lib = require("lib")
local bind = lib.bind
local exec = lib.exec

bind("RETURN", exec(cfg.terminal, { uwsm = true }))
bind("SHIFT + RETURN", exec("neovide", { uwsm = true }))
bind("ALT + RETURN", exec("neovim-anywhere", { uwsm = true }))
bind("ALT + L", exec("neovim-anywhere tex", { uwsm = true }))
bind("SHIFT + E", exec("loginctl terminate-session $XDG_SESSION_ID"))
bind("ESCAPE", exec("loginctl lock-session"))
bind("SHIFT + ESCAPE", exec("wlogout -p layer-shell", { toggle = true }))

-- menu
bind("SPACE", exec("rofi -show drun", { toggle = true }))
bind("SHIFT + SPACE", exec("rofi -show run", { toggle = true }))
bind("CTRL + SPACE", exec("rofi -show recursivebrowser", { toggle = true }))
bind(
    "ALT + SPACE",
    exec(
        "rofi -show calc -modi calc -no-show-match -no-sort -no-history -calc-command \"echo -n '{result}' | wl-copy\"",
        { toggle = true }
    )
)

bind("SHIFT+I", exec("toggle-inhibit-lid-sleep"))
bind("O", exec("slurp | xargs -I {} grim -g {} - | tesseract -l eng - - | wl-copy"))
bind("A", exec("wayscriber --daemon-toggle"))

bind("W", exec("waypaper --random"))

bind("SHIFT + V", exec("sleep 0.25 && wl-paste | tr '\n' ' ' | tr -s ' ' | wl-copy && ydotool key 29:1 47:1 47:0 29:0"))

-- Laptop multimedia keys for volume and LCD brightness
bind(
    { "XF86AudioRaiseVolume", "UP" },
    exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
bind(
    { "XF86AudioLowerVolume", "DOWN" },
    exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)
bind({ "XF86AudioMute", "M" }, exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
bind("XF86AudioMicMute", exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

-- Brightness
bind("XF86MonBrightnessUp", exec("brightnessctl -e4 set 5%+"), { locked = true, repeating = true })
bind("XF86MonBrightnessDown", exec("brightnessctl -e4 set 5%-"), { locked = true, repeating = true })

-- Player Controls
bind({ "XF86AudioPause", "SHIFT + P" }, exec("playerctl pause"), { locked = true })
bind({ "XF86AudioPlay", "P" }, exec("playerctl play-pause"), { locked = true })

bind({ "XF86AudioNext", "RIGHT" }, exec("playerctl next"), { locked = true })
bind({ "XF86AudioPrev", "LEFT" }, exec("playerctl previous"), { locked = true })
bind("SHIFT + LEFT", exec("playerctl position 10-"), { locked = true })
bind("SHIFT + RIGHT", exec("playerctl position 10+"), { locked = true })

-- screenshot
bind({ "SHIFT + Print", "SHIFT + S" }, exec("grimblast --notify copy area", { run_once = true }))
bind({ "CTRL + Print", "CTRL + S" }, exec("grimblast --notify --cursor copy active", { run_once = true }))
bind({ "Print", "S" }, exec("grimblast --notify --cursor copy output", { run_once = true }))
bind({ "ALT + Print", "ALT + S" }, exec("grimblast --notify --cursor copy screen", { run_once = true }))

-- swaync
bind("N", exec("swaync-client -t"))
bind("SHIFT + N", exec("swaync-client -d"))

bind(
    "C",
    exec(
        "cliprust list | rofi -dmenu -display-columns 2 | cliprust decode | wl-copy",
        { toggle = true, program = "rofi" }
    )
)
bind("MINUS", exec("qs ipc call flowtime toggle"))
