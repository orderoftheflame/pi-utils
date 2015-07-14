#!/bin/bash

MAXFILES="NR>"5;
FOLDER=$1;

if [ -n "$2" ]
then
	MAXFILES="NR>"$2;
fi

if [ -z "$FOLDER" ]
then
        echo "Usage: cleanup target_directory [files_to_keep(5)]";
else
	cd $FOLDER;
#echo 'NR>'$MAXFILES;
#	echo `ls -t $FOLDER | awk 'NR>'$MAXFILES`;
	rm `ls -t | awk $MAXFILES`;
fi
