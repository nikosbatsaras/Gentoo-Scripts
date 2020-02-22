#!/usr/bin/env bash

device=sda

mkfs.ext2 "/dev/${device}2"
mkfs.ext4 "/dev/${device}4"

mkswap "/dev/${device}3"
swapon "/dev/${device}3"

mount "/dev/${device}4" /mnt/gentoo
