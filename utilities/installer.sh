#!/bin/bash

BASE_DIR="$HOME/dotfiles/utilities"

source "$HOME/terminal_emulator/scripts/set_aliases.sh"


FROM_AUR=( )


generics() {
  GENERICS=(
    bat lsd tldr grim unzip man
  )
  sudo pacman -Sy "${GENERICS[*]}" --noconfirm
  yay -S rar --noconfirm
  
  ALIASES=(
     'ls="lsd"'
     'la="lsd -a"'
     'll="lsd -la"'
     'cd="z"'
     'sf="source ~/.zshrc"'
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
 a/DiscoverableTimeout/ {print "DiscoverableTimeout = 0" }; 1
  ' /etc/bluetooth/main.conf

  systemctl enable --now bluetooth.service
}

mtp () {
  sudo pacman -S jmtpfs
  yay -Sy gvfs-mtp
}

monitoring() {
  pip3 install bpytop &&
  sed -i ' /EXPORTS/a\export PATH=$PATH:$HOME/.local/bin ' ~/.zshrc
  set_aliases 'top="bpytop"'
}

screenshot() {
  sudo pacman -S grim slurp &&
  cp -rv "$BASE_DIR/print_screen.sh" "$HOME/.local/bin/" 
  set_aliases 'shot="print_screen"'
  sed -i " /PROGRAMS CONTROL/a\bind = , print, exec, $HOME/.local/bin/print_screen.sh" 
}



generics 
bluetooth
mtp
monitoring
screenshot
