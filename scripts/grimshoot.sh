#!/bin/bash
#

cmd=$(where grim)

[ $? != 0 ] && sudo pacman -S grim;

sleep $1
grim -t jpeg -q 100 ~/Pictures/"grimshot_$date.jpeg"
