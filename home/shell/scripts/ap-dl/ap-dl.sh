#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

pdf_urls=$(wget -q -O - "$1" | grep -oP '(?<=href=")[^"]*\.pdf')

mkdir -p frq sg

while read -r url; do
    if [[ $url == *frq* ]]; then
        wget -nc -P frq "$url" &
    elif [[ $url == *sgs* || $url == *sg* || $url == *scoring_guidelines* ]]; then
        wget -nc -P sg "$url" &
    fi
done <<<"$pdf_urls"

wait
