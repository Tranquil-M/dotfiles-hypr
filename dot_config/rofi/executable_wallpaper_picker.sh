#!/bin/bash

wallpaper_dir="${HOME}/Pictures/Wallpapers" # set wallpaper dir
cache_dir="${HOME}/.cache/jp/${theme:-default}" # cache directory for wallpaper thumbnails
mkdir -p "${cache_dir}" # make folder if not exists already

thumb_size=50 # px thumb size (will be square)

# rofi layout command; theme will rely on rofi theme
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

# full rofi command
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
        display_name="${filename%.*}"   # removes file extension
        printf "%s\x00icon\x1f%s\n" "$display_name" "${cache_dir}/${filename}"
    done | eval "$rofi_command"
)

[[ -n "$wall_selection" ]] || exit 1

# verify and reconstruct full filename
selected_file=$(find "$wallpaper_dir" -maxdepth 1 -type f -name "${wall_selection}.*" | head -n 1)

# enforce fallback color and select first color provided by matugen
matugen image "$selected_file" --source-color-index 0 --fallback-color "#FFFFFF" || matugen image "$selected_file" --fallback-color "#FFFFFF"
awww img --resize crop --transition-type random "$selected_file"

# create copy of wallpaper for hyprlock
cp "$selected_file" ~/Pictures/current_wallpaper.png
