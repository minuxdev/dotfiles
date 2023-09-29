#!/bin/bash

source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/networking"

sys_networkd ()
{
	start_task 'SYSTEMD-NETWORKD'
	
	sudo systemctl enable --now systemd-networkd
	sudo cp -rv "$BASE_DIR"/configs/* /etc/
	
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
sys_networkd
samba
