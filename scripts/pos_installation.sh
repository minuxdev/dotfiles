#!/bin/bash
#
sudo systemctl enable NetworkManager --now

function print_section() {
    printf "

+++++++++++++++++++++++++++++++++++++++++++++
+++++ $1
+++++++++++++++++++++++++++++++++++++++++++++

"
}


function print_end_section() {
    printf "

    $1

"
}


#   INSTALLING YAY-GIT
function yay_installation() {
    print_section 'YAY-GIT'

  YAY_DIR="$HOME/.pkgs"
    cd $HOME
    [ ! -d "$YAY_DIR" ] && mkdir "$YAY_DIR"

    cd "$YAY_DIR"
    [ ! -f "/usr/bin/git" ] && sudo pacman -Sy git --noconfirm

    git clone https://aur.archlinux.org/yay-git.git
    cd "yay-git"
    makepkg -si

    print_end_section "YAY INSTALLED SUCCESSFULLY!";
    
}


function terminal_emulator() {
    print_section 'TERMINAL EMULATOR'

    FONTS_DIR="$HOME/.fonts/"

    PKGS="zsh alacritty ranger dialog"

    for PKG in "$PKGS"
    do
        sudo pacman -S "$PKG" --noconfirm
    done

    # installing oh-my-zsh
    [ ! -d "$HOME/.oh-my-zsh" ] && rm -rv "$HOME/.oh-my-zsh";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # installing p10k themes + nerd fonts
    [ ! -d "$FONTS_DIR" ] && mkdir "$FONTS_DIR" || printf "Directory found! Installing fonts.\n\n";
    cp -rvv "$HOME/dotfiles/fonts/SpaceMono" "$FONTS_DIR"
    fc-cache
    fc-list | awk ' /Space/ '
    sleep 2s
    clear

    yay -S --noconfirm zsh-theme-powerlevel10k-git
    echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    
    # adding zshell plugings
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
    source zsh-snap/install.zsh
    znap source marlonrichert/zsh-autocomplete
    znap source zsh-users/zsh-syntax-highlighting

    # NEOVIM

    print_section 'NEOVIM 0.8'
    PKGS="neovim cargo make npm python-pip"
    for PKG in $PKGS
        do
            [ "$PKG" = "npm" ] && ( sudo pacman -S "$PKG" --overwrite="*" --noconfirm ) || ( sudo pacman -S "$PKG" --noconfirm )
        done
	
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.zshrc
    nvm install node
    source ~/.zshrc
	
	npm install -g yarn
    source ~/.zshrc
   
# installing vim-plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	
    [ -f "~/.config/alacritty" ] && ( rm ~/.config/alacritty )  
    cp -rv $HOME/dotfiles/term_emulator/* "$HOME/.config/" 
	
    print_end_section 'HYPRLAND + NEOVIM INSTALLED SUCCESSFULLY'
}


function install_hyprland() {
    print_section 'HYPRLAND + WAYBAR'

    # installing xorg-xwaylnad
    sudo pacman -S xorg-xwayland --noconfirm
    
  # install and config DE
    sudo pacman -S playerctl --noconfirm 
    
    for pkg in " hyprland-git waybar-hyprland-git hyprpaper-git wofi"
    do
        yay -S $pkg --noconfirm 
    done

    cp -rv "$HOME/dotfiles/DE/hyprland/hypr/" "$HOME/.config/"
    cp -rv "$HOME/dotfiles/DE//waybar" "$HOME/.config/"
    
    print_end_section 'HYPRLAND INSTALLED SUCCESSFULLY' 

}


function install_sddm() {
    print_section 'SDDM'

    SDDM="$HOME/dotfiles/DM/sddm/sddm.conf"
    SDDM_THEMES_SRC=$HOME/dotfiles/DM/sddm/sddm-themes/*
    SDDM_THEMES_DST="/usr/share/sddm/themes/"

    yay -S sddm-git --noconfirm
   sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg --noconfirm 
    
    sudo cp -rv "$SDDM" "/etc/"
    sudo cp -rv "$SDDM_THEMES_SRC" "$SDDM_THEMES_DST"

#    awk -i inplace -v cu="$(whoami)" ' /User=/ { sub(/User=/, "&"cu) }; 1 ' "$SDDM"
    [ -f "/etc/sddm.conf" ] && \
      (sudo awk -i inplace -v cu="sddm-flower-theme" ' /Current=/ { sub($1, "&"cu) }; 1 ' /etc/sddm.conf ) || \
      ( printf "\n/etc/sddm.conf COULD NOT BE FOUND!!\n\n" )
    
    sudo systemctl enable sddm 

    print_end_section 'SDDM INSTALLED SUCCESSFULLY' 
}


function players() {
    
    print_section 'INSTALLING MEDIA PLAYERS'

    PKGS="pulseaudio pulseaudio-alsa pavucontrol cmus mpv"

  for PKG in $PKGS
  do
    sudo pacman -S "$PKG" --noconfirm 
  done

  print_end_section 'CMUS + MPV INSTALLED SUCCESSFULLY'

}


function utilities() {
    print_section 'UTILITIES'

    PKGS="thunar  firefox unzip jmtpfs gedit"

    for pkg in $PKGS
    do
      sudo pacman -S "$pkg"  --noconfirm
    done
    yay -Sy gvfs-mtp --noconfirm

    print_end_section 'UTILITIES INSTALLED SUCCESSFULLY'
}


yay_installation
terminal_emulator
install_hyprland
install_sddm
players
utilities
