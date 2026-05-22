#!/usr/bin/env bash

source "scripts/ui.sh"

info "Setting defaults..."
substep xdg-mime default org.gnome.Nautilus.desktop inode/directory
substep sudo systemctl enable --now sddm.service
substep sudo systemctl enable --now tlp.service
substep sudo systemctl enable --now tlp-pd.service
substep sudo tlp balanced
# substep sudo echo "CPU_DRIVER_OPMODE_ON_AC=active
# CPU_DRIVER_OPMODE_ON_BAT=passive
# CPU_SCALING_GOVERNOR_ON_AC=ondemand
# CPU_SCALING_GOVERNOR_ON_BAT=conservative
# CPU_BOOST_ON_AC=1
# CPU_BOOST_ON_BAT=0
# PLATFORM_PROFILE_ON_AC=perforamce
# PLATFORM_PROFILE_ON_BAT=low-power
# TLP_PROFILE_AC=BAL
# TLP_PROFILE_BAT=SAV
# TLP_AUTO_SWITCH=2" >> /etc/tlp.conf

success "Set defaults sucessfuly!"
