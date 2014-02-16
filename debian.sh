#!/bin/sh
# debian.sh
#
# Some extra configuration for Debian systems
#

# Install sudo and add current user to sudo group
su -c "apt-get install sudo && gpasswd -a $USER sudo"
newgrp sudo

sudo apt-get install -y -t wheezy-backports i3 tmux
# Set i3wm as default for LightDM
sudo sed -i 's/Exec=default/Exec=i3/' /usr/share/xsessions/lightdm-xsession.desktop

sudo apt-get install -y zsh
chsh -s `which zsh` # set ZSH as the default shell
./oh-my-zsh.sh
