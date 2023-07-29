#!/usr/bin/zsh
#
BASE_DIR="$HOME/dotfiles/file_managers"

ranger () {
  sudo pacman -S ranger ueberzug highlight --noconfirm
  yay -S bat poppler --noconfirm
  cp -rv "$BASE_DIR/ranger" "$HOME/.config/"

  VALUES=('EDITOR=nvim' 'BAT_STYLE=base16' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done
  source ~/.zshrc
}

pacman -S nautilus --noconfirm
ranger 
