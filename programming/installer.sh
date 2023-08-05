#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
source "$HOME/terminal_emulator/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

npm_packages () { 
  start_task 'NPM Packages'
  sudo npm install -g scss live-server 
end_task
}

nvim () {
  start_task 'NVIM'
  
  sudo pacman -Sy neovim --noconfirm
  yay -S wl-clipboard --noconfirm

  cp -rv "$BASE_DIR/nvim" "$HOME/.config/"
  set_aliases 'nv="nvim"'
  
end_task
}


npm_packages
nvim
