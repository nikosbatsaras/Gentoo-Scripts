#!/usr/bin/env bash

device=sda

parted --script "/dev/${device}" mklabel gpt
parted --script "/dev/${device}" mkpart primary  "1MiB"     "3MiB"
parted --script "/dev/${device}" mkpart primary  "3MiB"   "131MiB"
parted --script "/dev/${device}" mkpart primary  "131MiB" "643MiB"
parted --script "/dev/${device}" mkpart primary  "643MiB"   "100%"

parted --script "/dev/${device}" name 1 grub
parted --script "/dev/${device}" name 2 boot
parted --script "/dev/${device}" name 3 swap
parted --script "/dev/${device}" name 4 rootfs

parted --script "/dev/${device}" set 1 bios_grub on
parted --script "/dev/${device}" set 2 boot on

partprobe "/dev/$device"
