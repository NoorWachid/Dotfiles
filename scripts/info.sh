#!/bin/sh

sdate=$(date '+%A, %d %B')
stime=$(date '+%I:%M %p')
sbatt=$(acpi -b | cut -d ' ' -f 3-)

dunstify -r 9841 "${sdate}           ${stime}" "${sbatt}"
