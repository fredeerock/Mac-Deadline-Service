#!/bin/bash

echo --- $(whoami) ran this script at $(date +"%m/%d/%Y %H:%M:%S $HOSTNAME") ---
 
if [ ! -d /Volumes/mountpoint2 ]
	then
		mkdir /Volumes/mountpoint2
		# chown $(whoami) /Volumes/mountpoint2
		chmod 777 /Volumes/mountpoint2
		echo made /Volumes/mountpoint2 directory
	else
		echo /Volumes/mounpoint directory was already there
fi
 
if mount | grep /Volumes/mountpoint2 > /dev/null; then
    echo "deadline-jobs mounted."

    # echo "unmounting..." 
 	# value="jobs"
	# mount | grep $value
	# status=$?
	# while [ $status = 0 ]; 
 #   		do
 #    		umount /Volumes/deadline-server
 #    		mount | grep $value
 #    		status=$?
 #    		# echo $status
	# 	done;
	# echo DONE

else
	echo "mounting deadline jobs..."
	mount_smbfs //desn-render:Deadline108@desn-render.lsu.edu/jobs /Volumes/mountpoint2
fi

if [ ! -d /Volumes/mountpoint2/Input/$(whoami) ]
	then
		mkdir /Volumes/mountpoint2/Input/$(whoami)
		# chmod 775 /Volumes/mountpoint2
		echo made user directory
	else
		echo user directory already there
fi
echo "script done"