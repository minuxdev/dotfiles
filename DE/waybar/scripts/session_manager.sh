#!/bin/bash
#
#

OPT=$( dialog --stdout --radiolist "Session Manger" 0 0 0 Shutdown "" on Reboot "" off Logout "" off )
echo $OPT

case $OPT in
	"Shutdown")
		sudo shutdown now;;
	"Reboot")
		sudo reboot;;
	"Logout")
		printf "logging user out";;
	*)
		printf "unknown option";;

esac

