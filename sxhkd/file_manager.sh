#!/bin/sh
export NNN_BMS='D:~/Documents;l:/home/arya/Private/Lectures/;d:~/Downloads/;m:/run/media/arya;g:/run/user/1000/gvfs;t:~/.local/share/Trash/files;s:~/Pictures/Screenshots'
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
# export NNN_TRASH=1                                 # trash (needs trash-cli) instead of delete
export EDITOR=nvim
export NNN_PLUG='m:mount;p:preview-tabbed;s:subtitles.sh;d:dragdrop'
export NNN_FIFO=/tmp/nnn.fifo
#nnn -x
