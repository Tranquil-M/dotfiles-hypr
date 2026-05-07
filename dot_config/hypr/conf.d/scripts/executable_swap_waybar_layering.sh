#!/bin/bash

# waybar config location
CONFIG="$HOME/.config/waybar/config.jsonc"

# check if using top layering in config
if grep -q '"layer": "top"' "$CONFIG"; then
    sed -i 's/"layer": "top"/"layer": "bottom"/' "$CONFIG" # swap layering
else
    sed -i 's/"layer": "bottom"/"layer": "top"/' "$CONFIG"
fi
pkill -SIGUSR2 waybar # restart waybar
