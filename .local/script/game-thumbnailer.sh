#!/usr/bin/env bash
set -e

INPUT="$1"
OUTPUT="$2"
SIZE="$3"

# Only act on directories named exactly "foo"
if [ "$(dirname "$INPUT")" != "/run/media/piotr/Vault/GameZ/Ready" ]; then
	exit 1
fi

LOGO="$INPUT/gog/boxart.png"

# Only generate a thumbnail if logo exists
if [ ! -f "$LOGO" ]; then
	exit 1
fi

# Create thumbnail
convert "$LOGO" \
	-thumbnail "${SIZE}x${SIZE}" \
	-background transparent \
	-gravity center \
	"$OUTPUT"
# -extent "${SIZE}x${SIZE}" \

