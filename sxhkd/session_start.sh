#!/bin/sh
nitrogen --restore
if ! [ -d /home/arya/Documents/Org ];
then
gocryptfs -extpass 'zenity --password Files' ~/.drive/Personal ~/Documents 
fi &&

    (
    emacs --config tracking & 
    st -e sh ~/.local/scripts/sync.sh &
    gwenview ~/Documents/Org/Tracking/images &
    python ~/.local/scripts/electricitybill.py &
    ) ||
        (
            kdialog --msgbox "Hello Guest";
        )
