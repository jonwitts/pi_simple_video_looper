#!/bin/bash

# A simple Video Looper for the Raspberry Pi
#
# author:  Jon Witts
# license: GPL-3.0, see LICENSE included in this package
#
# A Bash Video Looper for the Raspberry Pi and a Python3 shutdown button and LED indicator
# https://github.com/jonwitts/pi_simple_video_looper

# first find the first attached USB drive
# scan in reverse order to find the first!
mounts=( "/media/usb7" "/media/usb6" "/media/usb5" "/media/usb4" "/media/usb3" "/media/usb2" "/media/usb1" "/media/usb0" "/media/usb")
usbmount=""
for i in "${mounts[@]}"
do
    if mountpoint -q $i; then
        usbmount=$i
    fi
done

# now search the USB drive for mp4 files
shopt -s nullglob
for file in $usbmount/*.mp4 $usbmount/*.avi ; do
    filePlay=$file
done

# now play the last video file found, looping it with omxplayer
omxplayer -b --loop --adev both "$filePlay"

