#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

npm_packages () 
{ 
  	start_task 'NPM PACKAGES'

  	sudo npm install -g live-server 
  	sudo npm install -g sass prettier

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
  
    packages='python-pytest python-neovim python-black python-isort shfmt shellcheck stylua luacheck htmlhint stylelint eslint ctags'

  	sudo pacman -S neovim
    sudo pacman -S $packages --noconfirm
  	yay -S wl-clipboard flake8 --noconfirm

	    CONFIG_DIR="$HOME/.config/nvim"
    [ ! -d "$CONFIG_DIR" ] && "$CONFIG_DIR" "$CONFIG_DIR.BKP"
  	cp -rv "$BASE_DIR/nvim" "$CONFIG_DIR"
  	$set_aliases 'nv="nvim"'
  
	end_task
}

_docker () {
  	start_task 'DOCKER AND DOCKER DESKTOP'
    
    # Install docker 
    #sudo pacman -S docker --noconfirm && sudo usermod -aG docker $USER 

sudo curl -L \
  "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose

    ln -s /usr/lib/libcrypt.so /usr/lib/libcrypt.so.1

    printf "Docker Version: `docker -v`\ndocker-compose version: `docker-compose --version`"
    printf '%c' "Docker and docker-compose installed successfully. You need to reboot the system."
    $set_aliases 'doc="docker-compose"'

	end_task
}

sudo pacman -Sy python-pipenv
npm_packages
text_editors
nvim
_docker

ALIASES=('da="python manage.py"'
     'dac="python manage.py createsuperuser "'
     'dar="python manage.py runserver"'
     'das="python manage.py startapp"'
     'dat="python manage.py test"'
     'gs="git status"'
     'gl="git log --oneline"'
     'ga="git add"'
     'gc="git commit -m"'
     'gub="git checkout $1 -- $2"'
   )

$set_aliases "${ALIASES[@]}"

source ~/.zshrc

