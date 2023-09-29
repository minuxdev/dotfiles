#!/bin/bash

source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/networking"

handle_network ()
{
	start_task 'SYSTEMD-NETWORKD'
	
	sudo cp -rv "$BASE_DIR"/configs/* /etc/
	sudo systemctl enable --now systemd-networkd

  sudo pacman -S ufw net-tools --noconfirm
	
	end_task
}

samba () 
{
	start_task 'SAMBA'
	
	sudo pacman -S samba --noconfirm
	sudo cp -rv "$BASE_DIR/samba" /etc/samba
	USER=`whoami`
	smbpasswd -a "$USER"
	systemctl enable --now smb
	
	end_task
}
handle_network
samba
