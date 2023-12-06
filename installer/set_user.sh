#!/bin/bash

create_user() {
    while read -p "Username: " USERNAME
    do
        cat /etc/passwd | grep -w "$USERNAME"
        [ $? != 0 ] || continue
        useradd -m -g wheel "$USERNAME"
        usermod -a -G input "$USERNAME"
        awk -i inplace ' /^# %wheel/ && /NOPASSWD/ { $1 = substr($1, 2) }; 1 ' \
        /etc/sudoers 
        passwd "$USERNAME"
        break;
    done
    
    read -p "Dotfiles complete path: " DOTFILES

    chown -R $USERNAME:wheel $DOTFILES
    
    cp -rv "$DOTFILES" "/home/$USERNAME/"

    systemctl enable --now systemd-timesyncd

    USERNAME="${USERNAME^^}"

    printf "User $USERNAME was created successfully!\n" 
    printf "Login as $USERNAME to proceed."

}

create_user
