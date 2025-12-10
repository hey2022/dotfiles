#!/usr/bin/env bash

set -euo pipefail

if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

scrape_target=$1
download=$(mktemp)
trap 'rm -f "$download"' EXIT
base_url=$(echo "$scrape_target" | rg -o '^https?://[^/]+')
curl -s "$scrape_target" \
| rg -o '<a[^>]*href="([^"]*\.pdf[^"]*)"[^>]*>(.*?)</a>' -or '$1|$2' \
| sd '^/' "$base_url/" \
| sd '^.*web\.archive\.org/web/\d+/' '' \
| sd '\|.*Questions.*$' '\n  dir=frq' \
| sd '\|.*(Guidelines|Rubric).*$' '\n  dir=sg' \
| sd '\|.*(Sample|Commentary|Commentaries).*$' '\n  dir=sample' \
| sd '\|.*(Report|Performance).*$' '\n  dir=report' \
| sd '\|.*Statistic.*$' '\n  dir=report/statistic' \
| sd '\|.*Distribution.*$' '\n  dir=report/distribution' \
> "$download"

mkdir -p frq sg sample report/{statistic,distribution}
aria2c --continue --auto-file-renaming=false -i "$download"
