# ArchLinux Dotfiles

## Installation

- **installer.sh**

  Install the basics you need to have archlinux up and running without any kind of configuration.
  The following packages are installed:

- base-devel 
- linux 
- systemd-sysvcompat 
- iputils 
- git 
- grub 
- efibootmgr 
- ntfs-3g 
- networkmanager

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

## Network

Enable and config *NetworkManger*.

Install **samba** and copy *smb.conf* to */etc/samba/* with minimal to make it working.
Add the current user group (**@wheel** is the default one, defined by **set_user.sh**) to samba, enable and start the service.

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
- Node Version Manger (nvm)
- Node (needed by other packages)
- oh-my-zsh
- fzf
- fd
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
  - ristretto (image viewer)
  - tree

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

- Browsers
  - firefox
  - chromium

- Others
  - ripgrep
  - tldr
  - qbittorrent

- File Managers
  - ranger
  	- Plugins
  		- ranger-cmus
  - nautilus

- Players
	- cmus
	- vlc
	- mpv

## Programming

- Node Packages
  - scss
  - live-server

- Text editors
	- kate 
	- gedit 

- Neovim Packages
  - Packer
  - Plugins
    - Initial plugins
        - nvim-tree.lua
        - nvim-web-devicons
        - nvim-treesitter/nvim-treesitter
    - Line
        - lualine.nvim
    - Colorscheme
        - RRethy/nvim-base16
    - Telescope
        - nvim-telescope/telescope.nvim
        - nvim-lua/plenary.nvim
    - Language Server Protocol
        - williamboman/mason.nvim
        - williamboman/mason-lspconfig.nvim
        - neovim/nvim-lspconfig, *run = ' pip3 install neovim '*
    - Formatters
        - jose-elias-alvarez/null-ls.nvim, *run = ' npm install prettier ; pip3 install black'*
        - nvie/vim-flake8, *run = 'pip3 install flake8'*
        - lukas-reineke/lsp-format.nvim
        - FooSoft/vim-argwrap
        - scrooloose/nerdcommenter
    - Autocompletion
        - hrsh7th/cmp-nvim-lsp
        - hrsh7th/nvim-cmp
        - L3MON4D3/LuaSnip
        - saadparwaiz1/cmp_luasnip
        - rafamadriz/friendly-snippets
        - mg979/vim-visual-multi
    - HTML and SCSS support
        - cakebaker/scss-syntax.vim, *run = ' npm install -g vscode-langservers-extracted '*
        - hail2u/vim-css3-syntax
        - pangloss/vim-javascript
        - othree/html5.vim
    - Tabline
        - romgrk/barbar.nvim
        - lewis6991/gitsigns.nvim
