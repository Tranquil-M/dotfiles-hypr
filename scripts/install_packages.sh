#!/usr/bin/env bash
set -euo pipefail

mapfile -t PACKAGES < packages.txt

sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel

if ! command -v yay >/dev/null 2>&1; then
    tmp=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmp/yay"
    (cd "$tmp/yay" && makepkg -si --noconfirm)
    rm -rf "$tmp"
fi

install_pkg() {
    if sudo pacman -S --needed --noconfirm "$1"; then
        return
    fi

    echo "Not found in official repositories, trying AUR for $1"
    yay -S --needed --noconfirm "$1" || echo "Failed to install $1"
}

for pkg in "${PACKAGES[@]}"; do
    [[ -n "$pkg" ]] && install_pkg "$pkg"
done

orphans=$(pacman -Qtdq 2>/dev/null || true)
[[ -n "$orphans" ]] && echo "$orphans" | sudo pacman -Rns -
