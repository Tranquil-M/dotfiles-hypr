#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."

xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
sudo systemctl enable --now sddm.service
sudo systemctl enable --now power-profiles-daemon.service
sudo usermod -a -G input $USER

for mime in text/plain text/markdown text/x-tex text/html text/css text/javascript \
            application/json application/javascript application/xml application/x-yaml \
            text/x-c text/x-c++src text/x-python text/x-shellscript; do
    xdg-mime default nvim.desktop "$mime"
done

success "Set defaults sucessfuly!"
