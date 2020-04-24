#!/bin/sh

bperc=$(acpi -b \
	| cut -d ',' -f 2 \
	| grep -o '[0-9]*')
bstat=$(acpi -b | cut -d ' ' -f 3)

if [ $bstat = 'Full,' ]; then
	dunstify 'The battery is full' 'You might unplug the cable'
elif [ $bperc -lt 15 ] && [ $bstat = 'Discharging,' ]; then
	dunstify "The battery is $bperc%" "It's dying! Please help!"
fi

