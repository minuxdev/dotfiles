#!/bin/bash

CONFIG_DIR=~/.config/wallpapers
ROFI_THEME=~/.config/rofi/themes/
source ~/.cache/wal/colors.sh

if [ -z "$1" ]; then
	selected=$(ls -1 "$CONFIG_DIR/" | rofi -dmenu -theme "$ROFI_THEME/wallpaper")
else
	selected="$1"
fi

if [ ! "$selected" ]; then
	echo "No wallpaper selected!"
	wal -q -i "$CONFIG_DIR/"
	exit
else
	wal -q -i "$CONFIG_DIR/$selected"

	transition_type="wipe"
	swww img "$CONFIG_DIR/$selected" \
		--transition-bezier .45,1.9,1,.4 \
		--transition-fps=60 \
		--transition-type=$transition_type \
		--transition-duration=0.25 \
		--transition-pos "$(hyprctl cursorpos)"
	notify-send "Wallpaper" "$selected"
fi
