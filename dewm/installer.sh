#!/bin/bash

CONFIG_DIR="~/.config/"
SRC_BASE_DIR="~/dotfiles/dewm"


hyprland ()
{
  yay -Sy hyprland-git --noconfirm
  sudo cp -rv "$SRC_BASE_DIR/hyprland" "$CONFIG_DIR" 
}

hyprpaper ()
{
  yay -Sy hyprpaper-git --noconfirm
  sudo cp -rv "$SRC_BASE_DIR/hyprpaper" "$CONFIG_DIR" 
}

waybar ()
{
  yay -Sy waybar-hyprland-git --noconfirm
  sudo cp -rv "$SRC_BASE_DIR/waybar" "$CONFIG_DIR" 
}

wofi ()
{
  yay -Sy wofi --noconfirm
  #sudo cp -rv "$SRC_BASE_DIR/wofi" "$CONFIG_DIR" 
}
