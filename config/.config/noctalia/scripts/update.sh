#!/usr/bin/bash

# use pkexec instead of sudo
export PACMAN_AUTH="pkexec"

# temp log file
log=/tmp/update.log

notify-send "System Updating..." "Writing log to $log"

# check if command executes without error, and write to log
if { yay -Syyu --noconfirm && flatpak update -y; } >"$log" 2>&1; then
    notify-send "System Updates Complete" "See $log for details."
else
    notify-send -u critical "System Update Failed" "See $log for details."
fi
