#!/bin/bash

while true; do
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
	read -r  CHOICE
	case $CHOICE in
	1)
		~/dotfiles/networking/installer.sh
		;;
	2)
		~/dotfiles/dependencies/installer.sh
		;;
	3)
		~/dotfiles/dewm/installer.sh
		;;
	4)
		~/dotfiles/terminal_emulator/installer.sh
		;;
	5)
		~/dotfiles/utilities/installer.sh
		;;
	6)
		~/dotfiles/file_managers/installer.sh
		;;
	7)
		~/dotfiles/programming/installer.sh
		;;
	a | A)
		printf "You are about to run all scripts described in the menu.\n"
		read -p "Proceed?: 1 - Yes or 0 - No " OPTION
		[ "$OPTION" = "0" ] && continue

		~/dotfiles/dependencies/installer.sh &&
			~/dotfiles/dewm/installer.sh &&
			~/dotfiles/networking/installer.sh &&
			~/dotfiles/terminal_emulator/installer.sh &&
			~/dotfiles/utilities/installer.sh &&
			~/dotfiles/file_managers/installer.sh &&
			~/dotfiles/programming/installer.sh
		;;
	q | Q)
		printf """
Thank you for using this script.
Feel free to make comments here: minux.midi@gmail.com\n"""
		exit
		;;
	*)
		printf "Invalid option, try again!\n"
		;;
	esac
done
