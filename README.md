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

---

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

---

## DE/WM setup

For this **Desktop Environment**, the following packages get configured

- hyprland
- waybar
- wofi
- hyprpaper

---

## Networking

- systemd-networkd
- gvfs-smb

---

## Terminal emulator

The terminal emulator that gets installed and configured is _alacritty_

- install Nerd-Fonts
- alacritty-themes
- zsh
- Node Version Manger (nvm)
- Node (needed by other packages)
- oh-my-zsh
- fzf
- znap
- tmux
- set_aliases: a script to quickly set aliases. Located in ~/.local/bin/
- ssh_keys: install my ssh keys (ignored for security reasons.)

---

## Utilities

Some cool utilities:

- Genericas

  - bat : replace cat
  - lsd : replace ls
  - gdu : replace du
  - z : replace cd
  - unzip
  - man
  - als

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

- Players
  - vlc
  - mpv
  - audacious
  - cmus

## Programming

- Node Packages

  - sass
  - live-server

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
      - neovim/nvim-lspconfig, _run = ' pip3 install neovim '_
    - Formatters
      - jose-elias-alvarez/null-ls.nvim, _run = ' npm install prettier ; pip3 install black'_
      - nvie/vim-flake8, _run = 'pip3 install flake8'_
      - lukas-reineke/lsp-format.nvim
      - FooSoft/vim-argwrap
      - scrooloose/nerdcommenter
    - Autocompletion
      - hrsh7th/cmp-nvim-lsp
      - hrsh7th/nvim-cmp
      - L3MON4D3/LuaSnip
      - saadparwaiz1/cmp_luasnip
      - rafamadriz/friendly-snippets
    - HTML and SCSS support
      - cakebaker/scss-syntax.vim, _run = ' npm install -g vscode-langservers-extracted '_
      - hail2u/vim-css3-syntax
      - pangloss/vim-javascript
      - othree/html5.vim
    - Tabline
      - romgrk/barbar.nvim
      - lewis6991/gitsigns.nvim
