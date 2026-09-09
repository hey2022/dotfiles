#!/usr/bin/env bash
set -euo pipefail

if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-local-pdf>"
    exit 1
fi

PDF_SRC="$1"
TARGET_DIR="/run/caddy"
PDF_DEST=$(mktemp --tmpdir="$TARGET_DIR")
install -m 640 -g caddy "$PDF_SRC" "$PDF_DEST"

FILE_NAME="${PDF_DEST##*/}"
FILE_URL="http://localhost:8888/pdf/${FILE_NAME}"
VIEWER_URL="http://localhost:8888/web/viewer.html?file=${FILE_URL}"

firefox "$VIEWER_URL" &
