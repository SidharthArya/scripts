#!/bin/sh
TIME=$1
if [ -z "$TIME" ];
then
   TIME=60
fi
ESPEAK_ARGS="-s $TIME -g 0 "

while read line
do
  for i in $(echo "$line" | sed 's/ /\n/g');
  do
      echo "$i" 
  done 
done < "${1:-/dev/stdin}" | while read -r linet;
do
    echo "$line"
    notify-send "$line"
done | espeak
