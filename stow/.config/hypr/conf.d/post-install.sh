echo "Applying Hyprland Colorscheme..."
cd "$HOME"
if command -v matugen >/dev/null 2>&1; then
  matugen image "~/Pictures/Wallpapers/White-Cat.png" --source-color-index 0 || matugen image "~/Pictures/Wallpapers/White-Cat"
  swww img --resize crop --transition-type center "~/Pictures/Wallpapers/White-Cat.png"
fi
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'

sleep 5

rm -- "$0"
