#!/bin/sh
#nitrogen --restore
picom &
xsetroot -cursor_name left_ptr
teams &
dunst &
if ! [ -d /home/arya/Documents/Org ];
then
gocryptfs -extpass 'zenity --password Files' ~/.drive/Personal ~/Documents 
fi &&

    (
    emacs --config tracking & 
    emacs --config org &
    st -e sh ~/.local/scripts/sync.sh &
    sxiv ~/Documents/Org/Tracking/images &
    python ~/.local/scripts/electricitybill.py &
    ) ||
        (
            kdialog --msgbox "Hello Guest";
	    emacs --config none --daemon &
    )
