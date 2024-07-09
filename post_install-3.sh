sudo paru --noconfirm --sudoloop yazi

sudo paru -S --noconfirm --sudoloop qemu-full dnsmasq virt-manager && sudo systemctl enable libvirtd.service && sudo usermod -G libvirt -a $(whoami) && sudo usermod -G libvirt-qemu -a $(whoami)

sudo paru -S --noconfirm --sudoloop intellij-idea-community-edition kotlin gradle jdk21-openjdk

# Install musicplayers
paru -S --noconfirm --sudoloop musikcube spotube
