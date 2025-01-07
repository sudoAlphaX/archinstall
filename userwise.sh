# Snapper setup
sudo snapper -c "$(whoami)" create-config ~/.

# Virt-manager setup
sudo usermod -G libvirt -a "$(whoami)"
sudo usermod -G libvirt-qemu -a "$(whoami)"

# tpm-fido
sudo usermod -G tss -a "$(whoami)"
sudo usermod -G uhid -a "$(whoami)"
