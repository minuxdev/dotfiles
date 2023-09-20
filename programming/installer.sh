#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

npm_packages () 
{ 
  	start_task 'NPM PACKAGES'

  	sudo npm install -g live-server 
  	sudo npm install -g sass 

  	$set_aliases 'lvs="live-server $1"'

  	end_task
}

text_editors () 
{
  	start_task 'TEXT EDITORS'
  
  	sudo pacman -Sy kate --noconfirm
  	[ $? != 0 ] && sudo pacman -S gedit --noconfirm

	end_task
}

nvim () 
{
  	start_task 'IDE: NVIM'
  
  	sudo pacman -Sy neovim --noconfirm
  	yay -S wl-clipboard --noconfirm
	    CONFIG_DIR="$HOME/.config/nvim"
    [ ! -d "$CONFIG_DIR" ] && "$CONFIG_DIR" "$CONFIG_DIR.BKP"
  	cp -rv "$BASE_DIR/nvim" "$CONFIG_DIR"
  	$set_aliases 'nv="nvim"'
  
	end_task
}

npm_packages
text_editos
nvim
ALIASES=('da="python manager.py"'
     'dac="python manager.py createsuperuser --username"'
     'dar="python manager.py runserver"'
     'dap="python manager.py startapp"'
   )

$set_aliases "${ALIASES[@]}"
