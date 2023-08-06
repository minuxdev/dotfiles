#!/usr/bin/zsh

source "$HOME/dotfiles/progress_notes.sh"

znap_installer () 
{
	start_task 'ZNAP_INSTALLER'
	printf "INSTALLING ZNAP..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	printf "INSTALLING ZNAP..."
	[ ! -d ~/.git-clones ] && mkdir ~/.git-clones 
	mkdir -p ~/.git-clones/zsh-plugins 
	cd ~/.git-clones/zsh-plugins 
	git clone https://github.com/marlonrichert/zsh-snap.git

  	printf "Cleaning zshrc file..."
	sed -i ' /^#/d ' ~/.zshrc
	sed -i ' /^$/d ' ~/.zshrc
	
	awk -i inplace \
	' BEGINFILE { 
	  print "#======================== ZNAP ======================="
	  print "source ~/.git-clones/zsh-plugins/zsh-snap/znap.zsh\n"
	  print "\n#===================== ALIASES ========================\n\n"
	  print "\n#===================== EXPORTS ========================\n\n\n"
	  }; { print } ' \
	~/.zshrc
	source ~/.zshrc
	
	fuzzy_finder

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

fuzzy_finder () 
{
	start_task 'FUZZY_FINDER'
	
	sudo pacman -S fd
	
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	sed -i ' /EXPORTS/a\export FZF_DEFAULT_OPTS="--extended" ' "$HOME/.zshrc"
	sed -i ' /EXPORTS/a\export FZF_DEFAULT_COMMAND="fd --type f" ' "$HOME/.zshrc"
	sed -i ' /EXPORTS/a\export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" ' "$HOME/.zshrc"
	
	end_task
}

nvm_installer () 
{
  start_task 'NVM_INSTALLER'
  
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
  sed -i ' /EXPORTS/a\export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' "$HOME/.zshrc"
  source "$HOME/.zshrc" &&
  sudo nvm install node 
  
  end_start
}

#znap_installer
nvm_installer

