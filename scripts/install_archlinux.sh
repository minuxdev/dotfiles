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
    printf "\n\n"
    read -p "ROOT PARTITION: " PARTITION
    while true 
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. ROOT PARTITION: " PARTITION; continue )
        mkfs.ext4 "/dev/$PARTITION"
        mount "/dev/$PARTITION" "/mnt"
        printf "\nPartition mounted!\n\n"
        break;
    done

    # format and mount efi partition
    printf "\n\n"
    lsblk -f
    read -p "EFI PARTITION: " PARTITION
    while true
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. EFI PARTITION: " PARTITION; continue )
        mkfs.fat -F 32 "/dev/$PARTITION"
        mount --mkdir "/dev/$PARTITION" "/mnt/efi"
        printf "\nPartition mounted!\n"
        break;
    done

    # format and mount swap partition
    printf "\n\n"
    lsblk -f
    read -p "SWAP PARTITION: " PARTITION
    while true
    do
        [ -b "/dev/$PARTITION" ] || ( read -p "INVALID, TRY AGAIN. SWAP PARTITION: " PARTITION; continue )
        mkswap "/dev/$PARTITION"
        swapon "/dev/$PARTITION"
        printf "\n\nPartition swapped successfully!!!\n"
        break;
    done


    printf "\n\nInstalling keys\n"
    # initializing keys
    pacman-key --init
    
    #add default archlinux keys
    pacman-key --populate archlinux

    # install archlinux-keyring
    pacman -Sy archlinux-keyring --noconfirm

    # install system
    printf "\n\nBeginning the system installation\n"
    pacstrap /mnt base-devel linux networkmanager systemd-sysvcompat git grub efibootmgr ntfs-3g --noconfirm

    [ $? = 0 ] || ( echo "SORRY! THE INSTALLATION FAILED!"; exit 13; )

    printf "
\n
CONGRATULATIONS!!!
THE INSTALLATION PROCESS FINISHED SUCCESSFULLY!
NOW LET'S CONFIGURE IT...

1. COPY new_root_config.sh SCRIPT TO ANYWHERE YOU CAN RUN IT
2. RUN BY TYPING ./new_root_config.sh

NOTE: MAKE SURE YOU RUN THIS INTO NEW ROOT.

\n
"
cp ~/scripts/new_root_config.sh /mnt/

genfstab -L /mnt >> /mnt/etc/fstab
arch-chroot /mnt


[ $? = 0 ] || ( printf "Failed to chroot to new root. Exiting... \n"; exit )


}


wellcome_none
arch_install
