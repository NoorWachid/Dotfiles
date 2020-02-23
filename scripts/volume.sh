#!/bin/sh

# Author: Noor Wachid
# Website: http://wachd.github.io

# limit volume level

step='5'
anid='9879761'

case $1 in
  "mut")
		amixer sset Master toggle
    ;;
  "inc")
		amixer sset Master $step%+
    ;;
  "dec")
		amixer sset Master $step%-
    ;;
esac

curr=$(amixer sget Master | tail -n 1 | cut -d ' ' -f 6 | grep -o '[0-9]*')

dunstify -t 800 -r "$anid" "Volume ${curr}%"
