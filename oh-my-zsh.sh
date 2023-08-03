#!/bin/sh
#
# Install oh-my-zsh with my own config
#

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

ln -sf dotfiles/home/.zshrc ~
chsh -s `command -v zsh`

# Install syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
