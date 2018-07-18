#!/usr/bin/python3

# A simple Video Looper for the Raspberry Pi
#
# author:  Jon Witts
# license: GPL-3.0, see LICENSE included in this package
# 
# A Bash Video Looper for the Raspberry Pi and a Python3 shutdown button and LED indicator
# https://github.com/jonwitts/pi_simple_video_looper

from gpiozero import Button, LED
from signal import pause
from time import sleep
from os import system

button = Button(21, hold_time=3)
led = LED(16)

def shutdown_piZero():
    for i in range(3):
        led.on()
        sleep(0.5)
        led.off()
        sleep(0.5)
    system("sudo shutdown now -hP")

button.when_held = shutdown_piZero
pause()
