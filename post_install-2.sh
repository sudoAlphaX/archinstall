# Install browser
paru -S --noconfirm --sudoloop librewolf-bin

# Hyprland plugins setup
paru -S --noconfirm --sudoloop cpio
hyprpm update
echo y | hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm update
hyprpm enable hyprexpo

# Install other packages
paru -S --noconfirm --sudoloop auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl mask power-profiles-daemon.service

paru -S --noconfirm --sudoloop localsend

# Setup caps2esc
paru -S --noconfirm --sudoloop interception-tools interception-caps2esc
sudo systemctl enable udevmon.service

# Other tasks
paru -S --noconfirm --sudoloop wl-clip-persist
sudo systemctl enable reflector.timer reflector.service pkgfile-update.service pkgfile-update.timer bluetooth.service avahi-daemon.service avahi-dnsconfd.service sshd.service
systemctl enable --user syncthing.service
cd ~/.dotfiles/assets/utilities/arrpc && npm install && cd ~
pipx install yt-dlp hanimetv tldr virtualenvwrapper
