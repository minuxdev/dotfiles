#!/bin/bash


base_dir=$(dirname "$( realpath "$0" )" )
theme_dir=$(realpath "$base_dir/themes")

# List available themes
selected_theme_name=$(ls -1 "$theme_dir" | rofi -dmenu)
# local selected_theme=$()


selected_theme_dir="$theme_dir/$selected_theme_name"

current_config_file="$base_dir/config"
current_style_file="$base_dir/style.css"
new_style_file="$selected_theme_dir"


# Swap config file
cp "$current_config_file" "$current_config_file.bkp"
cp "$selected_theme_dir/config" "$base_dir"

# Swap style file
cp "$current_style_file" "$current_style_file.bkp"
cp "$selected_theme_dir/style.css" "$base_dir"


# Restart waybar
pkill waybar
sleep 0.2
waybar &
