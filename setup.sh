#!/bin/bash

# Setup script to install our required software and 
# configure services etc.

# Make sure script is run as root.
if [ "$(id -u)" != "0" ]; then
  echo "Must be run as root with sudo! Try: sudo ./setup.sh"
  exit 1
fi

# update and upgrade existing packages
echo "Upgrading existing packages"
echo "=========================="
apt-get update
apt-get dist-upgrade -y

# install our required packages
echo "Installing dependencies..."
echo "=========================="
apt-get install wget omxplayer debhelper git -y
cd /
git clone https://github.com/rbrito/usbmount.git
cd usbmount
dpkg-buildpackage -us -uc -b
cd ..
apt install  ./usbmount_0.*_all.deb

# copy our bash script
mkdir /piSimpleVideoLooper
cd /piSimpleVideoLooper
wget https://raw.githubusercontent.com/jonwitts/pi_simple_video_looper/master/piSimpleVideoLooper.sh
