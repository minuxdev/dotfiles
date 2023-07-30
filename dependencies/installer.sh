#!/bin/bash

source  ../progress_notes.sh

installer() {
  start_task 'YAY'

  YAY_DIR="$HOME/.git-clones"
  [ ! -d "$YAY_DIR" ] && mkdir "$YAY_DIR"
  cd "$YAY_DIR" && 
  [ ! -f "/usr/bin/git" ] && sudo pacman -Sy git --noconfirm &&
  git clone https://aur.archlinux.org/yay-git.git &&
  cd "yay-git" &&
  makepkg -si

  end_task
}

audio () {
  start_task 'AUDIO'

  sudo pacman -Sy \
    pulseaudio pulseaudio-ctl pulseaudio-alsa \
    pulseaudio-bluetooth pavucontrol playerctl

  end_task
}

others () {
  start_task 'OTHERS'
  sudo pacman -Sy ripgrep --noconfirm
  end_task
}

installer 
audio 
others
