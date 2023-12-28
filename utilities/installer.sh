#!/bin/bash

source "$HOME/dotfiles/progress_notes.sh"
source "$HOME/dotfiles/scripts/set_aliases.sh"
HYPR_FILE="$HOME/.config/hypr/hyprland.conf"
SCRIPTS="$HOME/.config/scripts"

generics() {
	start_task 'GENERICS'

	sudo pacman -S lsd gdu man tldr unzip rsync less --noconfirm

	ALIASES=(
		'ls="lsd"'
		'la="lsd -a"'
		'll="lsd -la"'
		'sf="source $HOME/.zshrc"'
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
 /DiscoverableTimeout/ {print "DiscoverableTimeout = 0" }; 1
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
	sudo pacman -S bpytop --noconfirm
	sed -i ' /EXPORTS/a\export PATH=$PATH:$HOME/.config/scripts/ ' ~/.zshrc
	set_aliases 'top="bpytop"'
	end_task
}

screenshot() {
	start_task 'SCREENSHOT'
	yay -S imlib2 --noconfirm

	sudo pacman -S grim slurp --noconfirm
	sed -i " /PROGRAMS EXECUTION/a\bind = , print, exec, $SCRIPTS/screenshot" "$HYPR_FILE"
	end_task
}

browsers() {
	start_task 'BROWSERS'
	sudo pacman -S firefox chromium --noconfirm
	sed -i \
		-e " /-- PROGRAMS EXECUTION --/a\bind = SUPER SHIFT, F, exec, firefox -new-tab " \
		-e " /-- PROGRAMS EXECUTION --/a\bind = SUPER SHIFT, C, exec, chromium -new-tab " \
		-e " /Window-Rules/a\windowrulev2 = float,class:(firefox),title:(Library) " \
		"$HYPR_FILE"
	end_task
}

players() {
	start_task 'PLAYERS'

	sudo pacman -S vlc mpv audacious cmus --noconfirm

	end_task
}

notifications() {
	start_task 'NOTIFICATION'
	sudo pacman -S dunst libnotify --noconfirm
	cp -rv ~/dotfiles/utilities/dunst ~/.config/dunst/

	sed -i \
		-e " /-- PROGRAMS EXECUTION --/a\bind = CONTROL, SPACE, exec, dunstctl close " \
		-e " /-- PROGRAMS EXECUTION --/a\bind = CONTROL SHIFT, SPACE, exec, dunstctl close_all " \
		"$HYPR_FILE"

	end_task
}

sudo pacman -Sy

generics
bluetooth
mtp
monitoring
screenshot
browsers
players
notifications
