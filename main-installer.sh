#!/bin/bash


while true 
do
	printf "
MENU

1. NETWORKING
2. DEPENDENCIES
3. DESKTOP ENVIRONMENT / WINDOWS MANAGER
4. TERMINAL EMULATOR
5. UTILITIES
6. FILE MANAGERS
7. PROGRAMMING
A. INSTALL ALL
M. BACK TO MENU
Q. EXIT
---------------------------------------
Choice: 
"
	read CHOICE 
		case $CHOICE in 
			1)
				$HOME/dotfiles/networking/installer.sh
				;;
			2)
				$HOME/dotfiles/dependencies/installer.sh
				;;
			3)
				$HOME/dotfiles/dewm/installer.sh
				;;
			4)
				$HOME/dotfiles/terminal_emulator/installer.sh
				;;
			5)
				$HOME/dotfiles/utilities/installer.sh
				;;
			6)
				$HOME/dotfiles/file_managers/installer.sh
				;;
			7)
				$HOME/dotfiles/programming/installer.sh
				;;
			a|A)
				printf "You are about to run all scripts described in the menu.\n"
				read -p "Proceed?: 1 - Yes or 0 - No " OPTION
				[ "$OPTION" = "0" ] && continue
				
				$HOME/dotfiles/dependencies/installer.sh &&
				$HOME/dotfiles/dewm/installer.sh &&
				$HOME/dotfiles/networking/installer.sh &&
				$HOME/dotfiles/terminal_emulator/installer.sh &&
				$HOME/dotfiles/utilities/installer.sh &&
				$HOME/dotfiles/file_managers/installer.sh &&
				$HOME/dotfiles/programming/installer.sh
				;;
			q|Q)
				printf "\nThank you for using this script. \
				Feel free to make comments here: minux.midi@gmail.com\n"
				exit
				;;
			*)
				printf "Invalid option, try again!\n"
				;;
		esac
done
