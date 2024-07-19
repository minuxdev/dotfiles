#!/usr/bin/zsh

BASE_DIR="$HOME/dotfiles/programming"
set_aliases="$HOME/dotfiles/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

npm_packages () 
{ 
  start_task 'NPM PACKAGES'

  sudo npm install -g live-server 
  sudo npm install -g sass 
  sudo npm install -g vercel@latest

  $set_aliases 'lvs="live-server" "$1"'

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

  packages='python-pytest python-neovim htmlhint ctags'

  sudo pacman -S neovim
  sudo pacman -S $packages --noconfirm
  yay -S wl-clipboard flake8 --noconfirm

  CONFIG_DIR="$HOME/.config/nvim"
  [ -d "$CONFIG_DIR" ] && mv "$CONFIG_DIR" "$CONFIG_DIR.BKP"
  cp -rv "$BASE_DIR/nvim" "$CONFIG_DIR"
  $set_aliases 'nv="nvim"'
  
	end_task
}

_postgresql () {
  start_task "POSTGRES"

  sudo pacman -S postgresql --noconfirm 
  clear 
  printf "
  In order to start using postgres you need to initialize PostgreSQL data directory.
  Paste the following command in postgres shell and exit when the process gets done.

  initdb --locale en_US.UTF-8 -D /var/lib/postgres/data

  "
  sudo su - postgres
  systemctl enable --now postgres

	end_task
}


virtualenvs() {
  start_task "VIRTUALENVS"
  
  sudo pacman -S python-virtualenv python-virtualenvwrapper --noconfirm
  sed -i "/ EXPORTS /a\export WORKON_HOME=\"$HOME/.virtualenvs\"" ~/.zshrc
  echo -e "\nsource /usr/bin/virtualenvwrapper_lazy.sh" >> ~/.zshrc

	end_task
}

sudo pacman -Sy python-pipenv
npm_packages
text_editors
nvim
_postgresql
virtualenvs

ALIASES=(
  'da="python manage.py"'
  'dac="python manage.py createsuperuser "'
  'dar="python manage.py runserver"'
  'das="python manage.py startapp"'
  'dat="python manage.py test"'
  'gs="git status"'
  'gl="git log --oneline"'
  'ga="git add"'
  'gc="git commit -m"'
  'gub="git checkout %s -- %s" "$1" "$2"'
)

$set_aliases "${ALIASES[@]}"

source ~/.zshrc

