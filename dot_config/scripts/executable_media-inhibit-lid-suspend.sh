#!/usr/bin/env sh

while true; do
    if playerctl --all-players status | grep -q "Playing"; then
        systemd-inhibit --what=handle-lid-switch --why="Prevent sleep while media is playing" sleep 10 &
    fi
    sleep 9.9
done
