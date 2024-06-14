sudo paru --noconfirm --sudoloop yazi
sudo paru --noconfirm --sudoloop cpio

sudo paru --noconfirm --sudoloop qemu-full dnsmasq virt-manager
sudo systemctl enable libvirtd.service
sudo usermod -G libvirt -a alpha
sudo usermod -G libvirt-qemu -a alpha

sudo paru -S intellij-idea-community-edition kotlin gradle jdk21-openjdk

# Install musicplayers
paru -S --noconfirm --sudoloop musikcube spotube-bin
