#!/bin/bash

cp *.tff /usr/share/fonts/
cp ./prettyping /usr/bin/prettyping

apt install -y fd hyperfine htop ranger screenfetch

cd ~

## bat - a cat clone with wings
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat_*.deb

## lsd - ls on steroids
wget https://github.com/Peltoche/lsd/releases/download/0.16.0/lsd-musl_0.16.0_amd64.deb && dpkg -i lsd*.deb

## bmon - network interfaces monitoring
git clone https://github.com/tgraf/bmon.git ~/bmon
cd ~/bmon
apt install -y build-essential make libconfuse-dev libnl-3-dev libnl-route-3-dev libncurses-dev pkg-config dh-autoreconf
./autogen.sh
./configure
make
make install
