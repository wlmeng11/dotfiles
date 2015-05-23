#!/bin/bash
#
# Install Linuxbrew
# http://brew.sh/linuxbrew/
#


echo Installing dependencies:
# For Fedora:
command -v yum &&
	sudo yum groupinstall 'Development Tools' && sudo yum install curl git m4 ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel
# For Debian/Ubuntu:
command -v apt-get &&
	sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

# Clone the repository
[[ -d ~/.linuxbrew ]] && echo The directory ~/.linuxbrew already exists! Skipping installation. ||
	git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew

# Set up PATH (put these in ~/.zshrc
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
