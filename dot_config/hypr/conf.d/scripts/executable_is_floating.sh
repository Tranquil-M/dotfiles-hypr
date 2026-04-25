IS_FLOATING=$(hyprctl activewindow -j | jq '.floating')

if [ "$IS_FLOATING" == "true" ]; then
    hyprctl dispatch resizeactive exact 60% 75%
    hyprctl dispatch centerwindow
fi
