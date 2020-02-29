#!/usr/bin/env bash

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

# eselect locale list
# read -p $'Select a locale: ' locale
# eselect locale set $locale

env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
