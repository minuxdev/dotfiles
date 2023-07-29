#!/bin/bash
BASE_DIR="$HOME/dotfiles/file_managers"

ranger () {
  sudo pacman -S ranger ueberzug highlight --noconfirm
  yay -S poppler --noconfirm
  cp -rv "$BASE_DIR/ranger" "$HOME/.config/"
}

pacman -S nautilus --noconfirm
ranger 
