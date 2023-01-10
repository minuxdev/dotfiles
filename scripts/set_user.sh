#!/bin/bash

function create_user() {
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

    printf "User %s was created successfully!" "$USERNAME"
}

create_user
