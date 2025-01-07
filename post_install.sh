#!/bin/bash

# Initialize sudo to prevent asking for password later
chsh -s /usr/bin/zsh alpha
sudo id

# Install all needed packages
xargs sudo pacman -S --noconfirm <./packages.txt

bash ./dotfiles.sh

# Setup fancontrol
sudo cp -v ~/.dotfiles/assets/configs/etc/fancontrol /etc/
sudo systemctl enable --now fancontrol.service

# Install paru (AUR Helper)
sudo pacman -S --needed base-devel
mkdir -v ~/.repos
cd ~/repos || (
  echo -e "Failed to cd into ~/repos"
  exit 1
)
git clone https://aur.archlinux.org/paru.git
cd paru || (
  echo -e "Failed to cd into paru"
  exit 1
)
makepkg --noconfirm -si
cd ~ || (
  echo -e "Failed to cd into ~"
  exit 1
)

# Install fonts
paru -S --noconfirm --sudoloop ttf-ms-win11-auto

# Install themes
paru -S --noconfirm --sudoloop catppuccin-gtk-theme-mocha papirus-folders-catppuccin-git
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme Papirus
sudo papirus-folders -C cat-mocha-mauve

# Setup Hyprcursor
paru -S --noconfirm --sudoloop bibata-cursor-git
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'

# Install Hyprland (-git)
# paru -S --noconfirm --sudoloop hyprutils-git
# paru -S --noconfirm --sudoloop hyprlang-git hyprwayland-scanner-git
# paru -S --noconfirm --sudoloop hyprland-git hyprpaper-git hyprlock-git hypridle-git hyprcursor-git xdg-desktop-portal-hyprland-git

# Setup snapper
sudo snapper -c root create-config /
sudo systemctl enable snapper-backup.timer snapper-timeline.timer snapper-cleanup.timer snapper-boot.timer

# Copy /etc /usr configs
sudo copy ~/.dotfiles/assets/configs/etc/ /etc/
sudo copy ~/.dotfiles/assets/configs/usr/ /usr/

# Install browser
paru -S --noconfirm --sudoloop librewolf-bin

# Install auto-cpufreq
paru -S --noconfirm --sudoloop auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl mask power-profiles-daemon.service

# Setup caps2esc
sudo pacman -S --noconfirm interception-tools interception-caps2esc
sudo systemctl enable udevmon.service

# Install clipboard utils
sudo pacman -S --noconfirm wl-clip-persist

# System services
sudo systemctl enable reflector.timer pkgfile-update.timer bluetooth.service sshd.service
sudo systemctl start reflector.service
sudo systemctl start pkgfile-update.service

# Pipx packages
pipx install hanimetv senpwai

# Music players
paru -S --noconfirm --sudoloop musikcube spotube-bin mprisence
systemctl --user enable mprisence.service

# Other aur packages
paru -S --noconfirm --sudoloop <./aur.txt

# Userwise configs (usermods, etc)
bash ./userwise.sh
