#!/bin/bash

welcome_note() {
	printf """
==========================================================================
==========================================================================

                        ARCH_INSTALLER Ver:0.2

==========================================================================
               Author: __minux__ | Release: 2023, December
==========================================================================

WELCOME TO ARCHLINUX INSTALLATION SCRIPT
TO RUN THIS SCRIPT MAKE SURE:
1. YOU HAVE A STABLE INTERNET CONNECTION;
2. YOU READ EVERY SINGLE STEP BEFORE PROCEED;
3. YOU WON'T PROCEED UNLESS YOU UNDERSTAND EXACTLY WHAT YOU'RE BEING TOLD;
4. THE RESPONSABILITY OF ANY DAMAGE THIS SCRIPT MAY CAUSE IS ALL YOURS.

IF YOU FULLY AGREE WITH THIS POINTS, LET'S START, SKIP OTHERWISE!!!

"""
}

_installer() {

	# update the system clock
	timedatectl status

	# list all devices
	lsblk -f

	printf """

Make sure you inform the partitions correctly, any typo may cause a failure during this process.
e.g. sda1 
e.g. nvme0n1p1
"""
	# format and mount root partition
	printf "\n\n"
	read -p "ROOT PARTITION: " PARTITION
	while true; do
		[ -b "/dev/$PARTITION" ] || (
			read -p "INVALID, TRY AGAIN. ROOT PARTITION: " PARTITION
			continue
		)
		mkfs.ext4 "/dev/$PARTITION"
		mount "/dev/$PARTITION" "/mnt"

		[ "$?" = 0 ] && (printf "\nPartition mounted!\n\n") ||
			(printf "Something went wrong!")
		break
	done

	# format and mount efi partition
	printf "\n\n"
	lsblk -f
	read -p "EFI PARTITION: " PARTITION
	while true; do
		[ -b "/dev/$PARTITION" ] || (
			read -p "INVALID, TRY AGAIN. EFI PARTITION: " PARTITION
			continue
		)

		read -p "DO YOU WANT TO FORMAT THIS PARTITION? [y]es [n]o " ANSWER
		[ $ANSWER = 'y' ] && mkfs.fat -F 32 "/dev/$PARTITION"
		mount --mkdir "/dev/$PARTITION" "/mnt/efi"

		[ "$?" = 0 ] && (printf "\nPartition mounted!\n\n") ||
			(printf "Something went wrong!")
		break
	done

	# format and mount swap partition
	printf "\n\n"
	read -p "Do you want to use swap partition? [y/any key]" ANSWER

	if [ "$ANSWER" = 'y' ]; then
		lsblk -f
		read -p "SWAP PARTITION: " PARTITION
		while true; do
			[ -b "/dev/$PARTITION" ] ||
				(
					read -p "INVALID, TRY AGAIN. SWAP PARTITION: " PARTITION
					continue
				)
			mkswap "/dev/$PARTITION"
			swapon "/dev/$PARTITION"

			[ "$?" = 0 ] && (printf "\nPartition mounted!\n\n") ||
				(printf "Something went wrong!")
			break
		done
	fi

	printf "\n\nInstalling keys\n"
	# initializing keys
	pacman-key --init

	#add default archlinux keys
	pacman-key --populate archlinux

	# install archlinux-keyring
	pacman -Sy archlinux-keyring --noconfirm

	# install system
	printf "\n\nBeginning the system installation\n"
	pacstrap /mnt base-devel linux linux-firmware systemd-sysvcompat iputils \
		libxcrypt-compat cifs-utils git grub efibootmgr ntfs-3g vim iproute2 iwd --noconfirm

	[ $? = 0 ] || (
		echo "SORRY! THE INSTALLATION FAILED!"
		exit 13
	)

	printf "
\n
CONGRATULATIONS!!!
THE INSTALLATION PROCESS HAS FINISHED SUCCESSFULLY!
NOW LET'S CONFIGURE IT...
\n
"
	cp ~/installer/configurator.sh /mnt/

	genfstab -L /mnt >>/mnt/etc/fstab
	arch-chroot /mnt

	[ $? = 0 ] || (
		printf "Failed to chroot to new root. Exiting... \n"
		exit
	)

}

welcome_note
_installer
