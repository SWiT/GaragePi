#!/bin/bash
echo "Taking Picture. (1/2)"
raspistill -t 1000 -dt -o /home/pi/Pictures/%d_Garage_1.jpg

echo "Toggle garage door relay for 1 second."
# This toggles LOW
#gpio write 0 1
#gpio mode 0 output
#gpio write 0 0
#sleep 1s
#gpio write 0 1

# This toggles HIGH
gpio write 0 0
gpio mode 0 output
gpio write 0 1
sleep 1s
gpio write 0 0

echo "Waiting 15 seconds..."
sleep 15s

echo "Taking Picture. (2/2)"
raspistill -t 1000 -dt -o /home/pi/Pictures/%d_Garage_2.jpg

# Backup any new pictures.
rsync -ar /home/pi/Pictures/ swit@192.168.1.2:/media/RAID6/GaragePi/ &
