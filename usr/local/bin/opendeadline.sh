#!/bin/bash

echo --- $(whoami) ran this script at $(date +"%m/%d/%Y %H:%M:%S $HOSTNAME") ---

/Applications/Thinkbox/Deadline6/Resources/deadlinecommand ChangeRepository /Volumes/mountpoint1

/Applications/Thinkbox/Deadline6/Resources/deadlineslave -nogui -name "$(scutil --get ComputerName)-GO"

echo "script done"
