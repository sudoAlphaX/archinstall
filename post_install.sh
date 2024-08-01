#!/bin/bash

# Initialize sudo to prevent asking for password later
chsh -s /usr/bin/zsh alpha
sudo id

# Clone dotfiles repo
git clone --recursive https://github.com/sudoAlphaX/dotfiles ~/.dotfiles

# Setup fancontrol
sudo cp ~/.dotfiles/assets/configs/etc/fancontrol /etc/
sudo systemctl enable --now fancontrol.service

# Install paru (AUR Helper)
mkdir ~/.repos
sudo pacman -S --needed base-devel && cd ~/repos && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg --noconfirm -si && cd ~

# Install fonts
mkdir -p ~/.local/share/fonts
paru -S --noconfirm --sudoloop ttf-ms-win11-auto
wget -q -O- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.tar.xz | tar -Jx -C ~/.local/share/fonts
wget -P ~/.local/share/fonts/Pacifico-Regular.ttf "https://github.com/googlefonts/Pacifico/raw/main/fonts/ttf/Pacifico-Regular.ttf"
cp ~/.dotfiles/.config/rofi/assets/rofi-git/fonts/* ~/.local/share/fonts/

# Install themes
paru -S --noconfirm --sudoloop catppuccin-gtk-theme-mocha papirus-folders-catppuccin-git
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme Papirus
papirus-folders -C cat-mocha-mauve

# Setup Hyprcursor
paru -S --noconfirm --sudoloop bibata-cursor-git
gsettings set org.gnome.desktop.interface cursor-size 22
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'

# Install Hyprland
paru -S --noconfirm --sudoloop hyprutils-git
paru -S --noconfirm --sudoloop hyprlang-git hyprwayland-scanner-git
paru -S --noconfirm --sudoloop hyprland-git hyprpaper-git hyprlock-git hypridle-git hyprcursor-git xdg-desktop-portal-hyprland-git

printf "\n\nInitialize dotfiles now\n\n"
