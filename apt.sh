#!/bin/sh
# apt.sh
#
# Copy apt settings
#

echo "Update sources.list and apt preferences"
sudo cp etc/apt/sources.list /etc/apt/
sudo cp etc/apt/preferences /etc/apt/
sudo mkdir /etc/apt/sources.list.d/
sudo cp etc/apt/sources.list.d/* /etc/apt/sources.list.d/ # TODO: use add-apt-repository instead

echo "Fetching maintainer keys"
wget -q -O - http://debian.repo.frc.s3.amazonaws.com/rbmj.gpg.key | sudo apt-key add - # gcc-vxworks
wget -q -O - http://emacs.naquadah.org/key.gpg | sudo apt-key add - # emacs-snapshot
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E # Dropbox
sudo apt-get install pkg-mozilla-archive-keyring # Mozilla backports

sudo apt-get update
