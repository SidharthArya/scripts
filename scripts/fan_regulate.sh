#!/usr/bin/env sh
touch /tmp/fan_status
echo level disengaged > /proc/acpi/ibm/fan
while true;
do
# TEMPARATURES="$(sensors | grep °C | grep -v temp11 | sed 's/.*://g' | awk '{print $1}'| tr -d C°+ | sed 's/\..*//g' | tr -d '(A..z')"
# MAX=0
# for i in $TEMPARATURES;
# do
	   # MAX="$(( $MAX < $i ? $i : $MAX ))"
# done
MAX=$(acpi -t  | awk '{print $4}' | sed 's/\..*//g')
CURRENT_LEVEL="$(cat /proc/acpi/ibm/fan | tail -n 4 | head -n 1 | awk '{print $2}')"
if (( $MAX > 65 ));
then 
	LEVEL="disengaged"
	cpupower frequency-set -u 2GHz
elif (( $MAX > 55 ));
then
	LEVEL="7"
elif (( $MAX > 50 ));
then
	LEVEL="4"
else
	LEVEL="0"
	cpupower frequency-set -u 2GHz
fi
if [[ $LEVEL != $CURRENT_LEVEL ]]
then
	echo level "$LEVEL" > /proc/acpi/ibm/fan
	cat /proc/acpi/ibm/fan >> /tmp/fan_status
else
	cat /proc/acpi/ibm/fan >> /tmp/fan_status
fi
echo $MAX > /tmp/fan_status
sleep 15
done
