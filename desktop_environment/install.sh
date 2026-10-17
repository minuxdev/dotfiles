#!/bin/bash

set -e
#  ____            _    _                _____
# |  _ \  ___  ___| | _| |_ ___  _ __   | ____|_ ____   __
# | | | |/ _ \/ __| |/ / __/ _ \| '_ \  |  _| | '_ \ \ / /
# | |_| |  __/\__ \   <| || (_) | |_) | | |___| | | \ V /
# |____/ \___||___/_|\_\\__\___/| .__/  |_____|_| |_|\_/
#                               |_|
#=========================================================

_date=$(date +"%N")

SCRIPT_DIR=$(dirname "$(realpath "$0") ")
CONFIG_DIR="$HOME/.config"
ROOT_DIR=$(realpath "$SCRIPT_DIR/../")

_hyprland() {
  sudo pacman -Sy hyprland --noconfirm --needed

  if command -v hyprctl &>/dev/null; then
    [ -d "$CONFIG_DIR/hypr" ] && mv "$CONFIG_DIR/hypr" "$CONFIG_DIR/hypr.$_date.bkp"
    [ -d "$SCRIPT_DIR/hypr" ] && cp -rv "$SCRIPT_DIR/hypr" "$CONFIG_DIR/"
    printf "\n:: HYPRLAND was installed successfully on your system.\n"
  else
    printf "\n:: HYPRLAND not installed on your system.\n"
  fi

  if command -v awww &>/dev/null; then
    sudo pacman -S awww --noconfirm --needed
  else
    echo "awww installed"
  fi
}

_waybar() {
  sudo pacman -S waybar --noconfirm --needed

  if command -v waybar &>/dev/null; then
    [ -d "$CONFIG_DIR/waybar" ] && mv "$CONFIG_DIR/waybar" "$CONFIG_DIR/waybar.$_date.bkp"
    [ -d "$SCRIPT_DIR/waybar" ] && cp -rv "$SCRIPT_DIR/waybar" "$CONFIG_DIR/"
    printf "\n:: WAYBAR was installed successfully on your system.\n"
  else
    printf "\n:: WAYBAR not installed on your system.\n"
  fi
}

_rofi() {
  sudo pacman -S rofi --noconfirm --needed
  if command -v rofi &>/dev/null; then
    [ -d "$CONFIG_DIR/rofi" ] && mv "$CONFIG_DIR/rofi" "$CONFIG_DIR/rofi.$_date.bkp"
    [ -d "$SCRIPT_DIR/rofi" ] && cp -rv "$SCRIPT_DIR/rofi" "$CONFIG_DIR/"
    printf "\n:: ROFI was installed successfully on your system.\n"
  else
    printf "\n:: ROFI not installed on your system.\n"
  fi
}

_notifications() {
  sudo pacman -S dunst libnotify --noconfirm --needed
  # cp -r "$SCRIPT_DIR/dunst" ~/.config/
}

_display_manager() {
  sudo pacman -S ly --needed --noconfirm
  sudo systemctl enable ly@tty1.service
}

_hyprland
_waybar
_rofi
_notifications
_display_manager
