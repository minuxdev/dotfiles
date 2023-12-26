#!/bin/sh

source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/networking"

network() {
	start_task 'NETWORK CONFIG'
	sudo cp -r "$BASE_DIR/configs/network" /etc/systemd/
	sudo cp -r "$BASE_DIR/configs/resolv.conf" /etc/
	sudo systemctl enable --now systemd-networkd
	sudo systemctl enable --now iwd
	sudo systemctl restart systemd-networkd
	sudo systemctl status systemd-networkd
	sleep 2
	ping -c2 -W2 google.com
	sudo pacman -S cifs-utils --noconfirm

	end_task
}

_samba() {
	sudo pacman -Sy samba gvfs-smb --noconfirm
	sudo smbpasswd -a "$USER"

	sudo cp -r "$BASE_DIR/samba" /etc/
	sudo systemctl enable --now smb
}

network
#_samba
