#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."
substep xdg-mime default org.gnome.Nautilus.desktop inode/directory
substep sudo systemctl enable --now sddm.service
substep sudo systemctl enable --now power-profiles-daemon.service
substep sudo usermod -a -G input $USER

success "Set defaults sucessfuly!"
