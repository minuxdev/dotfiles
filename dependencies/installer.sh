#!/bin/bash

installer() {
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

nvm () {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash 
  touch "$HOME/.zshrc"
  echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" ' > "$HOME/.zshrc"
}

others ()
{
  sudo pacman -Sy ripgrep --noconfirm
}

installer 
audio 
others
nvm
