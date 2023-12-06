#!/bin/sh

BASE_DIR="$HOME/dotfiles/networking"

network() {
  sudo cp -r "$BASE_DIR/configs/network" /etc/systemd/
  sudo cp -r "$BASE_DIR/configs/resolv.conf" /etc/
  sudo systemctl enable --now systemd-networkd
  sudo systemctl enable --now iwd
  ping -c 2 google.com
}

_samba() {
  sudo pacman -Sy samba gvfs-smb --noconfirm
  sudo smbpasswd -a "$USER"

  sudo cp -r "$BASE_DIR/samba" /etc/
  sudo systemctl enable --now smb
}

network
#_samba
