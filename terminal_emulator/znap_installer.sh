#!/bin/zsh

source "$HOME/dotfiles/progress_notes.sh"

nvm_installer () {
  start_task 'NVM_INSTALLER'
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash 
  source "$HOME/.zshrc" &&
  sudo nvm install node 
  end_start
}

znap_installer ()
{
  start_task 'ZNAP_INSTALLER'

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

  end_task
}

nvm_installer
znap_installer
