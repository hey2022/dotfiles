#!/usr/bin/env sh

cleanup() {
    ydotool click 0x80 -D 0
    exit 0
}

trap cleanup INT TERM

delay=$((1000 / ${1:-10} / 2))
while true
do
    ydotool click 0xC0 -D "$delay"
done
