#!/bin/bash

wallpaper_dir="${HOME}/Pictures/Wallpapers"
cache_dir="${HOME}/.cache/jp/${theme:-default}"
mkdir -p "${cache_dir}"

thumb_size=50

rofi_override="
element-icon {
    size: ${thumb_size}px;
    border-radius: 4px;
}
listview {
    columns: 3;
    rows: 2;
    scrollbar: true;
    dynamic: true;
    cycle: false;
}
window {
    width: 60%;
    height: 60%;
}
"

rofi_command="rofi -dmenu -show-icons true \
-theme ${HOME}/.config/rofi/config.rasi \
-theme-str \"${rofi_override}\""

# Generate thumbnails
shopt -s nullglob
for image in "$wallpaper_dir"/*.{jpg,jpeg,png,webp}; do
    [ -f "$image" ] || continue
    filename=$(basename "$image")
    output="${cache_dir}/${filename}"
    if [ ! -f "$output" ]; then
        convert -strip "$image" -thumbnail 100x100^ -gravity center -extent 100x100 "$output"
    fi
done

# Feed into rofi
wall_selection=$(
    find "${wallpaper_dir}" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) |
    sort |
    while read -r file; do
        filename=$(basename "$file")
        display_name="${filename%.*}"   # removes extension
        printf "%s\x00icon\x1f%s\n" "$display_name" "${cache_dir}/${filename}"
    done | eval "$rofi_command"
)

[[ -n "$wall_selection" ]] || exit 1

# Reconstruct full filename (add extension back)
selected_file=$(find "$wallpaper_dir" -maxdepth 1 -type f -name "${wall_selection}.*" | head -n 1)

matugen image "$selected_file" --source-color-index 0 --fallback-color "#FFFFFF" || matugen image "$selected_file" --fallback-color "#FFFFFF"
awww img --resize crop --transition-type center "$selected_file"
cp "$selected_file" ~/Pictures/current_wallpaper.png
