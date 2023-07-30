#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
source "$HOME/terminal_emulator/scripts/set_aliases.sh"

npm_install () {
  nvm install node
}

nvim () {
  sudo pacman -Sy neovim --noconfirm
  cp -rv "$BASE_DIR/nvim" "$HOME/.config/"
  set_aliases 'nv="nvim"'
}
