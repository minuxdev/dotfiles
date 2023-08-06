#!/bin/bash

source $HOME/dotfiles/progress_notes.sh

CONFIG_DIR="$HOME/.config"
BASE_SRC_DIR="$HOME/dotfiles/dewm"

hyprland ()
{
	start_task 'HYPRLAND'

	sudo pacman -Sy xorg-xwayland --noconfirm
	yay -S hyprland-git --noconfirm
	cp -rv "$BASE_SRC_DIR/hyprland" "$CONFIG_DIR/"

	end_task 
}

waybar ()
{
	start_task 'WAYBAR'

	yay -S waybar-hyprland-git --noconfirm
	cp -rv "$BASE_SRC_DIR/waybar" "$CONFIG_DIR/"

	end_task 
}

hyprpaper ()
{
	start_task 'HYPRPAPER'

	yay -S hyprpaper-git --noconfirm
	cp -rv "$BASE_SRC_DIR/hyprpaper" "$CONFIG_DIR/"

	end_task 
}

wofi ()
{
	start_task 'WOFI'

	yay -S wofi --noconfirm
	cp -rv "$BASE_SRC_DIR/wofi" "$CONFIG_DIR/"

	end_task
}

[ ! -f "/usr/bin/yay" ] && (printf "Helper not installed!"; exit 10) || 
  (hyprland; waybar; hyprpaper; wofi)
