#!/bin/bash

apt update && apt upgrade -y
apt install -y htop ranger screenfetch git curl apt-transport-https ca-certificates software-properties-common
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/bash_profile > ~/.bash_profile
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/0-clear > /etc/update-motd.d/0-clear
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/10-uname > /etc/update-motd.d/10-uname
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/20-screenfetch > /etc/update-motd.d/20-screenfetch
wget -qO- https://raw.githubusercontent.com/Ventouz/Profile/master/motd/30-sysinfo > /etc/update-motd.d/30-sysinfo
wget -qO- https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping > ~/.prettyping

sleep 1
chmod +x ~/.prettyping -v
sleep 1
chmod +x /etc/update-motd.d/* -v
rm -f /etc/motd
