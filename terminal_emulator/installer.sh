#!/bin/bash

CONFIG_DIR="$HOME/.config"
BASE_DIR="$HOME/dotfiles/terminal_emulator"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

fonts() {
	start_task 'NERD_FONTS'

	FONTS_DIR="$HOME/.fonts/"
	[ ! -d "$FONTS_DIR" ] && mkdir "$FONTS_DIR"
	cp -rv "$BASE_DIR/fonts/" "$FONTS_DIR"
	fc-cache fc-list | awk ' /(Space|Roboto)/ '

	end_task
}

zsh_installer() {
	start_task 'ZSH_INSTALLER'

	sudo pacman -S zsh --noconfirm &&
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	[ ! -d ~/.git-clones ] && mkdir ~/.git-clones
	mkdir -p ~/.git-clones/zsh-plugins
	cd ~/.git-clones/zsh-plugins || return
	git clone https://github.com/marlonrichert/zsh-snap.git
	cd ~/.git-clones/ &&
		printf "Cleaning zshrc file...\n"
	sed -i -e ' /^#/d ' -e ' /^$/d ' ~/.zshrc

	awk -i inplace \
		' BEGINFILE { 
	  print "#======================== ZNAP ======================="
	  print "source ~/.git-clones/zsh-plugins/zsh-snap/znap.zsh\n"
	  print "\n#===================== ALIASES ========================\n\n"
	  print "\n#===================== EXPORTS ========================\n\n\n"
	  }; { print } ' \
		~/.zshrc
	/usr/bin/zsh -i -c 'source "$HOME/.zshrc"'

	fuzzy_finder # Function

	PLUGINS=(
		'rupa/z'
		'Aloxaf/fzf-tab'
		'marlonrichert/zsh-autocomplete'
		'marlonrichert/zsh-autosuggestions'
		'zsh-users/zsh-syntax-highlighting'
	)

	for plugin in "${PLUGINS[@]}"; do
		/usr/bin/zsh -i -c "znap install $plugin"
		sed -i " 3 i\znap source $plugin " ~/.zshrc
	done

	dircolors -p | sed 's/;42/;01/' >~/.dircolors

	/usr/bin/zsh -i -c 'source "$HOME/.zshrc"'

	end_task
}

fuzzy_finder() {
	start_task 'FUZZY_FINDER'

	sudo pacman -S fd --noconfirm

	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	grep 'FZF_DEFAULT_COMMAND' "$HOME/.zshrc"
	if [ "$?" != 0 ]; then
		sed -i -e ' /== EXPORTS/a\export FZF_DEFAULT_OPTS="--extended" ' \
			-e ' /== EXPORTS/a\export FZF_DEFAULT_COMMAND="fd --type f" ' \
			-e ' /== EXPORTS/a\export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" ' "$HOME/.zshrc"
	fi
	end_task
}

nvm_installer() {
	start_task 'NVM_INSTALLER'

	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
	grep 'NVM_DIR/nvm.sh' "$HOME/.zshrc"
	[ ! "$?" = 0 ] && echo -e \
		' export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || \
  printf %s "${XDG_CONFIG_HOME}/nvm")" \n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >>"$HOME/.zshrc"
	/usr/bin/zsh -i -c "\
  		source $HOME/.zshrc && \
  		nvm install node && \
  		npm install -g npm && \
  		npm install -g semver@7"

	end_task
}

alacritty() {
	start_task 'ALACRITTY'

	sudo pacman -S alacritty --noconfirm
	yay -S alacritty-themes --noconfirm
	cp -r "$BASE_DIR/alacritty" "$CONFIG_DIR"

	$set_aliases 'at="alacritty-themes"'

	end_task
}

tmux() {
	start_task 'TMUX'

	sudo pacman -S tmux --noconfirm

	BINARIES="$HOME/.bin"
	[ ! -d "$BINARIES" ] && mkdir "$BINARIES"
	cp -rv "$BASE_DIR/tmux" "$CONFIG_DIR"
	cp -rv "$BASE_DIR/tmux/sessions/*" "$BINARIES"
	grep '.bin' "$HOME/.zshrc"
	[ "$?" != 0 ] && sed -i " /== EXPORTS/a\export PATH=$BINARIES:$PATH " "$HOME/.zshrc"

	$set_aliases 'tm="tmux"'

	end_task
}

sudo pacman -Sy

fonts
zsh_installer
nvm_installer
alacritty
tmux
