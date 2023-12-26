#!/bin/bash

shutdown=""
reboot="󰜉"
logout=""
ROFI_THEMES="$HOME/.config/rofi/themes/"

options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | rofi -theme $ROFI_THEMES/powermenu.rasi -dmenu -selected-row 1)"

case $chosen in
"$shutdown")
	sudo shutdown now
	;;

"$reboot")
	sudo reboot -i
	;;

"$logout")
	hyprctl dispatch exit
	;;
esac
