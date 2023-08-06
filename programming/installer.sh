#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

npm_packages () { 
  	start_task 'NPM PACKAGES'
  	sudo npm install -g scss live-server 
  	end_task
}

text_editors () {
  	start_task 'TEXT EDITORS'
  
  	sudo pacman -Sy kate --noconfirm
  	[ $? != 0 ] && sudo pacman -S gedit --noconfirm

	end_task
}

nvim () {
  	start_task 'IDE: NVIM'
  
  	sudo pacman -Sy neovim --noconfirm
  	yay -S wl-clipboard --noconfirm

  	cp -rv "$BASE_DIR/nvim" "$HOME/.config/"
  	set_aliases 'nv="nvim"'
  
	end_task
}

npm_packages
text_editors
nvim
