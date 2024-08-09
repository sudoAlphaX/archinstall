# Install other packages
paru -S --noconfirm --sudoloop auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl mask power-profiles-daemon.service

# Other tasks
sudo systemctl enable reflector.timer reflector.service pkgfile-update.service pkgfile-update.timer bluetooth.service avahi-daemon.service sshd.service
systemctl enable --user syncthing.service
pipx install yt-dlp hanimetv tldr virtualenvwrapper
