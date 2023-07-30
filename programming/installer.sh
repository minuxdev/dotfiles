#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
source "$HOME/terminal_emulator/scripts/set_aliases.sh"

  sudo npm install -g scss live-server

nvim () {
  sudo pacman -Sy neovim --noconfirm
  cp -rv "$BASE_DIR/nvim" "$HOME/.config/"
  set_aliases 'nv="nvim"'
}
