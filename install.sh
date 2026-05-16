SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
INSTALLERS="$SCRIPT_DIR/scripts"

cd $SCRIPT_DIR

# Reset Colors
trap 'echo -ne "\033[0m"' EXIT

# Palette
C_MAIN='\033[38;2;202;169;224m'
C_ACCENT='\033[38;2;145;177;240m'
C_DIM='\033[38;2;129;122;150m'
C_GREEN='\033[38;2;166;209;137m'
C_YELLOW='\033[38;2;229;200;144m'
C_RED='\033[38;2;231;130;132m'
C_BOLD='\033[1m'
C_RESET='\033[0m'

header() {
    clear
    echo -e "${C_MAIN}${C_BOLD}"
    echo " ╭──────────────────────────────────────────╮"
    echo " │             Tranquil-M's dots!           │"
    echo " ╰──────────────────────────────────────────╯"
    echo -e "${C_RESET}"
}

info() {
    echo -e "${C_MAIN}${C_BOLD} ╭─ 󰓅 $1${C_RESET}"
}

substep() {
    echo -e "${C_MAIN}${C_BOLD} │  ${C_DIM}❯ ${C_RESET}$1"
}

success() {
    echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_GREEN}✔ ${C_RESET}$1\n"
}

error() {
    echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_RED}✘ ${C_RESET}$1\n"
}

header

info "Checking OS type..."

if ! command -v pacman &> /dev/null; then
	error "Sorry, this script is only available on Arch Linux Distributions."
	exit 1
fi

if ! sudo -n true 2>/dev/null; then
	substep "${C_YELLOW}Note: sudo may prompt for your password during installaion${C_RESET}"
fi

success "We're on Arch!"

info "Checking for internet connection..."

if ! ping -c 1 -W 1 8.8.8.8 &> /dev/null; then
	error "A stable internet connection is required for this installation."
	exit 1
fi

success "Internet connection found!"

info "Would you like to install an SDDM theme?"
substep "This will clone the \"qylock\" repository written by ${C_YELLOW}Darkkal44${C_RESET} on github."
substep "Make sure that you have a stable connection to wifi during this installation!"
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}I would love an sddm theme!"
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}No thanks, move on."
echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [1/2]: ${C_RESET}"
read -rp "" QT_CHOICE

if [ "$QT_CHOICE" == "1" ]; then
    sh "$INSTALLERS/install_sddm_themes.sh"
    success "Done! :D"
else
    echo "ok"
fi

sh "$INSTALLERS/set_defaults.sh"

sh "$INSTALLERS/create_symlinks.sh"

sh "$INSTALLERS/install_firefox_theme.sh"

info "Running Post Install Scripts"
sh "$HOME/.config/hypr/conf.d/scripts/create_workspaces.sh"
success "Finished!"

info "Would you like to reboot your computer?"
substep "This may be required for some features to be properly set."
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}1 ${C_DIM}❯ ${C_RESET}Yes please!"
echo -e "${C_MAIN}${C_BOLD} │  ${C_ACCENT}2 ${C_DIM}❯ ${C_RESET}Nah, just let me in already."
echo -ne "${C_MAIN}${C_BOLD} ╰─ ${C_YELLOW}Choice [y/n]: ${C_RESET}"
read -rp "" CONSENT

if [ "$CONSENT" == "y" ]; then
    echo "OK BYE COME AGAIN"
    sudo reboot now
    exit 0
fi

echo ""

info "Thanks!"
substep "Thank you so much for using my dotfiles!"
substep "${C_YELLOW}Please consider starring this repository and sharing this with your friends!${C_RESET}"
success "Come again soon!"

exit 0
