#!/bin/bash

echo --- $(whoami) ran this script at $(date +"%m/%d/%Y %H:%M:%S $HOSTNAME") ---
 
if [ ! -d /Volumes/jobs ]
	then
		mkdir /Volumes/jobs
		# chown $(whoami) /Volumes/jobs
		chmod 777 /Volumes/jobs
		echo made /Volumes/jobs directory
	else
		echo /Volumes/mounpoint directory was already there
fi
 
if mount | grep /Volumes/jobs > /dev/null; then
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
	x=1

	while [ $x -gt 0 ]
	do
        	ping -c1 -W1000 desn-render.lsu.edu
        	x=$?
        	echo on $(date) status code is $x
        	if [ $x -eq 0 ]; then	
			mount_smbfs //desn-render:Deadline108@desn-render.lsu.edu/jobs /Volumes/jobs
			echo mounting smbfs jobs...
		fi
	done
fi

if [ ! -d /Volumes/jobs/Input/$(whoami) ]
	then
		mkdir /Volumes/jobs/Input/$(whoami)
		# chmod 775 /Volumes/jobs
		echo made user directory
	else
		echo user directory already there
fi
echo "script done"
