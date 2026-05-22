#!/usr/bin/env bash

source "scripts/ui.sh"

info "Overwriting existing configuration..."

if [[ -d "config/.config" ]]; then
    for ITEM in "config/.config"/*; do
        NAME=$(basename "$ITEM")
        TARGET="$HOME/.config/$NAME"

        if [[ -e "$TARGET" || -L "$TARGET" ]]; then
            substep "Removing existing: $TARGET"
            rm -r "$TARGET"
        fi
    done
fi

substep "Applying bash related files..."
rm ~/.bashrc
stow bash

substep "Applying configuration files..."
stow config

if [[ -d "~/.local/share/icons/DOT-dark" ]]; then
    substep "Resetting Mouse Cursor Theme..."
    rm -rf ~/.local/share/icons/DOT-dark
fi

substep "Applying mouse cursor theme..."
stow --target="$HOME/.local" icons

substep "Creating Wallpapers..."
mkdir -p ~/Pictures
stow --adopt wallpapers

success "Dotfiles creation complete!"
