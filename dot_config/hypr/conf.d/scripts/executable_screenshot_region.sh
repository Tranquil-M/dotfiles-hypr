#!/usr/bin/env bash
set -euo pipefail

# default save dir
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR" # make if not exist already

# get current time/date and set that as the file name
FILENAME="$(date +'%m %d %Y : %I:%M:%S').png" # exclusively png
FILEPATH="$SAVE_DIR/$FILENAME" # concatenate filepath

REGION=$(slurp) # use slurp to fetch region
grim -g "$REGION" "$FILEPATH" # save file to filepath with grim

satty --filename "$FILEPATH" # open file with satty; always saves to save_dir but option to save elsewhere in satty

wl-copy < "$FILEPATH" # save to clipboard
