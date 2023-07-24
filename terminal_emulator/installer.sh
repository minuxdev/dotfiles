#!/bin/bash
CONFIG_DIR="~/.config"
BASE_DIR="~/dotfiles/terminal_emulator"

source "$BASE_DIR/scripts/set_aliases.sh"

fonts ()
{
    FONTS_DIR="~/.fonts/"
    [[ ! -d "$FONTS_DIR" ]] && mkdir "$FONTS_DIR" 
    cp -rv "$BASE_DIR/fonts/" "$FONTS_DIR"
    fc-cache fc-list | awk ' /(Space|Roboto)/ '
    sleep 2s
    clear
}

call_znap_installer ()
{
  sudo pacman -S zsh --noconfirm

  /usr/bin/zsh "$BASE_DIR/scripts/znap_installer.sh"

}

alacritty ()
{
  sudo pacman -S alacritty --noconfirm
  yay -S alacritty-themes --noconfirm
  cp -r "$BASE_DIR/alacritty/" "$CONFIG_DIR"
  
  set_aliases 'at="alacritty-themes"'
}

tmux() {
  sudo pacman -S tmux --noconfirm &&
  cp -rv "$BASE_DIR/tmux" "$CONFIG_DIR"
}

fonts
call_znap_installer
alacritty
tmux

