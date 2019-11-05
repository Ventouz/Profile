#!/bin/bash

cp *.tff /usr/share/fonts/
cp ./prettyping /usr/bin/prettyping

apt install -y fd hyperfine htop ranger git
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat_*.deb
wget https://github.com/Peltoche/lsd/releases/download/0.16.0/lsd-musl_0.16.0_amd64.deb && dpkg -i lsd*.deb

