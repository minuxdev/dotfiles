#!/bin/bash

function wellcome_note() {

    printf """
==========================================================================
==========================================================================

                        ARCH_INSTALL

==========================================================================
==========================================================================

WELCOME TO ARCHLINUX INSTALLATION SCRIPT
TO RUN THIS SCRIPT MAKE SURE OF:
1. YOU HAVE A STABLE INTERNET CONNECTION;
2. YOU READ EVERY SINGLE STEP BEFORE PROCEED;
3. YOU WON'T PROCEED UNLESS YOU KNOW EXACTLY WHAT YOU'RE DOING;
4. THE RESPONSABILITY OF ANY DAMAGE THIS SCRIPT MAY CAUSE IS ALL YOURS.

IF YOU FULLY AGREE WITH THIS POINTS, LET'S START, SKIP OTHERWISE!!!

"""
}



function arch_install() {

    # update the system clock
    timedatectl status
    
    # list all devices 
    lsblk -f

printf """
Make sure you inform the partitions correctly, any typo will cause failure.
e.g. sda1 
e.g. nvme0n1p1
"""
    # format and mount root partition
    read -p "ROOT PARTITION: " PARTITION
    while "$PARTITION"
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. ROOT PARTITION: " PARTITION; continue )
        mkfs.ext4 "/dev/$PARTITION"
        mount "/dev/$PARTITION" "/mnt"
        printf "\nPartition mounted!\n"
        break;
    done

    # format and mount efi partition
    lsblk -f
    read -p "EFI PARTITION: " PARTITION
    while "$PARTITION"
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. EFI PARTITION: " PARTITION; continue )
        mkfs.fat -F 32 "/dev/$PARTITION"
        mount --mkdir "/dev/$PARTITION" "/mnt/boot"
        printf "\nPartition mounted!\n"
        break;
    done

    # format and mount swap partition
    lsblk -f
    read -p "EFI PARTITION: " PARTITION
    while "$PARTITION"
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. SWAP PARTITION: " PARTITION; continue )
        mkswap "/dev/$PARTITION"
        swapon "/dev/$PARTITION"
        printf "\nPartition swapped successfully!!!\n"
        break;
    done


    # initializing keys
    pacman-key --init
    
    #add default archlinux keys
    pacman-key --populate archlinux

    # install archlinux-keyring
    pacman -S archlinux-keyring

    # install system
    pacstrap /mnt base-devel linux networkmanager systemd-sysvcompat git grub efibootmgr --noconfirm

    [ $? = 0 ] || ( echo "SORRY! THE INSTALLATION FAILED!"; exit 13; )

    printf "
\nCONGRATULATIONS!!!
THE INSTALLATION PROCESS FINISHED SUCCESSFULLY!
NOW LET'S CONFIGURE IT...
"

genfstab -L /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# configure time zone
read -p "Inform your region: " REGION
read -p "Inform your city: " CITY
ln -sf /usr/share/zoneinfo/"$REGION"/"$CITY" /etc/localtime
hwclock --systohc

# localization
awk -i inplace ' /en_US.UTF-8/ { $1 = substr($1, 2) }; 1 ' /etc/locale.gen
locale-gen
printf "LANG=en_US.UTF-8" > /etc/locale.conf

# network configuration
printf "archminux" > /etc/hostname

# install grub
grub-install --efi-directory=/boot/efi 
[ $? = 0 ] || echo "GRUB-INSTALL FAILED TO INSTALL TRY GAIN!";
grub-mkconfig -o /boot/grub/grub.cfg
efibootmgr

# setting roots password
printf "\nSET A PASSWORD FOR USER ROOT\n"
passwd

printf """
CONGRATULATIONS!!!

THE INSTALLATION FINISHED SUCCESSFULLY. 
EXECUTE THE pos_installation.sh SCRIPT SO FURTHER CONFIGURATIONS CAN BE MADE.

RESTARTING YOUR COMPUTER...
"""

}


wellcome_note
arch_install