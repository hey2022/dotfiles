#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

scrape_target=$1
base_url=$(echo "$scrape_target" | grep -oP '^https?://[^/]+')
pdf_urls=$(wget -q -O - "$scrape_target" | grep -oP '(?<=href=")[^"]*\.pdf')

mkdir -p frq sg

while read -r url; do
    if [[ $url != http* ]]; then
        url="${base_url}/${url:1}"
    fi
    if [[ $url == *frq* ]]; then
        wget -nc -P frq "$url" &
    elif [[ $url == *sgs* || $url == *sg* || $url == *scoring_guidelines* ]]; then
        wget -nc -P sg "$url" &
    fi
done <<<"$pdf_urls"

wait
