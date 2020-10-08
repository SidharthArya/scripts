#!/bin/sh




TEMPARATURES="$( sensors | grep °C | sed 's/.*://g' | awk '{print $1}'| tr -d C°+ | sed 's/\..*//g')"
MAX=0


for i in $TEMPARATURES;
do
	MAX=$(( $MAX < $i ? $i : $MAX ))
done

CURRENT_LEVEL="$(cat /proc/acpi/ibm/fan | tail -n 4 | head -n 1 | awk '{print $2}')"

if (( $MAX > 50 ));
then 
	LEVEL="disengaged"
elif (( $MAX > 45 ));
then
	LEVEL="7"
elif (( $MAX > 40 ));
then
	LEVEL="4"
else
	LEVEL="0"
fi
if (( $LEVEL != $CURRENT_LEVEL ))
then
	echo level "$LEVEL" > /proc/acpi/ibm/fan
else
cat /proc/acpi/ibm/fan >> /tmp/fan_status
fi
cat /proc/acpi/ibm/thermal >> /tmp/fan_status
