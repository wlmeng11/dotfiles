#!/bin/bash
#

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim # this can also be done by syncing the submodule
vim +PluginInstall +qall
