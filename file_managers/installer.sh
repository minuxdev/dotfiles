#!/usr/bin/zsh
#
source "$HOME/dotfiles/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/file_managers"
CONFIG_DIR="$HOME/.config"

ranger () {
  start_task 'RANGER'

  dependencies=(atool zip ffmpeg libcaca mediainfo poppler sudo ueberzug jq)

  sudo pacman -S ranger --noconfirm
  sudo pacman -S $dependencies[*] --noconfirm
  cp -rv "$BASE_DIR/ranger" "$CONFIG_DIR" 

  VALUES=('EDITOR=nvim' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done

		set_aliases 'cat="bat --theme=\"TwoDark\" --style=\"numbers,changes,header\""'

  source ~/.zshrc

  end_task
}


sudo pacman -Sy nautilus gvfs-smb --noconfirm
ranger 
