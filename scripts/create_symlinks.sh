#!/usr/bin/env bash
if [[ -d "$SCRIPT_DOR/config/.config" ]]; then
    for ITEM in "$CONFIG_SOURCE"/*; do
        NAME=$(basename "$ITEM")
        TARGET="$HOME/.config/$NAME"

        if [[ -e "$TARGET" || -L "$TARGET" ]]; then
            echo "Removing existing: $TARGET"
            rm -r "$TARGET"
        fi
    done
fi

stow bash
stow config
stow icons

mkdir -p ~/Pictures
stow --adopt wallpapers

