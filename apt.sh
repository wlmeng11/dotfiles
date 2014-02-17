#!/bin/sh
# apt.sh
#
# Copy apt settings
#

echo "Update sources.list and apt preferences"
sudo cp etc/apt/sources.list /etc/apt/
sudo cp etc/apt/preferences /etc/apt/
sudo mkdir /etc/apt/sources.list.d/
sudo cp etc/apt/sources.list.d/* /etc/apt/sources.list.d/

# Maintainer keys
wget -O - http://debian.repo.frc.s3.amazonaws.com/rbmj.gpg.key | sudo apt-key add -

sudo apt-get update
