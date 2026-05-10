#!/usr/bin/env bash
set -euo pipefail

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="$(date +'%m %d %Y : %I:%M:%S').png"
FILEPATH="$SAVE_DIR/$FILENAME"

REGION=$(slurp)
grim -g "$REGION" "$FILEPATH"

satty --filename "$FILEPATH"

wl-copy < "$FILEPATH"
