#!/bin/bash
#
dotfiledir=~/dotfiles
scriptdit=~/dotfiles/files/scripts
servicedir=~/dotfiles/files/services
packagedir=~/dotfiles/files/packages
configdir=~/dotfiles/files/config
#
sudo pacman -Syu
sudo pacman -S --needed --noconfirm git
#
echo "Installing YAY"
sleep 2
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay && makepkg -sric --noconfirm
cd ~/ && rm -rf ~/yay
clear
#
echo "Backing Up .config ..."
sleep 2
cp -r ~/.config ~/.config_bak
clear
#
echo "Installing Packages ..."
sleep 2

sudo pacman -S --needed --noconfirm $(cat $packagedir/prerequisites.txt)
sudo pacman -S --needed --noconfirm $(cat $packagedir/core.txt)
sudo pacman -S --needed --noconfirm $(cat $packagedir/utilities.txt)
sudo pacman -S --needed --noconfirm $(cat $packagedir/fonts.txt)
sudo pacman -S --needed --noconfirm $(cat $packagedir/utilities2.txt)
yay -S --needed --noconfirm $(cat $packagedir/aur.txt)
yay -S --needed --noconfirm $(cat $packagedir/themes.txt)
#
xdg-user-dirs-update
echo "Setting up services"
systemctl --user --now enable $(cat $servicedir/services_user.txt)

#
mkdir -p ~/.config
cp -r $configdir/.config/* ~/.config/
cp -r $configdir/.gtkrc-2.0 ~/
#
echo "DONE"
