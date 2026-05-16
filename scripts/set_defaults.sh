#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."
substep xdg-mime default org.gnome.Nautilus.desktop inode/directory
success "Set defaults sucessfuly!"
