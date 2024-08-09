#!/bin/bash

# Initialize sudo to prevent asking for password later
chsh -s /usr/bin/zsh alpha
sudo id

# Clone dotfiles repo
git clone --recursive https://github.com/sudoAlphaX/dotfiles ~/.dotfiles

# Install paru (AUR Helper)
mkdir ~/.repos
sudo pacman -S --needed base-devel && cd ~/repos && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg --noconfirm -si && cd ~

printf "\n\nInitialize dotfiles now\n\n"
