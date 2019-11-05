#!/bin/bash
cp ./bash_profile ~/.bash_profile
cp ./bashrc ~/.bashrc


if [ -d "~/.ssh/" ]; then
	mkdir ~/.ssh
fi

cat authorized_keys >> ~/.ssh/authorized_keys

source ~/.bash_profile
