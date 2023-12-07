#!/bin/bash

BASE_DIR="$HOME/dotfiles/utilities"
source "$HOME/dotfiles/progress_notes.sh"
source "$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"

generics() {
	start_task 'GENERICS'
	GENERICS=(
		bat lsd tldr grim unzip man rsync
	)
	sudo pacman -Sy "${GENERICS[*]}" --noconfirm

	ALIASES=(
		'ls="lsd"'
		'la="lsd -a"'
		'll="lsd -la"'
		'cat="bat --theme=\"TwoDark\" --style=\"numbers,changes,header\""'
		'sf="source %s/.zshrc" "$HOME"'
	)
	set_aliases "${ALIASES[@]}"

	end_task
}

bluetooth() {
	start_task 'BLUETOOTH'
	sudo pacman -S 'bluez' 'bluez-utils' --noconfirm
	sudo awk -i inplace ' 
  /PairableTimeout/ { print "PairableTimeout = 0" };
  /ControllerMode/ { print "ControllerMode = bredr" };
  /^(A|#A)utoEnable/ { print "AutoEnable = true" };
 a/DiscoverableTimeout/ {print "DiscoverableTimeout = 0" }; 1
  ' /etc/bluetooth/main.conf

	systemctl enable --now bluetooth.service
	end_task
}

mtp() {
	start_task 'MTP'
	sudo pacman -S jmtpfs --noconfirm
	yay -Sy gvfs-mtp --noconfirm
	end_task
}

monitoring() {
	start_task 'MONITORING'
	sudo pacman -S bpytop &&
		sed -i ' /EXPORTS/a\export PATH=$PATH:$HOME/.bin ' ~/.zshrc
	set_aliases 'top="bpytop"'
	end_task
}

screenshot() {
	start_task 'SCREENSHOT'
	yay -S imlib2 --noconfirm
	sudo pacman -S grim slurp --noconfirm &&
		cp -rv "$BASE_DIR/print_screen.sh" "$HOME/.bin/"
	set_aliases 'shot="print_screen"'
	sed -i " /PROGRAMS CONTROL/a\bind = , print, exec, $HOME/.bin/print_screen.sh"
	end_task
}

browsers() {
	start_task 'BROWSERS'
	sudo pacman -S firefox chromium --noconfirm
	end_task
}

players() {
	start_task 'PLAYERS'

	sudo pacman -S vlc mpv audacious cmus --noconfirm

	end_task
}

generics
bluetooth
mtp
monitoring
screenshot
browsers
