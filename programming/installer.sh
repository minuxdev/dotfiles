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
  
  	sudo pacman -S kate --noconfirm
  	[ $? != 0 ] && sudo pacman -S gedit --noconfirm

	end_task
}

nvim () 
{
  	start_task 'IDE: NVIM'
  
  	sudo pacman -S neovim --noconfirm
  	yay -S wl-clipboard --noconfirm
	    CONFIG_DIR="$HOME/.config/nvim"
    [ ! -d "$CONFIG_DIR" ] && "$CONFIG_DIR" "$CONFIG_DIR.BKP"
  	cp -rv "$BASE_DIR/nvim" "$CONFIG_DIR"
  	$set_aliases 'nv="nvim"'
  
	end_task
}


ALIASES=('da="python manage.py"'
     'pmc="python manage.py createsuperuser --username $1"'
     'pmr="python manage.py runserver"'
     'pms="python manage.py startapp"'
   )

$set_aliases "${ALIASES[@]}"

sudo pacman -Sy python-pipenv
npm_packages
text_editors
nvim
