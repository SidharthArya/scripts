#!/bin/sh

pipe=/tmp/battery_status

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi

while true
do
    if read line <$pipe; then
	notify-send "Your Battery is low"
    fi
done
