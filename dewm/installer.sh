#!/bin/bash

source "$HOME/dotfiles/progress_notes.sh"

CONFIG_DIR="$HOME/.config"
BASE_SRC_DIR="$HOME/dotfiles/dewm"

hyprland() {
	start_task 'HYPRLAND'

	sudo pacman -Sy hyprland --noconfirm
	cp -rv "$BASE_SRC_DIR/hypr" "$CONFIG_DIR/"

	end_task
}

waybar() {
	start_task 'WAYBAR'

	sudo pacman -S waybar --noconfirm
	cp -rv "$BASE_SRC_DIR/waybar" "$CONFIG_DIR/"

	end_task
}

_rofi() {
	start_task 'ROFI'
	sudo pacman -S rofi --noconfirm
	cp -rv "$BASE_SRC_DIR/rofi" "$CONFIG_DIR/"

	end_task
}

_sddm() {
	start_task 'SDDM'

	sudo pacman -S sddm --noconfirm

	[ ! -f /etc/sddm.conf ] &&
		sudo echo "
[Autologin]
User=$USER
Session=hyprland
      " >/etc/sddm.conf ||
		sudo sed -i -e "s/User=/User=$USER/" -e "s/Session=/Session=hyprland" /etc/sddm.conf

	systemctl enable sddm

	end_task
}

hyprland
waybar
_rofi
_sddm
