#!/bin/bash

shutdown=""
reboot="󰜉"
logout=""

options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | rofi -theme themes/powermenu.rasi -dmenu -selected-row 1)"

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
