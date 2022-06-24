#!/bin/bash

ARG="$1"

USERNAME="admin"
PASSWORD=""
GID=`id -g $USERNAME`
HOST=""
SHARE=""
MOUNTPOINT="/media/$SHARE"

if [ "$ARG" == "-u" ]; then
	umount $MOUNTPOINT
else
	mkdir -p $MOUNTPOINT # Create the mountpoint if it doesn't exist yet
	echo $PASSWORD | kinit $USERNAME
	mount -t cifs //$HOST/$SHARE $MOUNTPOINT -o user=$GID,cruid=$GID,sec=krb5
fi
