
# Install browser
paru -S --noconfirm --sudoloop librewolf-bin

# Install musicplayers
paru -S --noconfirm --sudoloop musikcube spotube-bin

# Install other packages
paru -S --noconfirm --sudoloop auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl mask power-profiles-daemon.service

# Other tasks
paru -S --noconfirm --sudoloop wl-clip-persist
sudo systemctl enable reflector.timer reflector.service pkgfile-update.timer bluetooth.service avahi-daemon.service avahi-dnsconfd.service 
systemctl enable --user syncthing.service
cd ~/.dotfiles/assets/utilities/arrpc && npm install && cd ~
pipx install yt-dlp hanimetv tldr virtualenvwrapper
