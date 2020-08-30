#!/bin/sh
nitrogen --restore
gocryptfs -extpass 'kdialog --password Files' ~/.drive/Personal ~/Documents &&
    (
    emacs --config tracking & 
    st -e sh ~/.local/scripts/sync.sh &
    gwenview ~/Documents/Org/Tracking/images &
    python ~/.local/scripts/electricitybill.py &
    ) ||
        (
            kdialog --msgbox "Hello Guest";
        )
    
