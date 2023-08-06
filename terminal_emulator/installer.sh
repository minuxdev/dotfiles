#!/bin/bash
CONFIG_DIR="$HOME/.config"
BASE_DIR="$HOME/dotfiles/terminal_emulator"
set_aliases="$HOME/dotfiles/terminal_emulator/scripts/set_aliases.sh"

fonts () 
{
	FONTS_DIR="$HOME.fonts/"
	[ ! -d "$FONTS_DIR" ] && mkdir "$FONTS_DIR" 
	cp -rv "$BASE_DIR/fonts/" "$FONTS_DIR"
	fc-cache fc-list | awk ' /(Space|Roboto)/ '
	clear
}

call_znap_installer () 
{
	sudo pacman -S zsh --noconfirm &&
	/usr/bin/zsh "$BASE_DIR/scripts/znap_installer.sh"
}

alacritty () 
{
	sudo pacman -S alacritty --noconfirm
	yay -S alacritty-themes --noconfirm
	cp -r "$BASE_DIR/alacritty/" "$CONFIG_DIR"

	$set_aliases 'at="alacritty-themes"'
}

tmux () 
{
	sudo pacman -S tmux --noconfirm &&
	cp -rv "$BASE_DIR/tmux" "$CONFIG_DIR"
	cp -rv "$BASE_DIR/tmux/sessions/" "$HOME/.local/bin/"
	$set_aliases 'tm="tmux"'
}

fonts
call_znap_installer
alacritty
tmux
