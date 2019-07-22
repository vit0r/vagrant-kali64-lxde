#!/usr/bin/env sh
# -*- coding: utf-8 -*-

readonly FLASH_PLAYER_INSTALL_URL="https://raw.githubusercontent.com/cybernova/fireflashupdate/master/fireflashupdate.sh"

init 3
runlevel  
systemctl stop gdm
systemctl status gdm

apt update
apt --purge remove gnome-core desktop-base gnome-shell gnome-session -y
apt install python3-dev gparted alsa-utils transmission unrar build-essential vim tor lame libavcodec-extra ffmpeg firmware-linux firmware-linux-nonfree -y
apt install xserver-xorg xserver-xorg-core xfonts-base xinit x11-xserver-utils -y
apt install lxde lxsession task-lxde-desktop lightdm -y

systemctl enable tor

usermod -a -G audio vagrant

wget ${FLASH_PLAYER_INSTALL_URL}
chmod +x ~/fireflashupdate.sh
~/fireflashupdate.sh
rm ~/fireflashupdate.sh

cp -rv /vagrant/etc/proxychains.conf /etc/proxychains.conf
cp -rv /vagrant/etc/interfaces /etc/network/interfaces

dhclient
reboot
