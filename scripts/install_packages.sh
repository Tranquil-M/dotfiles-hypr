#!/usr/bin/env bash
set -euo pipefail

source "scripts/ui.sh"

if [[ ! -f packages.txt ]]; then
    error "packages.txt not found"
    exit 1
fi

mapfile -t PACKAGES < packages.txt

run_step "Updating system..." sudo pacman -Syu --noconfirm
success "System updated"

info "Installing base-devel..."
if run_step "Installing..." sudo pacman -S --needed --noconfirm base-devel > /dev/null 2>&1; then
    pkg_ok "base-devel installed"
else
    pkg_fail "base-devel failed to install"
    error "base-devel failed to install; cannot proceed"
    exit 1
fi

success "base-devel installed"

info "Checking AUR helper..."

if ! command -v yay >/dev/null 2>&1; then
    substep "yay not found — installing..."

    tmp=$(mktemp -d)

    run_step "Cloning yay..." git clone https://aur.archlinux.org/yay.git "$tmp/yay"

    (
        cd "$tmp/yay"
        run_step "makepkg" makepkg -si --noconfirm
    )

    rm -rf "$tmp"

    success "yay installed successfully"
else
    substep "yay already installed"
    success "AUR helper ready"
fi

install_pkg() {
    local pkg="$1"

    [[ -z "$pkg" ]] && return

    substep "Installing ${C_ACCENT}$pkg${C_RESET}"

    if sudo pacman -S --needed --noconfirm "$pkg" >/dev/null 2>&1; then
        pkg_ok "$pkg installed from official repositories"
        return
    fi

    warn "$pkg not found in official repositories"
    substep "Trying AUR..."

    if yay -S --needed --noconfirm "$pkg" >/dev/null 2>&1; then
        pkg_ok "$pkg installed from AUR"
    else
        pkg_fail "Failed to install $pkg"
    fi
}

info "Installing packages..."

for pkg in "${PACKAGES[@]}"; do
    install_pkg "$pkg"
done

success "Package installation complete"

info "Checking for orphaned packages..."

orphans=$(pacman -Qtdq 2>/dev/null || true)

if [[ -n "$orphans" ]]; then
    substep "Removing unused dependencies..."
    echo "$orphans" | sudo pacman -Rns -
    success "Orphans removed"
else
    substep "No orphaned packages found"
    success "System clean"
fi
