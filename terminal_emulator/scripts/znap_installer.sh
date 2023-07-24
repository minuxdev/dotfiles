#!/bin/zsh

znap_installer ()
{
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  source ~/.zshrc


  [ ! -d ~/.git-clones ] && mkdir ~/.git-clones 
  mkdir -p ~/.git-clones/zsh-plugins 
  cd ~/.git-clones/zsh-plugins 
  git clone https://github.com/marlonrichert/zsh-snap.git 

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/git-clones/fzf
  ~/.git-clones/fzf/install

  awk -i inplace \
    ' BEGINFILE { 
      print "#======================== ZNAP ======================="
      print "source ~/.git-clones/zsh-plugins/zsh-snap/znap.zsh\n"
      print "\n#===================== ALIASES ========================\n\n"
      }; { print } ' \
    ~/.zshrc
  source ~/.zshrc

    PLUGINS=(
      'rupa/z' 
      'Aloxaf/fzf-tab' 
      'z-shell/zsh-lsd'
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

  ALIASES=(
     'ls="lsd"'
     'la="lsd -a"'
     'll="lsd -la"'
     'cd="z"'
     'src="source ~/.zshrc"'
     'da="python manager.py"'
  )
  
  set_aliases "${ALIASES[@]}"

}

znap_installer
