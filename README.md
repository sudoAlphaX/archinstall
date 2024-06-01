Install arch

Setup AUR helper (Paru)

sudo pacman -S --needed base-devel && mkdir repos && cd repos && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

paru -S librewolf-bin mprisence musikcube spotube

systemctl --user enable mprisence.service

paru -S ttf-ms-win11-auto ttf-pacificio
paru -S hyprlang-git wl-clip-persist
paru -S hyprland-git hyprpaper-git hyprlock-git hypridle-git hyprcursor-git xdg-desktop-portal-hyprland-git
hyprpm update

paru -S catppuccin-gtk-theme-mocha papirus-folders-catppuccin-git
papirus-folders -C cat-mocha-mauve
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default-dark" && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

* Setup fancontrol
sudo systemctl --enable fancontrol.service

* Setup arrpc client
npm install

* Setup syncthing
systemctl --user enable syncthing.service

sudo systemctl enable reflector.timer
sudo systemctl enable reflector.service
sudo systemctl enable pkgfile-update.timer