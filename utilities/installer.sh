#!/bin/bash

BASE_DIR="$HOME/dotfiles/utilities"
source "$HOME/dotfiles/progress_notes.sh"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"

generics () 
{
	start_task 'GENERICS'
	
	GENERICS=(
		bat lsd tldr grim atool man ristretto gdu tree rsync testdisk
	)
	sudo pacman -S ${GENERICS[*]} --noconfirm

  mkdir "$HOME/.config/gdu" &&
  cp -r "$BASE_DIR/gdu.yaml" "$HOME/.config/gdu/"

	ALIASES=(
	'ls="lsd"'
	'la="lsd -a"'
	'll="lsd -la"'
	'du="gdu"'
	'dud="gdu -d"'
	'sf="source ~/.zshrc"'
  'rs="rsync -auv"'
  'xfile="atool -x $1"'
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
	/AlwaysPairable/ { print "AlwaysPairable = true" };
	/ControllerMode/ { print "ControllerMode = bredr" };
	/^(A|#A)utoEnable/ { print "AutoEnable = true" };
	/DiscoverableTimeout/ { print "DiscoverableTimeout = 0" }; 1
	' /etc/bluetooth/main.conf

	systemctl enable --now bluetooth.service
	$set_aliases 'bctl="bluetoothctl"'
	end_task
}

mtp () 
{
	start_task 'MTP'
	
	sudo pacman -S jmtpfs --noconfirm
	yay -Sy gvfs-smb gvfs-mtp --noconfirm
	
	end_task
}

monitoring() 
{
	start_task 'MONITORING'
	
  sudo pacman -S bpytop --noconfirm
	sed -i " /== EXPORTS/a\export PATH=$PATH:$HOME/.bin " ~/.zshrc
	$set_aliases 'top="bpytop"'
	
	end_task
}

binaries () 
{
	start_task 'SCREENSHOT'
	
	yay -S imlib2 --noconfirm
	sudo pacman -S grim slurp --noconfirm 
	
	BINARIES="$HOME/.bin"
	[ ! -d "$BINARIES" ] && mkdir "$BINARIES"
	cp -rv "$BASE_DIR/bin" "$BINARIES"
	sed -i " /PROGRAMS CONTROL/a\bind = , print, exec, $HOME/.local/bin/print_screen.sh " \
	"$HOME/.config/hyprland/hyprland.conf" 
	grep '.bin' "$HOME/.zshrc"
	[ "$?" != 0 ] && sed -i ' /EXPORTS/a\export PATH=$BINARIES:$PATH ' "$HOME/.zshrc"
	$set_aliases 'shot="print_screen"'
	$set_aliases 'ms="mount-shares"'
	
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
	
	sudo pacman -S firefox chromium qbittorrent --noconfirm
	
	end_task
}

sudo pacman -Sy

generics 
bluetooth
mtp
monitoring
binaries
players
browsers
