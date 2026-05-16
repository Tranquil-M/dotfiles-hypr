#!/usr/bin/env bash
if [[ -d "config/.config" ]]; then
    for ITEM in "config/.config"/*; do
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

