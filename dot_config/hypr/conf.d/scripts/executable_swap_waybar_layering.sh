#!/bin/bash
CONFIG="$HOME/.config/waybar/config.jsonc"
if grep -q '"layer": "top"' "$CONFIG"; then
    sed -i 's/"layer": "top"/"layer": "bottom"/' "$CONFIG"
else
    sed -i 's/"layer": "bottom"/"layer": "top"/' "$CONFIG"
fi
pkill -SIGUSR2 waybar
