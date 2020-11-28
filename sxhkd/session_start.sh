#!/bin/sh
nitrogen --restore
if ! pgrep picom; then picom; fi &
xsetroot -cursor_name left_ptr
teams &
if ! pgrep dunst; then dunst; fi &
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
