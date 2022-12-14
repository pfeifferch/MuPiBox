#!/bin/sh
#

MUPIBOX_CONFIG="/etc/mupibox/mupiboxconfig.json"

ledPin=$(/usr/bin/jq -r .shim.ledPin ${MUPIBOX_CONFIG})
ledMax=$(/usr/bin/jq -r .shim.ledBrightnessMax ${MUPIBOX_CONFIG})

for iteration in 1 2 3 4; do
	echo "${ledPin}=0" > /dev/pi-blaster
	/bin/sleep 0.2
	echo "${ledPin}=${ledMax}" > /dev/pi-blaster
	/bin/sleep 0.2
done

echo "${ledPin}=0" > /dev/pi-blaster
