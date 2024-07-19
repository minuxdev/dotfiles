#!/bin/bash

CONFIG_DIR="$HOME/.config"
BASE_DIR="$HOME/dotfiles/terminal_emulator"
SCRIPTS="$HOME/.config/scripts"
set_aliases="$HOME/dotfiles/scripts/set_aliases.sh"
source "$HOME/dotfiles/progress_notes.sh"

fonts() {
	start_task 'NERD_FONTS'

	FONTS_DIR="$HOME/.fonts/"
	[ ! -d "$FONTS_DIR" ] && mkdir "$FONTS_DIR"
	cp -rv "$BASE_DIR/fonts/" "$FONTS_DIR"
	fc-cache fc-list | awk ' /(Lilex|Space|Roboto)/ '

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
		'marlonrichert/zsh-autocomplete'
		'marlonrichert/zsh-autosuggestions'
		'zsh-users/zsh-syntax-highlighting'
		'Aloxaf/fzf-tab'
	)

	for plugin in "${PLUGINS[@]}"; do
		/usr/bin/zsh -i -c "znap install $plugin"
		sed -i " 3 i\znap source $plugin " ~/.zshrc
	done

	dircolors -p | sed 's/;42/;01/' >~/.dircolors

	/usr/bin/zsh -i -c 'source "$HOME/.zshrc"'

	end_task
}

alacritty() {

	start_task 'ALACRITTY'

	sudo pacman -S alacritty --noconfirm

	cp -rv "$BASE_DIR/alacritty" "$CONFIG_DIR"
	sed -i ' /== EXPORTS ==/a\export TERMINAL=alacritty ' ~/.zshrc
	sed -i \
		-e ' /-- PROGRAMS EXECUTION --/a\bind = SUPER, RETURN, exec, alacritty ' \
		-e ' /EXECUTION ON INIT --/a\exec-once = alacritty ' "$CONFIG_DIR/hypr/hyprland.conf"

	end_task
}

ssh() {
	start_task 'SSH'

	cp -rv "$BASE_DIR/.ssh" ~/
	sudo sed -i '/Port 22/ s/#//' /etc/ssh/ssh_config
	sudo systemctl enable --now sshd

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

	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	grep 'NVM_DIR/nvm.sh' "$HOME/.zshrc"
	[ ! "$?" = 0 ] && echo -e \
		'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || \
  printf %s "${XDG_CONFIG_HOME}/nvm")" \n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >>"$HOME/.zshrc"
	/usr/bin/zsh -i -c "\
  		source $HOME/.zshrc && \
  		nvm install node && \
  		npm install -g npm && \
  		npm install -g semver@7"

	end_task
}

tmux() {
	start_task 'TMUX'

	sudo pacman -S tmux --noconfirm

	[ ! -d "$SCRIPTS" ] && mkdir "$SCRIPTS"
	cp -rv "$BASE_DIR/tmux" "$CONFIG_DIR"
	cp -rv "$BASE_DIR"/tmux/sessions/* "$SCRIPTS"
	grep 'scripts/'$ "$HOME/.zshrc"
	[ "$?" != 0 ] && sed -i " /== EXPORTS/a\export PATH=$SCRIPTS:$PATH " "$HOME/.zshrc"

	$set_aliases 'tm="tmux"'

	end_task
}

wallpaper() {
	start_task 'WALLPAPER'

	yay -S swww --noconfirm
	cp -rv "$BASE_DIR/wallpapers" "$CONFIG_DIR"
	sed -i " /-- PROGRAMS EXECUTION --/a\bind = SUPER, w, exec, $CONFIG_DIR/scripts/wallpaper.sh" ~/.config/hypr/hyprland.conf
	sed -i " / EXECUTION ON INIT --/a\exec = swww init " >>~/.zshrc
	/usr/bin/zsh -i -c "source ~/.zshrc"
	end_task
}

sudo pacman -Sy

cp -rv "$HOME/dotfiles/scripts/" "$SCRIPTS"

fonts
zsh_installer
alacritty
ssh
nvm_installer
tmux
wallpaper
