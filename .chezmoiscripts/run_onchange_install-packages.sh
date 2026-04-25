#!/usr/bin/env bash
# packages.txt hash: {{ include "packages-arch.txt" | sha256sum }}

set -euo pipefail

PKG_FILE=""
PKG_INSTALL_CMD=""
PKG_UPDATE_CMD=""

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
DOTFILES_DIR=$SCRIPT_DIR/..

if command -v pacman >/dev/null 2>&1; then
  echo "Detected Arch-based system (pacman)"
  PKG_FILE="packages-arch.txt"
  PKG_INSTALL_CMD="sudo pacman -S --noconfirm --needed"
  PKG_UPDATE_CMD="sudo pacman -Syu --noconfirm"

  if ! command -v yay >/dev/null 2>&1; then
    echo "yay (AUR helper) not found — installing yay..."
    temp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$temp_dir/yay"
    pushd "$temp_dir/yay" >/dev/null
    makepkg -si --noconfirm
    popd >/dev/null
    rm -rf "$temp_dir"
  fi

elif command -v apt-get >/dev/null 2>&1; then
  echo "Detected Debian/Ubuntu-based system (apt)"
  PKG_FILE="$SCRIPT_DIR/packages/packages-debian.txt"
  PKG_INSTALL_CMD="sudo apt-get install -y"
  PKG_UPDATE_CMD="sudo apt-get update"

elif command -v brew >/dev/null 2>&1; then
  echo "Detected macOS or Linuxbrew (brew)"
  PKG_FILE="$SCRIPT_DIR/packages/packages-macos.txt"
  PKG_INSTALL_CMD="brew install"
  PKG_UPDATE_CMD="brew update"

else
  # Install Homebrew automatically if no other manager found
  echo "No package manager detected — attempting to install Homebrew..."

  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  elif [[ -d /opt/homebrew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Could not find Homebrew after installation."
  fi

  PKG_FILE="$SCRIPT_DIR/packages/packages-macos.txt"
  PKG_INSTALL_CMD="brew install"
  PKG_UPDATE_CMD="brew update"
fi

# Install packages if package list exists
if [[ -f "$PKG_FILE" ]]; then
  echo "Installing packages from $PKG_FILE..."
  mapfile -t PACKAGES < "$PKG_FILE"

  for pkg in "${PACKAGES[@]}"; do
    echo "Installing: $pkg"

    if ! eval "$PKG_INSTALL_CMD $pkg"; then 
      if command -v pacman >/dev/null 2>&1; then
        echo "$pkg not found in official repos, trying AUR..."
        if ! yay -S --noconfirm --needed "$pkg"; then
          echo "Package $pkg not found in the AUR either!"
        fi
      fi
      echo "Failed to install $pkg — skipping."
    fi
  done

  echo "Updating package repositories..."
  eval "$PKG_UPDATE_CMD"

else
  echo "Package list $PKG_FILE not found — skipping package installation."
fi

echo "Setting defaults..."
xdg-mime default nemo.desktop inode/directory

echo "Installing SDDM Silent Theme..."
cd ~
git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM
cd SilentSDDM
sed -i 's|^ConfigFile=.*|ConfigFile="configs/catppuccin-macchiato.conf"|' metadata.desktop
bash ./install.sh
echo "Installed successfully!"
cd ..
rm -rf ./SilentSDDM
sudo systemctl enable sddm.service

echo "Starting Libinput Backend..."
sudo systemctl enable --now swayosd-libinput-backend.service

echo "Removing unneccesary dependencies..."
if command -v pacman >/dev/null 2>&1; then
  sudo pywalfox install
  mapfile -t orphans < <(pacman -Qtdq 2>/dev/null || true)

  if [ ${#orphans[@]} -eq 0 ]; then
    echo "No orphaned packages to remove."
  else
    printf '%s\n' "${orphans[@]}" | sudo pacman -Rns -
  fi

elif command -v apt-get >/dev/null 2>&1; then
  sudo apt autoremove --purge
elif command -v brew >/dev/null 2>&1; then
  brew autoremove
  brew cleanup
fi
