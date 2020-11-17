#!/bin/sh
PANEL_FIFO=/tmp/panel_fifo
if  [[ ! -p /tmp/panel_fifo ]];
then
	mkfifo /tmp/panel_fifo
fi
bspc subscribe all > "$PANEL_FIFO" &

while true;
do
	read line <$pipe
	if [[ "$line" ~= 'node' ]];
	then
		echo node
	else
		echo main
	fi
done


