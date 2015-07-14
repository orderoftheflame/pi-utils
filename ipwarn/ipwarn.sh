#!/bin/bash
VARFOLDER=/var/ipwarn
FILE=$VARFOLDER/ip;
OLDFILE=$VARFOLDER/oldip;
WEBFILE=/var/www/index.html;

if [ ! -d $VARFOLDER ]; then
   sudo mkdir $VARFOLDER;
fi

if [ -f $FILE ]; then
   sudo cp $FILE $OLDFILE;
else
   sudo touch $FILE;
fi

sudo curl -o $FILE http://ipv4.icanhazip.com/ &> /dev/null;
IP=`cat $FILE`;
echo Current IP address is: $IP;

if cmp -s "$FILE" "$OLDFILE"; then
    echo IP address unchanged.;
else
    echo IP address has changed. Sending email and updating web file.;

    #uncomment for email
    sudo echo $IP | mail -s "Home external IP has changed" ben@ootf.co.uk;

    #copy to web server
    sudo cp $FILE $WEBFILE;
fi

if [ -f $OLDFILE ]; then
    sudo rm -f $OLDFILE;
fi
