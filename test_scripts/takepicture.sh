#!/bin/bash
echo "Taking Picture."
raspistill -t 1000 -dt -o /home/pi/Pictures/%d.jpg

# Backup any new pictures.
rsync -ar /home/pi/Pictures/ swit@192.168.1.2:/media/RAID6/GaragePi/ &

