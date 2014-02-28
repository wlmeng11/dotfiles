#!/bin/sh
# debian.sh
#
# Some extra configuration for Debian systems
#

if ! which sudo >/dev/null; then
	echo "Install sudo and add $USER to sudo group"
	su -c "apt-get install sudo"
fi

if ! cat /etc/group | grep sudo | grep $USER >/dev/null; then
	echo "Enter root password to add $USER to sudo group:"
	su -c "gpasswd -a $USER sudo"
fi

echo "Do you have sudo?"
if ! sudo -v >/dev/null; then
	echo "You are not a sudoer in this shell."
	echo 'Run "newgrp sudo" or relogin and rerun this script'
	exit 1
fi

./apt.sh

echo "Installing packages from wheezy-backports:"
sudo apt-get install -y -t wheezy-backports \
   	i3 \
	tmux
# Set i3wm as default for LightDM
sudo sed -i 's/Exec=default/Exec=i3/' /usr/share/xsessions/lightdm-xsession.desktop

sudo apt-get install -y zsh
if ! cat /etc/passwd | grep $USER | grep `which zsh` >/dev/null; then
	echo "Enter user password to set ZSH as default shell:"
	chsh -s `which zsh` # set ZSH as the default shell
	./oh-my-zsh.sh
else
	echo "ZSH is already the default shell for $USER"
fi

echo "Installing packages from wheezy:"
sudo apt-get install -y \ # Essential packages
	vim-gtk \
	rxvt-unicode \
	devscripts \

sudo apt-get install -y \ # Optional packages
	autojump \
