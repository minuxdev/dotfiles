#!/bin/bash

network() {
  sudo systemctl enable --now NetworkManager
  sudo cp -r ~/dotfiles/networking/system-connections /etc/NetworkManager/
}

network
