#!/usr/bin/zsh
#
source "$HOME/dotfiles/progress_notes.sh"
BASE_DIR="$HOME/dotfiles/file_managers"
CONFIG_DIR="$HOME/.config"

ranger () {
  start_task 'RANGER'

  sudo pacman -S ranger atool highlight ffmpegthumbnailer libcaca mediainfo poppler sudo ueberzug --noconfirm
  yay -S bat poppler --noconfirm
  cp -rv "$BASE_DIR/ranger" "$CONFIG_DIR" 

  VALUES=('EDITOR=nvim' 'SHELL=/usr/bin/zsh')
  for exported in "${VALUES[@]}"
  do 
    sed -i " /EXPORTS/a\export $exported " ~/.zshrc
  done
  source ~/.zshrc

  end_task
}


sudo pacman -S nautilus gvfs-smb --noconfirm
ranger 
