#!/usr/bin/env bash

if [[ -n "${ZELLIJ-}" ]]; then
    exit 0
fi

if [[ -z "${1-}" ]]; then
    dir=$(zoxide query --interactive)
else
    dir=$(zoxide query "$1")
fi

if [[ -z "$dir" ]]; then
    exit 0
fi

name=$(basename "$dir")

cd "$dir" || return
zellij attach --create "$name"
