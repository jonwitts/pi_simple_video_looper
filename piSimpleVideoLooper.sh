#!/bin/bash

# A simple Video Looper for the Raspberry Pi

# first find the first attached USB drive
mounts=( "/media/usb7" "/media/usb6" "/media/usb5" "/media/usb4" "/media/usb3" "/media/usb2" "/media/usb1" "/media/usb0" "/media/usb")
usbmount=""
for i in "${mounts[@]}"
do
    if mountpoint -q $i; then
        echo "$i is a mountpoint"
        $usbmount = $i
    else
        echo "$i is not a mountpoint"
    fi
done
echo $usbmount

# now search the USB drive for video files

# now play the first video file found, looping it with omxplayer
