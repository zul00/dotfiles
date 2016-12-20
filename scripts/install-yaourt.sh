# /bin/bash

sudo echo  >> /etc/pacman.conf
sudo echo [archlinuxfr] >> /etc/pacman.conf
sudo echo SigLevel = Never >> /etc/pacman.conf
sudo echo Server = http://repo.archlinux.fr/\$arch >> /etc/pacman.conf
sudo pacman -Sy yaourt
