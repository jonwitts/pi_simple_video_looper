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
apt-get install wget omxplayer mountpoint usbmount -y

# Configure USBMount for Stretch
# from https://vivekanandxyz.wordpress.com/2017/12/29/detecting-and-automatically-mounting-pendrive-on-raspbian-stretch-lite/
sed -i '/MountFlags=slave/c\MountFlags=shared' /lib/systemd/system/systemd-udevd.service
systemctl daemon-reload

# copy our bash script
mkdir /piSimpleVideoLooper
cd /piSimpleVideoLooper
wget https://raw.githubusercontent.com/jonwitts/pi_simple_video_looper/master/piSimpleVideoLooper.sh

# copy and activate our systemd definitions
wget https://raw.githubusercontent.com/jonwitts/pi_simple_video_looper/master/piSimpleVideoLooper.service
mv ./piSimpleVideoLooper.service /lib/systemd/system/piSimpleVideoLooper.service

