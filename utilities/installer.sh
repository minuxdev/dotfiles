#!/bin/bash

BASE_DIR="$HOME/dotfiles"

source "$HOME/terminal_emulator/scripts/set_aliases.sh"


GENERICS=(
  'bat' 'tldr' 'grim' 'rar' 'unzip' 'grim'
  'man'
)

FROM_AUR=( )


generics() {
  sudo pacman -Sy "${UTILITIES[*]}" --noconfirm
  
  ALIASES=(
     'ls="lsd"'
     'la="lsd -a"'
     'll="lsd -la"'
     'cd="z"'
     'src="source ~/.zshrc"'
     'da="python manager.py"'
  )
  set_aliases "${ALIASES[@]}"
}

bluetooth () 
{
  sudo pacman -S 'bluez' 'bluez-utils' --noconfirm 
 sudo awk -i inplace ' 
  /PairableTimeout/ { print "PairableTimeout = 0" };
  /ControllerMode/ { print "ControllerMode = bredr" };
  /^(A|#A)utoEnable/ { print "AutoEnable = true" };
  /DiscoverableTimeout/ {print "DiscoverableTimeout = 0" }; 1
  ' /etc/bluetooth/main.conf

  systemctl enable --now bluetooth.service
}

monitoring() {
  pip3 install bpytop &&
  sed -i ' /EXPORTS/a\export PATH=$PATH:$HOME/.local/bin ' ~/.zshrc
  set_aliases 'top="bpytop"'
}

screenshot() {

}
