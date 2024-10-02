#!/usr/bin/env sh

INHIBIT_PID=0

start_inhibit() {
    if [ "$INHIBIT_PID" -eq 0 ]; then
        echo "Activated lid inhibit lock."
        systemd-inhibit --what=handle-lid-switch --why="Media playing" sleep infinity &
        INHIBIT_PID=$!
    fi
}

stop_inhibit() {
    if [ "$INHIBIT_PID" -ne 0 ]; then
        echo "Deactivated lid inhibit lock."
        kill "$INHIBIT_PID" 2>/dev/null
        INHIBIT_PID=0
    fi
}

cleanup() {
    stop_inhibit
    echo "Exiting script."
    exit 0
}

trap cleanup INT TERM

if ! command -v playerctl >/dev/null 2>&1; then
    echo "Error: playerctl is not installed. Exiting."
    exit 1
fi

while true; do
    status=$(playerctl --all-players status 2>/dev/null)

    case "$status" in
    *Playing*)
        start_inhibit
        ;;
    *)
        stop_inhibit
        ;;
    esac

    sleep 2
done
