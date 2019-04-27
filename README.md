# PiBackupSD
A little script to backup a sd card with a progressbar. Creates an image file with date and given name.

### Requirements
Please install the following packages:
+ **pv** - for showing progress bar
+ **dd** - for generating image file
+ **lsblk** - grep filesize of inserted sd card
+ **gzip** - for compressing image file

### Instructions
1. Edit `CARDSLOTNAME` and `OUTPUTPATH` in backup_sd.sh`to your needs.
2. Copy file to .local/bin/
3. Run `backup_sd.sh` in your terminal
4. Script will ask for filename and writes the image file to desired `OUTPUTPATH`

### Restoring an image back to sd card
Restore can be done with the following command. Replace `image.gz` with the file name of your image:
`gzip -dc image.gz | sudo dd bs=4M of=/dev/$CARDSLOTNAME`

