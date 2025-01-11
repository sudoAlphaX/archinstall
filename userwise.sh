# Snapper setup
sudo snapper -c "$(whoami)" create-config ~/.

# Virt-manager setup
sudo usermod -G libvirt -a "$(whoami)"
sudo usermod -G libvirt-qemu -a "$(whoami)"

# Systemd user units
systemctl --user enable mprisence.service
systemctl --user enable syncthing.service
systemctl --user enable dotfiles.service
