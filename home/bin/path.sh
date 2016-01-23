#!/bin/sh

# set PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/scripts/rvm
PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/workspace/robotics/ucpp/ucpp
PATH=$PATH:$HOME/bin/tmuxstart
PATH=$PATH:$HOME/.linuxbrew/bin
PATH=$PATH:$HOME/strongback/java/bin
export PATH

CLASSPATH=$CLASSPATH:$HOME/workspace/team8/hamcrest-core-1.3.jar
CLASSPATH=$CLASSPATH:$HOME/workspace/team8/junit-4.12.jar
export CLASSPATH

# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export ARDUINO_DIR="/usr/share/arduino"
export ARDMK_DIR="/usr/share/arduino"
export AVR_TOOLS_DIR="/usr"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
