#!/usr/bin/env bash
set -euo pipefail

if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-local-pdf>"
    exit 1
fi

PDF_SRC="$1"
FILE_NAME="$(basename "$PDF_SRC")"
PDF_DEST="/run/caddy/pdf/$FILE_NAME"
install -D -m 640 -g caddy "$PDF_SRC" "$PDF_DEST"

ENCODED_FILE_NAME=$(echo -n "$FILE_NAME" | jq -Rr @uri)
FILE_URL="http://localhost:8888/pdf/${ENCODED_FILE_NAME}"
VIEWER_URL="http://localhost:8888/web/viewer.html?file=${FILE_URL}"

firefox "$VIEWER_URL" &
