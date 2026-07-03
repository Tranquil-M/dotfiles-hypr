#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."

xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
sudo systemctl enable --now sddm.service
sudo systemctl enable --now power-profiles-daemon.service
sudo usermod -a -G input $USER

success "Set defaults sucessfuly!"
