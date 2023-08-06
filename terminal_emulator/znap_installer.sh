#!/bin/zsh

source "$HOME/dotfiles/progress_notes.sh"

nvm_installer () 
{
  start_task 'NVM_INSTALLER'
  
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
  echo -e '\n\nexport NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.zshrc"
  source "$HOME/.zshrc" &&
  sudo nvm install node 
  
  end_start
}

fuzzy_finder () {
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	echo 'export FZF_DEFAULT_OPTS="--extended"' >> .zshrc

	sudo pacman -S fd
	echo 'export FZF_DEFAULT_COMMAND="fd --type f"' >> .zsrhc
	echo 'export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"' >> .zshrc
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
	  print "\n#===================== EXPORTS ========================\n\n"
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
fuzzy_finder
znap_installer

