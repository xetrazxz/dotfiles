#!/bin/bash
sudo pacman -S --needed --noconfirm git
git clone https://github.com/xetrazxz/dotfiles..git ~/dotfiles
sh ~/dotfiles/files/setup.sh
