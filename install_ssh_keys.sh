#!/bin/bash

if [ ! -d "~/.ssh/" ]; then
        ssh-keygen
fi

cat authorized_keys >> ~/.ssh/authorized_keys
