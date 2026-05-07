#!/usr/bin/env bash
# this is just a really janky way of making sure that when you press the togglefloat keybind, it opens in the middle of the screen

# uses jq to check if active window iw floating
IS_FLOATING=$(hyprctl activewindow -j | jq '.floating')

# if it is then center and resize it
if [ "$IS_FLOATING" == "true" ]; then
    hyprctl dispatch resizeactive exact 60% 75%
    hyprctl dispatch centerwindow
fi

