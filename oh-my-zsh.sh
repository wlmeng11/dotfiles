#!/bin/sh
#
# Install oh-my-zsh with my own config
#

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

ln -sf dotfiles/home/.zshrc ~
