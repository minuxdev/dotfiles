#!/bin/bash
CONFIG_DIR="~/.config"
BASE_DIR="~/dotfiles/terminal_emulator"

source "$BASE_DIR/scripts/set_alias.sh"

fonts ()
{
    FONTS_DIR="~/.fonts/"
    [ ! -d "$FONTS_DIR" ] && mkdir "$FONTS_DIR" 
    cp -rv "$BASE_DIR/fonts/" "$FONTS_DIR"
    fc-cache fc-list | awk ' /(Space|Roboto)/ '
    sleep 2s
    clear
}

znap ()
{
  sudo pacman -S zsh
  printf """

#=================== ALIASES ====================
""" > ~/.zshrc
  
  [ ! -d ~/.git-clones ] && (mkdir ~/.git-clones && cd ~/.git-clones)
  mkdir ~/.zsh-plugins
  cd ~/.zsh-plugins
  git clone https://github.com/marlonrichert/zsh-snap.git 
  awk -i inplace \
    ' BEGINFILE { print "source ~/.zsh-plugins/zsh-snap/znap.zsh" }; { print } ' \
    ~/.zshrc
  source ~/.zshrc

  znap clone \
    https://github.com/ohmyzsh/ohmyzsh.git \
    https://github.com/marlonrichert/zsh-autocomplete.git \
    https://github.com/marlonrichert/zsh-autosuggestions.git \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    https://github.com/Aloxaf/fzf-tab.git \
    https://github.com/rupa/z.git \

  PLUGINS="zsh-autocomplete zsh-autosuggestions zsh-autosuggestions zsh-colored-man-pages z fzf-tab"
  for plugin in "$PLUGINS"
  do 
    sed -i  "s/znap/ a znap source $plugin"   ~/.zshrc
  done
  sed -i  "s/znap/ a znap source oh-my-zsh lib\/completion"   ~/.zshrc
  source ~/.zshrc

  set_aliases ls="exa"
  set_aliases at="alacritty-themes"
  set_aliases src="source ~/.zshrc"
  set_aliases da="python manager.py"

}

alacritty ()
{
  sudo pacman -S alacritty --noconfirm
  yay -S alacritty-themes --noconfirm
  cp -r "$BASE_DIR/alacritty/" "$CONFIG_DIR"
}

