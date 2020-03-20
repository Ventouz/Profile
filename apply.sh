#!/bin/bash

apt update && apt upgrade -y
apt install -y htop ranger screenfetch git curl apt-transport-https ca-certificates software-properties-common


echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8

wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/bash_profile > ~/.bash_profile
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/0-clear > /etc/update-motd.d/0-clear
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/10-uname > /etc/update-motd.d/10-uname
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/20-screenfetch > /etc/update-motd.d/20-screenfetch
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/30-sysinfo > /etc/update-motd.d/30-sysinfo


rm /etc/motd
