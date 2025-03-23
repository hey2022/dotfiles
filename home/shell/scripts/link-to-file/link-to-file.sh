#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <FILENAME>"
    exit 1
fi

input_file=$1

if [ -L "$input_file" ]; then
    cp --remove-destination "$(readlink "$input_file")" "$input_file"
    chmod 644 "$input_file"
fi
