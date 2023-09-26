#!/usr/bin/env sh

swayidle -w timeout 300 '~/.config/sway/swaylock.sh' \
            timeout 600 'swaymsg "output * power off"' \
            resume 'swaymsg "output * power on"' \
            before-sleep '~/.config/sway/swaylock.sh'
