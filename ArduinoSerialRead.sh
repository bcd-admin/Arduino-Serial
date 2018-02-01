#!/bin/bash

#user must be root to continue
id=$(id -u)
case $id in
0);;
1000) echo "This script can only be run by root.";;
esac

#Main program
cd /dev/
device=$(find -name tty 1>&2> /dev/null)
echo "Devices Found: $device"
echo "Attempt to connect to $device?"
read connect
case $connect in
[Yy]);;
[Nn])) echo "Abort."; exit 2;;
esac
#User wants to connect to the device, attempt
cat $device 2> /dev/null
case $? in
127) echo "Insufficent permissions."; exit 127;;
0);;
1) echo "Connection to $device was refused."; exit 1;;
esac
