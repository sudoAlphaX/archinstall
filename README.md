Install arch

Setup AUR helper (Paru)

sudo pacman -S --needed base-devel && mkdir repos && cd repos && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

paru -S librewolf-bin mprisence musikcube spotube-bin

systemctl --user enable mprisence.service syncthing.service

paru -S ttf-ms-win11-auto ttf-pacificio
paru -S hyprlang-git wl-clip-persist
paru -S hyprland-git hyprpaper-git hyprlock-git hypridle-git hyprcursor-git xdg-desktop-portal-hyprland-git
hyprpm update

paru -S catppuccin-gtk-theme-mocha papirus-folders-catppuccin-git
papirus-folders -C cat-mocha-mauve
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default-dark" && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' && gsettings set org.gnome.desktop.interface icon-theme Papirus

paru -S auto-cpufreq

* Setup fancontrol

sudo systemctl enable fancontrol.service reflector.timer reflector.service pkgfile-update.timer bluetooth.service avahi-daemon.service avahi-dnsconfd.service auto-cpufreq
sudo systemctl mask power-profiles-daemon.service

* Catppuccin grub

cd repos && git clone https://github.com/catppuccin/grub.git && cd grub
sudo cp -r src/* /boot/grub/themes/

- In /etc/default/grub:

GRUB_THEME="/boot/grub/themes/catppuccin-mocha-grub-theme/theme.txt"

- Comment the line:

`GRUB_TERMINAL_OUTPUT="console"`

_Disable quiet and splash while at it_

Regenerate grub

chsh

* import pgp keys

* Install caskaydia cove nerd font and rofi custom fonts
https://www.nerdfonts.com/font-downloads

* Download Pacifico font
https://github.com/googlefonts/Pacifico/raw/main/fonts/ttf/Pacifico-Regular.ttf

mkdir -p ~/.local/share/fonts
cp ~/.dotfiles/.config/rofi/assets/rofi-git/fonts/* ~/.local/share/fonts/

pipx install yt-dlp hanimetv tldr virtualenvwrapper

* Setup syncthing
* Setup KDE-Connect

* Setup arrpc client
npm install
