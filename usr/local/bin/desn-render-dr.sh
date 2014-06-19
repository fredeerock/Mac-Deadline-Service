#!/bin/bash

echo --- $(whoami) ran this script at $(date +"%m/%d/%Y %H:%M:%S $HOSTNAME") ---
 
if [ ! -d /Volumes/mountpoint1 ]
	then
		mkdir /Volumes/mountpoint1
		#chown nobody:nogroup -R /Volumes/mountpoint1
		chmod 777 /Volumes/mountpoint1
		echo made /Volumes/mountpoint1 directory
	else
		echo /Volumes/mounpoint1 directory was already there
fi
 
if mount | grep /Volumes/mountpoint1 > /dev/null; then
    echo "deadline repositoru already mounted"
else
	echo "mounting deadline repository..."

	x=1
	while [ $x -gt 0 ]
	do
        	ping -c1 -W1000 desn-render.lsu.edu
        	x=$?
	        echo on $(date) status code is $x
       		if [ $x -eq 0 ]; then	
			echo connecting to smbfs...
			mount_smbfs //desn-render:Deadline108@desn-render.lsu.edu/DeadlineRepository /Volumes/mountpoint1
		fi
	done
fi

echo "script done"
