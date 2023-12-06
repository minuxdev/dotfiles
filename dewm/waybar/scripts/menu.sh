#!/bin/bash 

pkill wofi

MENU=$( echo "Firfox
MPV" | wofi --style ./menu.css \
    --width 320px \
    -b --location top_left 1 \
    -x -10px -y 10px \
    --dmenu --prompt "Menu")

case $MENU in 
    'Firefox')
        firefox;;
    'MPV')
        echo '';;
    *)
        echo 'Invalid Option';;
esac
