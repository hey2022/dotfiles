#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <input-file>"
    exit 1
fi

cleanup() {
    rm "$tmpfile" /tmp/gfm-prefix.html /tmp/gfm-suffix.html
    exit 0
}
trap cleanup INT

tmpfile=$(mktemp /tmp/gfm-XXXXXX.html)
echo '<div class="markdown-body">' >/tmp/gfm-prefix.html
echo '</div>' >/tmp/gfm-suffix.html

live-server "$tmpfile" &
cmd="comrak --gfm $1 | pandoc -s --metadata pagetitle=\"GFM Preview\" -c 'https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css' --include-before-body=/tmp/gfm-prefix.html --include-after-body=/tmp/gfm-suffix.html -o $tmpfile"
echo "$1" | entr -s "$cmd"
