#!/bin/sh
gocryptfs -extpass 'zenity --password Files' ~/.drive/Personal ~/Documents  &&
    (
    emacs --config tracking & 
    emacs --config org &
    st -e sh ~/.local/scripts/sync.sh &
    sxiv ~/Documents/Org/Tracking/images &
    python ~/.local/scripts/electricitybill.py &
    ) ||
        (
            kdialog --msgbox "Hello Guest";
    )
