#!/bin/bash
#
#

MENU=$( echo "Shutdown Now
Reboot
Log Out" | wofi --style $HOME/.config/wofi/style.css \
    --height 200px --width 280px \
    -b --location top_right 1 \
    -x -40px -y 10px \
    --dmenu --prompt "Menu")

case $MENU in 
    'Shutdown Now')
        sudo shutdown now;;
    'Log Out')
        hyprctl dispatch exit;;
    'Reboot')
        sudo reboot;;
    *)
        echo 'Invalid Option';;
esac

