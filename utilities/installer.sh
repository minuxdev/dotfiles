#!/bin/bash

BASE_DIR="$HOME/dotfiles/utilities"
source "$HOME/dotfiles/progress_notes.sh"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"

generics () 
{
	start_task 'GENERICS'
	
	GENERICS=(
		bat lsd tldr grim unzip man ristretto gdu tree
	)
	sudo pacman -Sy ${GENERICS[*]} --noconfirm
	yay -Sy rar --noconfirm

	ALIASES=(
	'ls="lsd"'
	'la="lsd -a"'
	'll="lsd -la"'
	'cd="z"'
	'du="gdu"'
	'sf="source ~/.zshrc"'
	)
	$set_aliases "${ALIASES[@]}"

	end_task
}

bluetooth () 
{
	start_task 'BLUETOOTH'
	
	sudo pacman -S bluez bluez-utils --noconfirm 
	sudo awk -i inplace ' 
	/PairableTimeout/ { print "PairableTimeout = 0" };
	/ControllerMode/ { print "ControllerMode = bredr" };
	/^(A|#A)utoEnable/ { print "AutoEnable = true" };
	/DiscoverableTimeout/ { print "DiscoverableTimeout = 0" }; 1
	' /etc/bluetooth/main.conf

	systemctl enable --now bluetooth.service
	end_task
}

mtp () 
{
	start_task 'MTP'
	
	sudo pacman -S jmtpfs --noconfirm
	yay -Sy gvfs-mtp --noconfirm
	
	end_task
}

monitoring() 
{
	start_task 'MONITORING'
	
	pip3 install bpytop &&
	sed -i ' /EXPORTS/a\export PATH=$PATH:$HOME/.local/bin ' ~/.zshrc
	$set_aliases 'top="bpytop"'
	
	end_task
}

screenshot () 
{
	start_task 'SCREENSHOT'
	
	yay -S imlib2 --noconfirm
	sudo pacman -S grim slurp --noconfirm &&
	cp -rv "$BASE_DIR/print_screen.sh" "$HOME/.local/bin/" 
	$set_aliases 'shot="print_screen"'
	sed -i " /PROGRAMS CONTROL/a\bind = , print, exec, $HOME/.local/bin/print_screen.sh " \
	"$HOME/.config/hypr/hyprland.conf" 
	
	end_task
}

players () 
{
	start_task 'PLAYERS'
	
	sudo pacman -S vlc cmus mpv --noconfirm
	
	end_task
}

browsers () 
{
	start_task 'BROWSERS'
	
	sudo pacman -S firefox chromium --noconfirm
	
	end_task
}


generics 
bluetooth
mtp
monitoring
screenshot
players
browsers
