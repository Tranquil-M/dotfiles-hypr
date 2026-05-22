#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."
substep xdg-mime default org.gnome.Nautilus.desktop inode/directory
substep sudo systemctl enable --now tlp.service
substep sudo tlp balanced
success "Set defaults sucessfuly!"
