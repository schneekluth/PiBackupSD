#!/bin/bash

# This programm makes a backup of an SD-Card plugged into your
# machine e.g. for Raspberry Pi. Outputs a gzip file with current
# date and asked file name e.g.: 2018_05_10_raspberrypi.gz
#
# To restore gzip to SD card use:
# gzip -dc image.gz | sudo dd bs=4M of=/dev/$CARDSLOTNAME
#
# Requirements: pv - for progress bar
#               dd - generating img file
#               lsblk - grep filesize of sd card
#               gzip - compression of img

# Find your cardslot name with cmd "lsblk"
CARDSLOTNAME="sdb"
CARDSIZE="$(lsblk --bytes | grep -m 1 $CARDSLOTNAME | awk '{print $4}')"
OUTPUTPATH="/home/$USER/Desktop/"

echo "Please insert file name:"
read FILENAME
echo "Writing file to: $OUTPUTPATH`date +%Y_%m_%d_`$FILENAME.gz"

sudo dd bs=4M if=/dev/$CARDSLOTNAME | pv -s $CARDSIZE | gzip > $OUTPUTPATH`date +%Y_%m_%d_`$FILENAME.gz

echo "Syncing disk"
sync
echo "Done!"
