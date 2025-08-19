#!/usr/bin/env bash

if [[ -n "${ZELLIJ-}" ]]; then
    exit 0
fi

dir=$(zoxide query --interactive)
if [[ -z "$dir" ]]; then
    exit 0
fi

name=$(basename "$dir")

cd "$dir"
zellij attach --create "$name"
