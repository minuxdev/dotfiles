#!/bin/bash

installer () 
{
  YAY_DIR="$HOME/.git-clones"
  [ ! -d "$YAY_DIR" ] && mkdir "$YAY_DIR"
  cd "$YAY_DIR" && 
  [ ! -f "/usr/bin/git" ] && sudo pacman -Sy git --noconfirm &&
  git clone https://aur.archlinux.org/yay-git.git &&
  cd "yay-git" &&
  makepkg -si
}

audio ()
{
  sudo pacman -Sy \
    pulseaudio pulseaudio-ctl pulseaudio-alsa \
    pulseaudio-bluetooth pavucontrol playerctl
}

others ()
{
  sudo pacman -Sy ripgrep --noconfirm
}

installer 
audio 
others
