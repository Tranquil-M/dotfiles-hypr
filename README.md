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

### Desktop
![Desktop](https://github.com/Tranquil-M/dots/blob/master/Sample/Window.png?raw=true)

### Launcher
![Application Selector](https://github.com/Tranquil-M/dots/blob/master/Sample/Launcher.png?raw=true)

### Wallpaper Selector
![Wallpaper Selector](https://github.com/Tranquil-M/dots/blob/master/Sample/Wallpaper%20Selector.png?raw=true)

### Notification Manager
![Notification Manager](https://github.com/Tranquil-M/dots/blob/master/Sample/Notification%20Center.png?raw=true)

### Lock Manager
![Lock Manager](https://github.com/Tranquil-M/dots/blob/master/Sample/Lock%20Manager.png?raw=true)

### Settings
![Settings](https://github.com/Tranquil-M/dots/blob/master/Sample/Settings.png?raw=true)

### Other Wallpaper Colors
![Minecraft Purple](https://github.com/Tranquil-M/dots/blob/master/Sample/Purple.png?raw=true)
![Anord Pink](https://github.com/Tranquil-M/dots/blob/master/Sample/Pink.png?raw=true)
![Cat Club Green](https://github.com/Tranquil-M/dots/blob/master/Sample/Green.png?raw=true)

> [!NOTE]
> All wallpaper colors are completely adaptive! It changes everything, all just depends on what wallpaper you are using.

---

<a name="install"></a>
## Installation

1. Download this repository with git:
    ```bash
    sudo pacman -Sy git; git clone https://github.com/Tranquil-M/dotfiles.git .dots; cd .dots
    ```

2. Run the installation script:
   ```bash
   sh install.sh
   ```

> [!NOTE]
> The install script is currently only compatible with Arch Linux.

---

<a name="walkthrough"></a>
## How does the install script work?

1. Runs a packange installation script, and if a package cannot be found in official repositories, it installs [yay](https://github.com/jguer/yay) and scans the AUR.
2. Uses GNU Stow to connect dotfiles using symlinks.
3. Sets default apps and colors.

---

<a name="feat"></a>
## Features

These dotfiles are meant to be simple and practical for daily use, with some additional features:

- Screenshot utility using Grim, Slurp, and Satty  
  Saves to: `~/Pictures/Screenshots`
- Noctalia
    - Wallpaper switcher
    - Application Launcher
    - Lockscreen
    - Logout Menu
    - Clipboard History
    - Tab switcher
    - Control Panel
    - On-screen display
- Custom Discord theme using Equibop (Discord Client)
- Kickstart Nvim configuration
- Exa
- Zoxide
- Firefox theme using pywal-fox and custom css  
- Qylock customizable sddm themes

---

<a name="binds"></a>
## Keybindings

### Core actions
- Super + Space → Open launcher
- Super + C → Open control center
- Super + S → Open settings
- Super + M → Open media panel
- Super + N → Open notification history
- Super + X → Open emoji selector via launcher
- Super + V → Open clipboard history via launcher
- Super + B → Open battery panel
- Alt + Tab → Tab Switcher

### System
- Super + A → Toggle Bar Visibility

### Applications
- Super + Enter → Open terminal
- Super + Shift + F → Open file manager
- Super + E → Toggle wallpaper

### Media controls
- Volume up key → Increase volume
- Volume down key → Decrease volume
- Mute key → Mute audio
- Brightness up key → Increase brightness
- Brightness down key → Decrease brightness
- Next track → Next song
- Play/Pause → Play or pause media
- Previous track → Previous song

### Screenshots
- Super + Z → Capture selected area
- Super + Shift + Z → Capture full screen

### Window management
- Super + W → Close active window
- Super + T → Toggle floating window
- Super + Backspace → Open session menu
- Super + F → Fullscreen mode
- Super + Alt + F → Exit fullscreen mode

### Notifications
- Super + Comma → Remove oldest notification
- Super + Shift + Comma → Clear all notifications

### Focus navigation
- Super + Arrow keys → Move focus between windows

### Move windows
- Super + Shift + Arrow keys → Move window in direction

### Workspaces
- Super + 1–0 → Switch to workspace 1–10
- Super + Shift + 1–0 → Move window to workspace 1–10
- Super + Mouse wheel → Switch workspaces

### Mouse actions
- Super + Left click drag → Move window
- Super + Right click drag → Resize window

### Window switching
- Alt + Tab → Next window
- Alt + Shift + Tab → Previous window

### Laptop
- Close lid → Lock screen and suspend system

>[!NOTE]
>Temporary workspaces are supported, but a minimum of 3 persistent workspaces are assigned per-monitor on startup.

---
<a name="pkgs">

## Packages

* [Btop](https://github.com/aristocratos/btop)
* [GNU Stow](https://www.gnu.org/software/stow/)
* [Equibop](https://equicord.org/)
* [Exa](https://github.com/ogham/exa)
* [Grim](https://github.com/emersion/grim)
* [Kickstart](https://github.com/nvim-lua/kickstart.nvim)
* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Little Fox](https://github.com/biglavis/LittleFox)
* [Matugen Templates](https://github.com/InioX/matugen-themes)
* [Pywal-Fox](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
* [Satty](https://github.com/Satty-org/Satty)
* [Qylock]([https://github.com/uiriansan/SilentSDDM](https://github.com/Darkkal44/qylock))
* [Slurp](https://github.com/emersion/slurp)
* [Zoxide](https://github.com/ajeetdsouza/zoxide)
* [Noctalia](https://noctalia.dev/)
