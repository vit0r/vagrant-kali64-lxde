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
chmod +x /home/vagrant/fireflashupdate.sh
sh /home/vagrant/fireflashupdate.sh
rm /home/vagrant/fireflashupdate.sh

cp -arv /vagrant/etc/proxychains.conf /etc/proxychains.conf
cp -arv /vagrant/etc/interfaces /etc/network/interfaces

ln -s /usr/bin/ls /usr/bin/ll

#apt upgrade -y

reboot
