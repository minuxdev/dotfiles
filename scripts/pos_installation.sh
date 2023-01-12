#!/bin/bash
#
sudo systemctl enable NetworkManager --now

#   INSTALLING YAY-GIT
function yay_installation() {

  printf "

    INSTALLING YAY-GIT 

    "

  YAY_DIR="$HOME/.pkgs"
    cd $HOME
    [ ! -d "$YAY_DIR" ] && mkdir "$YAY_DIR"

    cd "$YAY_DIR"
    [ ! -f "/usr/bin/git" ] && sudo pacman -Sy git --noconfirm

    git clone https://aur.archlinux.org/yay-git.git
    cd "yay-git"
    makepkg -si
    printf "\nYAY INSTALLED SUCCESSFULLY!\n";
    
}


function terminal_emulator() {

  printf "

    INSTALLING TERMINAL_EMULATOR + LVIM

    "

    FONTS_DIR="$HOME/.fonts/"
    sudo pacman -Sy zsh alacritty ranger dialog --noconfirm

    cp -rv "$HOME/dotfiles/term_emulator/alacritty/" "$HOME/.config/"
    
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

    # lvim dependencies
    PKGS="neovim cargo make npm"
    
    for PKG in $PKGS
    do
	    [ "$PKG" = "npm" ] && ( sudo pacman -S "$PKG" --overwrite="*" --noconfirm ) || ( sudo pacman -S "$PKG" --noconfirm )
    done
	
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.zshrc
    nvm install node
   
   # installing lunarvim
    LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    if [ -f "$HOME/.local/bin/lvim" ]
    then
        awk -i inplace 'NR==1 { print "\n\nexport PATH=$HOME/.local/bin:$PATH\n\nalias vim=lvim" }; 1' ~/.zshrc
	      source ~/.zshrc
        echo -e "\n\nLunarVim installed successfully. Open it to complete the process...\n"
    else
        echo "Lvim not found!!!" 
    fi
}


function install_hyprland() {
    printf "
          
        HYPRLAND INSTALLATION 

    "

    # installing xorg-xwaylnad
    HYPR_DIR="$HOME/.config/hypr/"
    sudo pacman -S xorg-xwayland --noconfirm
    
  # install and config DE
    sudo pacman -S playerctl --noconfirm 
    yay -S hyprland-git waybar-hyprland-git hyprpaper-git wofi --noconfirm
    [ ! -d "$HYPR_DIR" ] && mkdir "$HYPR_DIR"
    cp -rv "$HOME/dotfiles/DE/hyprland/hypr/" "$HYPR_DIR"
    cp -rv "$HOME/dotfiles/DE/hyprland/waybar" "$HOME/.config/"
    echo -e "\nHyprland installed successfully!!"
}

function install_sddm() {
  printf "
      INSTALLING SDDM + FLOWER-THEME

  "
    SDDM="$HOME/dotfiles/DM/sddm/sddm.conf"
    SDDM_THEMES_SRC="$HOME/dotfiles/DM/sddm/sddm-themes/*"
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

    printf "
    
    All set to run sddm.

    "
}

function players() {
  printf "

      INSTALLING MEDIA CONTROLLERS

  "
  PKGS="pulseaudio pulseaudio-alsa pavucontrol cmus mpv"

  for PKG in $PKGS
  do
    sudo pacman -S "$PKG" --noconfirm 
  done
}

function utilities() {
  printf "

      INSTALLING UTILITIES

  "

    PKGS="dolphin kate firefox unzip jmtpfs"

    for pkg in $PKGS
    do
      sudo pacman -S "$pkg"  --noconfirm
    done
    yay -Sy gvfs-mtp --noconfirm
}


#yay_installation
terminal_emulator
#install_hyprland
install_sddm
#players
#utilities
