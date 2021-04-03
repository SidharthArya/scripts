#!/bin/sh
pacmd list-sink-inputs  | less
if ![ -f /tmp/pulse_direct_records ]
then
   touch /tmp/pulse_direct_records;
fi
count="$(cat /tmp/pulse_direct_records)"
count= $(( $count + 1 ))
INDEX=$(read -p "Index: ")
pactl load-module module-null-sink sink_name=record$count
pactl move-sink-input $INDEX record$count
echo $count > /tmp/pulse_direct_records

