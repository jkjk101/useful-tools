#!/bin/bash

# example: fat32 usb to ext4

# identify usb mount point
lsblk
# unmount usb
sudo umount /dev/sdb1
# format usb to ext4
sudo mkfs.ext4 /dev/sdb1
# verify format
lsblk -f
# mount usb
sudo mkdir /mnt/usb
sudo mount /dev/sdb1 /mnt/usb
# verify mount
df -h /mnt/usb
# set permissions
sudo chown $USER:$USER /mnt/usb
# eject usb
sudo umount /mnt/usb
