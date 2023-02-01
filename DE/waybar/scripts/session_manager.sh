#!/bin/bash
#
#

MENU=$( echo "Shutdown Now
Reboot" | wofi --style $HOME/.config/waybar/scripts/menu.css \
    --height 150px --width 280px \
    -b --location top_right 3 \
    -x -10px -y 10px \
    --dmenu --prompt "Menu")

case $MENU in 
    'Shutdown Now')
        sudo shutdown now;;
    'Reboot')
        sudo reboot;;
    *)
        echo 'Invalid Option';;
esac

