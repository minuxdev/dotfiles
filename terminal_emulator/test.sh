#!/bin/sh

sudo pacman -S zsh --noconfirm
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  source ~/.zshrc
printf "\n\nInstalling znap...\n\n"
zsh ./znap_installer.sh

