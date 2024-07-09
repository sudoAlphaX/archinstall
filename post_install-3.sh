paru --noconfirm --sudoloop yazi

paru -S --noconfirm --sudoloop qemu-full dnsmasq virt-manager quickemu && sudo systemctl enable libvirtd.service && sudo usermod -G libvirt -a $(whoami) && sudo usermod -G libvirt-qemu -a $(whoami)

paru -S --noconfirm --sudoloop intellij-idea-community-edition kotlin gradle jdk21-openjdk

# Install musicplayers
paru -S --noconfirm --sudoloop musikcube spotube

paru -S ventoy
