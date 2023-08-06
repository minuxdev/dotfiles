#!/usr/bin/zsh
#
source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/file_managers"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"

ranger () 
{
  start_task 'RANGER'

  sudo pacman -Sy ueberzug highlight --noconfirm
  yay -S ranger-git bat poppler --noconfirm
  cp -rv "$BASE_DIR/ranger" "$HOME/.config/"

  VALUES=('EDITOR=nvim' 'BAT_STYLE=base16' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done
  source ~/.zshrc
  $set_aliases 'rg="ranger"'
  end_task
}

sudo pacman -S nautilus --noconfirm
ranger 
