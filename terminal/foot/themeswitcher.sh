#!/bin/sh

# List all available themes
ROFI_DIR=~/.config/rofi
FOOT_THEMES=~/.config/foot/themes
selected_theme=$(ls -1 "$FOOT_THEMES" | rofi -show -dmenu -theme $ROFI_DIR/default.rasi)

# Apply selected theme
[ ! -z "$selected_theme" ] && cat $FOOT_THEMES/$selected_theme > "$FOOT_THEMES/current_theme.ini"
