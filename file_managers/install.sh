#!/bin/bash 


#  _____ _ _        __  __
# |  ___(_) | ___  |  \/  | __ _ _ __
# | |_  | | |/ _ \ | |\/| |/ _` | '__|
# |  _| | | |  __/ | |  | | (_| | |
# |_|   |_|_|\___| |_|  |_|\__, |_|
#                          |___/
#===================================

set -e

SCRIPT_DIR=$(dirname "$(realpath "$0") ")
CONFIG_DIR="$HOME/.config"

sudo pacman -S ranger thunar --noconfirm --needed 
if command -v ranger &> /dev/null; then
  [ -d "$CONFIG_DIR/ranger" ] && mv "$CONFIG_DIR/ranger" "$CONFIG_DIR/ranger.bkp"
  cp -rv "$SCRIPT_DIR/ranger" "$CONFIG_DIR/"
  printf "\n::Ranger was installed successfully.\n"
else
  echo "::Ranger failed to install."
fi

