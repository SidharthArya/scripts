#!/bin/sh

TEMPARATURES="$(cat /proc/acpi/ibm/thermal |  cut -c 15-)"
MAX=0
for i in $TEMPARATURES;
do
	MAX=$(( $MAX < $i ? $i : $MAX ))
done
if (( $MAX > 50 ));
then 
	echo level full-speed > /proc/acpi/ibm/fan
elif (( $MAX > 45 ));
then
	echo level 7 > /proc/acpi/ibm/fan
elif (( $MAX > 40 ));
then
	echo level 4 > /proc/acpi/ibm/fan
else
	echo level 0 > /proc/acpi/ibm/fan
fi
cat /proc/acpi/ibm/thermal >> /tmp/fan_status
cat /proc/acpi/ibm/fan >> /tmp/fan_status
