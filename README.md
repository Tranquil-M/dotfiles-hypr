Welcome to...

# Tranquil's Hyprland Dot Files

This is a repository of my preferred Hyprland setup, primarily used on Arch-based distributions.

---

## Table of Contents

| Category | Description |
|----------|------------|
| [How does it look?](#looks) | Images of the actual rice |
| [Installation](#install) | Directions to clone and use this repository |
| [How does the install script work?](#walkthrough) | Explanation of the install script |
| [Features](#feat) | Included features |
| [Bindings](#binds) | Keybindings list |
| [Used Packages](#pkgs) | All packages used |

---

<a name="looks"></a>
## How does it look?

### Window
![Default Color Scheme](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Window.png?raw=true)

### Rofi
![Application Selector](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Rofi%206.png?raw=true)

### Wallpaper Selector
![Wallpaper Selector](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Wallpaper%20Selector.png?raw=true)

### Notification Manager
![SwayNC](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Notification%20Center.png?raw=true)

### Wlogout
![Wlogout](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/WLogout.png?raw=true)

### Other Wallpaper Colors
![Minecraft Purple](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Purple.png?raw=true)
![Cat Pink](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Pink.png?raw=true)
![Cat Club Green](https://github.com/Tranquil-M/dotfiles-hypr/blob/master/Sample/Green.png?raw=true)

> [!IMPORTANT]
> All wallpaper colors are completely adaptive! It changes everything, all just depends on what wallpaper you are using.

---

<a name="install"></a>
## Installation

1. Clone this repository into your home directory:
    ```bash
    git clone https://github.com/Tranquil-M/dotfiles .dots
    cd .dots
    ```

2. Run the install script:
    ```bash
    bash ./install/install.sh
    ```

> [!NOTE]
> The install script's package install capability is currently only functional for Arch-based distros.  
> The script has logic for Debian-based distros and macOS, however package names are not included.  
> You can manually install packages—the script will still create the dotfiles.

---

<a name="walkthrough"></a>
## How does the install script work?

You could always read it yourself, but I digress. Here's how it works:

1. Detects the current operating system and package manager (includes `yay` on Arch).  
   If the package manager does not exist, it installs it.

2. Looks for a package file in the `packages` subdirectory (e.g. `packages-arch.txt`).  
   It scans the package repositories and installs what it finds.  
   - On Arch: checks `pacman` first, then AUR if needed.

3. Uses GNU Stow to create symlinks for each directory in the dotfiles repository.

4. Prompts you to restart your system.

---

<a name="feat"></a>
## Features

These dotfiles are meant to be simple and practical for daily use, with some additional features:

- Screenshot utility using Grim, Slurp, and Satty  
  Saves to: `~/Pictures/Screenshots`

- Wallpaper switcher using Matugen  
  Add wallpapers to: `~/Pictures/Wallpapers`

- Rofi integration:
- Application launcher  
- File explorer  
- SSH window  
- Window switcher  
- Notification center using SwayNC  
- Custom Discord theme using Equicord (no manual patching)  
- NvChad (NeoVim distribution)  
- Exa (enhanced `ls`)  
- Zoxide (enhanced `cd`)  
- On-screen display (volume/backlight) via SwayOSD  
- Hyprlock lockscreen  
- Wlogout logout menu  
- Firefox theme using pywal-fox  
- SilentSDDM login screen  
- Emoji picker using rofi-emoji  

---

<a name="binds"></a>
## Bindings

### Core
- **Terminal** → `Super + Return`  
- **Kill Active Window** → `Super + W`  
- **Log Out of Hyprland** → `Super + M`  
- **File Manager** → `Super + Shift + F`  

### Window Management
- **Toggle Floating** → `Super + T`  
- **Toggle Split** → `Super + J`  
- **Fake Fullscreen** → `Super + F`  
- **Real Fullscreen** → `Super + Alt + F`  

### UI / Tools
- **Rofi Launcher** → `Super + Space`  
- **Reload Waybar** → `Super + R`  
- **Notification Center** → `Super + N`  
- **Wlogout Menu** → `Super + Backspace`  
- **Wallpaper Picker** → `Super + E`  
- **Screenshot** → `Super + Z`  

### Notifications
- **Close Latest** → `Super + Comma`  
- **Close All** → `Super + Shift + Comma`  

### Workspaces
- **Switch Workspace** → `Super + 1-9`  
- **Move Window to Workspace** → `Super + Shift + 1-9`  

---
<a name="pkgs">

## Packages

* [NvChad](https://nvchad.com/)
* [NvChad Pywal Support](https://github.com/nvchad/pywal)
* [Equicord](https://equicord.org/)
* [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
* [SwayOSD](https://github.com/ErikReider/SwayOSD)
* [Rofi](https://github.com/davatorium/rofi)
* [Rofi Theme](https://github.com/newmanls/rofi-themes-collection)
* [Matugen](https://github.com/InioX/matugen)
* [Matugen Templates](https://github.com/InioX/matugen-themes)
* [Satty](https://github.com/Satty-org/Satty)
* [Grim](https://github.com/emersion/grim)
* [Slurp](https://github.com/emersion/slurp)
* [GNU Stow](https://www.gnu.org/software/stow/)
* [Zoxide](https://github.com/ajeetdsouza/zoxide)
* [Exa](https://github.com/ogham/exa)
* [Hyprlock](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
* [Wlogout](https://github.com/ArtsyMacaw/wlogout)
* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Btop](https://github.com/aristocratos/btop)
* [Pywal-Fox](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
* [SilentSDDM](https://github.com/uiriansan/SilentSDDM)
* [Rofi-Emoji](https://github.com/Mange/rofi-emoji)
