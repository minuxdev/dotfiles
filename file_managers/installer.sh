#!/usr/bin/zsh
#
source "$HOME/dotfiles/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/file_managers"
CONFIG_DIR="$HOME/.config"
SCRIPTS="$HOME/.config/scripts"

ranger () {
  start_task 'RANGER'

  dependencies=(trash-cli atool zip bat feh libcaca mediainfo poppler ueberzug jq)

  sudo pacman -S ranger --noconfirm
  sudo pacman -S "${dependencies[@]}" --noconfirm
  cp -rv "$BASE_DIR/ranger" "$CONFIG_DIR" 

  VALUES=('EDITOR=nvim' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done
	sed -i " /-- PROGRAMS EXECUTION --/a\bind = SUPER, e, exec, $TERMINAL -e ranger " "$CONFIG_DIR/hypr/hyprland.conf"
  set_aliases 'cat="bat --theme=\"TwoDark\" --style=\"numbers,changes,header\""'

  source ~/.zshrc

  end_task
}


sudo pacman -Sy nautilus gvfs-smb --noconfirm
ranger 
