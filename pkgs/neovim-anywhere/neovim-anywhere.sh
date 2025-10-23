#!/usr/bin/env bash

set -euo pipefail

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

ft="${1:-markdown}"

neovide -- -c "set filetype=${ft}" "$tmp"

[ -s "$tmp" ] && wl-copy < "$tmp"
ydotool key 29:1 47:1 47:0 29:0
