#!/usr/bin/env sh

swayidle -w timeout 600 '~/.config/sway/swaylock.sh' \
            timeout 1800 'swaymsg "output * power off"' \
            resume 'swaymsg "output * power on"' \
            before-sleep '~/.config/sway/swaylock.sh'
