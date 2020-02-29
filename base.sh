#!/usr/bin/env bash

mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev

chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"

mount /dev/sda2 /boot

emerge-webrsync

emerge --sync

eselect news list
eselect news read
eselect profile list
read -p $'Select a profile: ' profile
eselect profile set $profile

emerge --ask --verbose --update --deep --newuse @world

echo "Europe/Athens" > /etc/timezone
emerge --config sys-libs/timezone-data

vi /etc/locale.gen
locale-gen

eselect locale list
read -p $'Select a locale: ' locale
eselect locale set $locale

env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
