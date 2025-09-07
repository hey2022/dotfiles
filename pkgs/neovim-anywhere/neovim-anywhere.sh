#!/usr/bin/env bash

TEMP_FILE=$(mktemp).tex

neovide "$TEMP_FILE"

if [ -s "$TEMP_FILE" ]; then
    wl-copy < "$TEMP_FILE"
fi

rm "$TEMP_FILE"
