#!/bin/sh
export NNN_BMS='d:~/Documents;u:/home/user/Cam Uploads;D:~/Downloads/'
export NNN_SSHFS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                           # use a different color for each context
export NNN_TRASH=1                                 # trash (needs trash-cli) instead of delete
export EDITOR=nvim
nnn
