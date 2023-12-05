#!/bin/sh

BASE_DIR="$HOME/dotfiles/networking"

network() {
  sudo systemctl enable --now systemd-networkd
  sudo cp -r $BASE_DIR/configs/network /etc/systemd/
  sudo cp -r $BASE_DIR/configs/resolv.conf /etc/
  ping -c 4 google.com
}

_samba() {
  sudo pacman -Sy samba gvfs-smb --noconfirm
  sudo smbpasswd -a $USER

  sudo cp -r $BASE_DIR/samba /etc/
  sudo systemctl enable --now smb
}

network
_samba
