#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <input-file>"
    exit 1
fi

cleanup() {
    rm "$tmp_output" "$tmp_prefix" "$tmp_suffix"
    exit 0
}
trap cleanup INT

tmp_output=$(mktemp /tmp/gfm-XXXXXX.html)
tmp_prefix=$(mktemp /tmp/gfm-prefix-XXXXXX.html)
tmp_suffix=$(mktemp /tmp/gfm-suffix-XXXXXX.html)
echo '<div class="markdown-body">' >"$tmp_prefix"
echo '</div>' >"$tmp_suffix"

live-server "$tmp_output" &
cmd="comrak --gfm $1 | pandoc -s --metadata pagetitle=\"GFM Preview\" -c 'https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css' --include-before-body=$tmp_prefix --include-after-body=$tmp_suffix -o $tmp_output"
echo "$1" | entr -s "$cmd"
