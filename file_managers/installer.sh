#!/usr/bin/zsh
#
source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/file_managers"

ranger () {
  start_task 'RANGER'

  sudo pacman -S ranger ueberzug highlight --noconfirm
  yay -S bat poppler --noconfirm
  cp -rv "$BASE_DIR/ranger" "$HOME/.config/"

  VALUES=('EDITOR=nvim' 'BAT_STYLE=base16' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done
  source ~/.zshrc

  end_task
}


pacman -S nautilus --noconfirm
ranger 
