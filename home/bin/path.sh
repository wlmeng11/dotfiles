#!/bin/sh

# set PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/workspace/robotics/ucpp/ucpp
PATH=$PATH:$HOME/bin/tmuxstart
PATH=$PATH:$HOME/.linuxbrew/bin
export PATH

# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
