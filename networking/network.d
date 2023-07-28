#!/bin/bash

network() {
  if [ -f "/usr/bin/nmcli" ]
  then 
    sudo systemctl enable --now NetworkManager
    sudo cp -r ~/dotfiles/networking/system-connections /etc/NetworkManager/
  else 
    prinf "NetworkManager isn't installed! Make sure you install it first!"
  fi
}

network
