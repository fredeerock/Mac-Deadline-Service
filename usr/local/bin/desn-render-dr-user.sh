#!/bin/bash

echo --- $(whoami) ran this script at $(date +"%m/%d/%Y %H:%M:%S $HOSTNAME") ---
 
if [ ! -d /Volumes/mountpoint3 ]
	then
		mkdir /Volumes/mountpoint3
		#chown nobody:nogroup -R /Volumes/mountpoint3
		#chmod 777 /Volumes/mountpoint3
		echo made /Volumes/mountpoint3 directory
	else
		echo /Volumes/mounpoint1 directory was already there
fi
 
if mount | grep /Volumes/mountpoint3 > /dev/null; then
    echo "deadline repositoru already mounted"
else
	echo "mounting deadline repository..."
	mount_smbfs //desn-render:Deadline108@desn-render.lsu.edu/DeadlineRepository /Volumes/mountpoint3
	# mount_smbfs //admin:Digital328Art@artech.lsu.edu/DeadlineRepository6 /Volumes/mountpoint3
fi
echo "script done"