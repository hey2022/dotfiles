#!/usr/bin/env sh

cleanup() {
    if [ -n "$RELEASE_CODE" ]; then
        ydotool click "$RELEASE_CODE" -D 0
    fi
    exit 0
}

show_help() {
    echo "Usage: $0 [-h] {-l|-r} [clicks_per_second]"
    echo "  -h  Show help"
    echo "  -l  Use left click"
    echo "  -r  Use right click"
}

CLICK_CODE=""
RELEASE_CODE=""

while getopts 'hlr' opt; do
    case "${opt}" in
        h)
            show_help
            exit 0
            ;;
        l)
            CLICK_CODE="0xC0"
            RELEASE_CODE="0x80"
            ;;
        r)
            CLICK_CODE="0xC1"
            RELEASE_CODE="0x81"
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
done
shift $((OPTIND - 1))

if [ -z "$CLICK_CODE" ]; then
    echo "Error: You must specify either -l (left click) or -r (right click)." >&2
    show_help
    exit 1
fi

trap cleanup INT TERM

delay=$((1000 / ${1:-10} / 2))

while true
do
    ydotool click "$CLICK_CODE" -D "$delay"
done
