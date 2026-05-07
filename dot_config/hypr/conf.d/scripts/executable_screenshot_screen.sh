#!/usr/bin/env bash
set -euo pipefail

# set variable save dir
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR" # make folder if not already made

# set filename as date time
FILENAME="$(date +'%m %d %Y : %I:%M:%S').png" # exclusively png
FILEPATH="$SAVE_DIR/$FILENAME" # concatenate filepath

grim "$FILEPATH" # capture full screen with grim and safe to filepath

satty --filename "$FILEPATH" # open file with satty

wl-copy < "$FILEPATH" # save to clipboard
