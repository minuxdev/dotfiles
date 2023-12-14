#!/bin/bash
#
JOIN_DISPLAYS='JOIN DISPLAYS'
OUTPUT="SPECIFICY DISPLAY"
REGION='SELECT REGION'
date=$(date "+%F_%H%M%S")
ROFI_THEME=~/.config/rofi/themes/screenshot.rasi

selected=$(
	echo -e "$REGION\n$OUTPUT\n$JOIN_DISPLAYS" | rofi -dmenu -theme $ROFI_THEME
)

mkdir -p ~/screenshots && directory=~/screenshots

if [[ "$selected" = "$REGION" ]]; then
	sleep 1
	grim -g "$(slurp)" "$directory/region-$date.jpg"
elif [[ "$selected" = "$OUTPUT" ]]; then
	outputs=$(xrandr | grep 'connected' | awk ' { print $1 }')
	output=$(echo "$outputs" | rofi -dmenu -theme $ROFI_THEME --prompt "Display: ")
	sleep 1
	grim -o "$output" "$directory/joined-displays-$date.jpg"
else
	sleep 1
	grim "$directory/region-$date.jpg"
fi
