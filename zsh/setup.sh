#!/usr/bin/env bash
# -*- encoding: utf-8 -*-
# You can use this script for debian based linux distros(WSL included) and macOS.
# Requirements are git, and brew if you're using macOS.

git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    brew install zsh
    rcfile="zshrc"
else
    # linux
    echo "Pacman or aptitute? (p/a): "
    read choice
    if [[ $choice == "p" ]]; then
        sudo pacman -Syu zsh
    else
        sudo apt-get install zsh -y
    fi
    
    rcfile="zshrc"
fi


cd $(dirname $0)
cat $rcfile > ~/.zshrc

# change shell for "user"
# do not use sudo
chsh -s $(which zsh)
