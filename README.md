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

1. Install chezmoi
    ```bash
    sudo pacman -Sy chezmoi
    ```

2. Initialize and apply this repository:
   ```bash
   chezmoi init --apply Tranquil-M
   ```

> [!NOTE]
> The install script's package install capability is currently only functional for Arch-based distros.

---

<a name="walkthrough"></a>
## How does the install script work?

1. Uses Chezmoi to run package installation scripts, looking for a file named `packages-arch.txt` in `~/.local/share/chezmoi`. Multi-OS support is planned in the future.
2. If a package cannot be found in official repositories, it installs [yay](https://github.com/jguer/yay) and scans the AUR.
3. Sets default applications and colors.
4. Updates the system, and prompts you to restart.

---

<a name="feat"></a>
## Features

These dotfiles are meant to be simple and practical for daily use, with some additional features:

- Screenshot utility using Grim, Slurp, and Satty  
  Saves to: `~/Pictures/Screenshots`
- Wallpaper switcher using Matugen  
  Add wallpapers to: `~/Pictures/Wallpapers`; It can be any standard image filetype.
- Rofi integration:
    - Application launcher  
    - File explorer  
    - SSH window  
    - Window switcher  
    - Notification center using SwayNC
    - Emoji picker
- Custom Discord theme using Equibop (Discord Client)
- Kickstart Nvim configuration
- Exa (enhanced `ls`)  
- Zoxide (enhanced `cd`)  
- On-screen display (volume/backlight/capslock indicator) via SwayOSD  
- Hyprlock lockscreen  
- Wlogout logout menu  
- Firefox theme using pywal-fox and custom css  
- SilentSDDM login screen

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
- **Always On Top Waybar Toggle** `Super + A`

### Notifications
- **Close Latest** → `Super + Comma`  
- **Close All** → `Super + Shift + Comma`  

### Workspaces
- **Switch Workspace** → `Super + 1-9`  
- **Move Window to Workspace** → `Super + Shift + 1-9`

>[!NOTE]
>Temporary workspaces are supported, but a minimum of 3 persistent workspaces are assigned per-monitor on startup.

---
<a name="pkgs">

## Packages

* [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
* [Equibop](https://equicord.org/)
* [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
* [SwayOSD](https://github.com/ErikReider/SwayOSD)
* [Rofi](https://github.com/davatorium/rofi)
* [Rofi Theme](https://github.com/newmanls/rofi-themes-collection)
* [Matugen](https://github.com/InioX/matugen)
* [Matugen Templates](https://github.com/InioX/matugen-themes)
* [Satty](https://github.com/Satty-org/Satty)
* [Grim](https://github.com/emersion/grim)
* [Slurp](https://github.com/emersion/slurp)
* [Chezmoi](https://www.chezmoi.io/)
* [Zoxide](https://github.com/ajeetdsouza/zoxide)
* [Exa](https://github.com/ogham/exa)
* [Hyprlock](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
* [Wlogout](https://github.com/ArtsyMacaw/wlogout)
* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Btop](https://github.com/aristocratos/btop)
* [Pywal-Fox](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
* [SilentSDDM](https://github.com/uiriansan/SilentSDDM)
* [Rofi-Emoji](https://github.com/Mange/rofi-emoji)
* [Little Fox](https://github.com/biglavis/LittleFox)
