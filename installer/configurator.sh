#!/bin/bash


new_root_config()
{

printf "
=============================================================================

		WELCOME TO ROOT CONFIGURATION PART

=============================================================================
"

# configure time zone
read -p "Inform your region: " REGION
read -p "Inform your city: " CITY
ln -sf /usr/share/zoneinfo/"$REGION"/"$CITY" /etc/localtime
hwclock --systohc


# localization
printf "\n\nSetting up location\n"
awk -i inplace ' /en_US.UTF-8/ { $1 = substr($1, 2) }; 1 ' /etc/locale.gen
locale-gen
printf "LANG=en_US.UTF-8" > /etc/locale.conf

# network configuration
read -p "Insert hostname: " HOSTNAME
printf "$HOSTNAME" > /etc/hostname

# install grub
printf"\n\nInstalling grub\n\n"
grub-install --efi-directory=/efi --target=x86_64-efi 
[[ $? = 0 ]] || echo "GRUB-INSTALL FAILED TO INSTALL TRY GAIN!";
grub-mkconfig -o /boot/grub/grub.cfg
efibootmgr

# Enabling parallel downloads
awk -i inplace ' /ParallelDownloads/ { $1 = substr($1,2) }; 1 ' /etc/pacman.conf

# setting roots password
printf "\nSET A PASSWORD FOR USER ROOT\n"
passwd

printf """\n
CONGRATULATIONS!!!

THE INSTALLATION HAS FINISHED SUCCESSFULLY. 

EXITING FROM CHROOT...
"""
sleep 3s
exit;

}

new_root_config
