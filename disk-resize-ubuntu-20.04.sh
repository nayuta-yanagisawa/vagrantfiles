#!/bin/bash
#
# SRC: https://github.com/carbon108/Box-Resize
#

ROOT_FS_SIZE=`df -h / | sed -n 2p | awk '{print $2;}'`
echo "Root File System (/) is $ROOT_FS_SIZE"

echo "Resizing partitions..."
# First resize extended partition then root partition
parted /dev/sda resizepart 2 100%
parted /dev/sda resizepart 5 100%

echo "Extending logical Volume..."
pvresize /dev/sda5

echo "Extending Volume Group..."
lvextend -l +100%FREE /dev/vgvagrant/root

echo "Resizing root file system..."
resize2fs -p /dev/mapper/vgvagrant-root

ROOT_FS_SIZE=`df -h / | sed -n 2p | awk '{print $2;}'`
echo "Root File System (/) is $ROOT_FS_SIZE" 
