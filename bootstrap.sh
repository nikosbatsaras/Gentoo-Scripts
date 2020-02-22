#!/usr/bin/env bash

wget "https://raw.githubusercontent.com/nikosbatsaras/Gentoo-Scripts/master/partition.sh"
wget "https://raw.githubusercontent.com/nikosbatsaras/Gentoo-Scripts/master/mkfs.sh"
wget "https://raw.githubusercontent.com/nikosbatsaras/Gentoo-Scripts/master/stage3.sh"
wget "https://raw.githubusercontent.com/nikosbatsaras/Gentoo-Scripts/master/make.conf"

chmod +x *.sh

./partition.sh
./mkfs.sh
./stage3.sh
