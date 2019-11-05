#!/bin/bash

cp *.tff /usr/share/fonts/
cp ./prettyping /usr/bin/prettyping

apt install -y lsd fd hyperfine htop ranger git
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat_*.deb
