#!/bin/zsh

znap_installer ()
{
  [ ! -d ~/.git-clones ] && mkdir ~/.git-clones 

  mkdir -p ~/.git-clones/zsh-plugins 
  cd ~/.git-clones/zsh-plugins 
  git clone https://github.com/marlonrichert/zsh-snap.git 

  awk -i inplace \
    ' BEGINFILE { 
      print "#======================== ZNAP ======================="
      print "source ~/.git-clones/zsh-plugins/zsh-snap/znap.zsh\n"
      print "\n#===================== ALIASES ========================\n\n"
      }; { print } ' \
    ~/.zshrc
  source ~/.zshrc


    printf "
  Done clonning 
  """
    PLUGINS=(
      'rupa/z' 
      'Aloxaf/fzf-tab' 
      'marlonrichert/zsh-autocomplete' 
      'marlonrichert/zsh-autosuggestions'
      'zsh-users/zsh-syntax-highlighting'
    )


  for plugin in "${PLUGINS[@]}"
  do 
    znap install "$plugin"
    sed -i " 3 i\znap source $plugin " ~/.zshrc
  done
  source ~/.zshrc
}

znap_installer
