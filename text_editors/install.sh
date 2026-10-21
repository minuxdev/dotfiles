#!/bin/bash

#  _____    _ _ _
# | ____|__| (_) |_ ___  _ __ ___
# |  _| / _` | | __/ _ \| '__/ __|
# | |__| (_| | | || (_) | |  \__ \
# |_____\__,_|_|\__\___/|_|  |___/
#==================================================

set -e

SCRIPT_DIR=$(dirname "$(realpath "$0") ")
CONFIG_DIR="$HOME/.config"

printf "\n:: Installing IDE [Neovim]."
sudo pacman -Sy neovim gedit --noconfirm --needed
sudo pacman -S taplo \
  bash-language-server \
  yaml-language-server \
  eslint-language-server \
  typescript-language-server \
  shfmt \
  prettier \
  lua-language-server --noconfirm --needed

if command -v nvim &>/dev/null; then
  [ -d "$CONFIG_DIR/nvim" ] && mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.bkp"
  cp -rv "$SCRIPT_DIR/nvim" "$CONFIG_DIR/"
  printf "\n:: Neovim was installed successfully.\n"
else
  echo ":: Neovim failed to install."
fi
