# ArchLinux Dotfiles

## Installation

- **installer.sh**

  Install the basics you need to have archlinux up and running without any kind of configuration.
  The following packages are installed:

              base-devel linux systemd-sysvcompat iputils git grub efibootmgr ntfs-3g networkmanager

- **configurator.sh**

  This is a configuration part and this is what get configured for you:

  - Region (interactive)
  - Language (en_US.UTF-8)
  - Keyboard layout (en_US.UTF-8)
  - Hostname ('archlinux')
  - Grub
  - Root user password (interactive)

- **set_user.sh**

This scripts creates and adds the user to _wheel_ and _input_ groups,
disable _password_ prompt when running commands with _sudo_.

Also prompt the user to for _dotfiles_ directory.

----

## Dependencies

The following dependencies are installed and configured accordingly

- AUR package manager

  - Yet Another Yogurt (YAY)

- audio
  - pulseaudio
  - pulseaudio-ctl
  - pulseaudio-bluetooth
  - pulseaudio-alsa
  - pavucontrol
  - playerctl

- Programming 
  - Node Version Manger (nvm)
        This is *sourced* in **Terminal_Emulator** section, right after installing **zsh**.

----

## DE/WM setup

For this **Desktop Environment**, the following packages get configured

- hyprland
- waybar
- wofi
- hyprpaper

----

## Terminal emulator

The terminal emulator that gets installed and configured is _alacritty_ 

- install Nerd-Fonts
- alacritty-themes
- zsh
- oh-my-zsh
- fzf
- znap
- tmux 
- set_aliases: a script to quickly set aliases. Located in ~/.local/bin/
- ssh_keys: install my ssh keys (ignored for security reasons.)

----

## Utilities

Some cool utilities:

- Genericas
  - bat : replace cat
  - lsd : replace ls 
  - gdu : replace du
  - z : replace cd
  - unzip
  - man
  - rar 

- Bluetooth
  - bluez
  - bluez-utils

- MTP
  - jmtpfs
  - gvfs-mtp

- Monitoring
  - bpytot : replace top and htop

- Screenshot
  - grim 
  - slurp (dependency)

- Others
  - ripgrep
  - tldr

- File Managers
  - ranger
  - nautilus
