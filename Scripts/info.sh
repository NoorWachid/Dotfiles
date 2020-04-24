#!/bin/sh

LDate=$(date '+%A, %d %B %Y')
LTime=$(date '+%I:%M %p')
LBatt=$(acpi -b | cut -d ' ' -f 3-)

dunstify -r 9841 "[${LTime}] It's ${LDate}" "${LBatt}"
