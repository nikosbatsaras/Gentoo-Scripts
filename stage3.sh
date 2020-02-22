#!/usr/bin/env bash

cd /mnt/gentoo
wget https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20200219T214502Z/stage3-amd64-20200219T214502Z.tar.xz
tar xpvf stage3-* --xattrs-include='*.*' --numeric-owner
wget https://raw.githubusercontent.com/nikosbatsaras/Gentoo-Scripts/master/make.conf
mv make.conf /mnt/gentoo/etc/portage/
