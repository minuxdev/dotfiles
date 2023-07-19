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

## DE/WM setup

For this **Desktop Environment**, the following packages get configured

- hyprland
- waybar
- wofi
- hyprpaper
