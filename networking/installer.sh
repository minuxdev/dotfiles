#!/bin/bash

source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/networking"

network_manager () {
	start_task 'NPM PACKAGES'
	sudo systemctl enable --now NetworkManager
	sudo cp -rv "$BASE_DIR/system-connections" /etc/NetworkManager/
	end_task
}

samba () {
	start_task 'SAMBA'
	sudo pacman -S samba --noconfirm
	sudo cp -rv "$BASE_DIR/samba" /etc/samba
	USER=`whoami`
	smbpasswd -a "$USER"
	systemctl enable --now smb
	end_task
}

network_manager
samba
