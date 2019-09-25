#!/bin/sh

# Author: Noor Wachid
# Website: http://wachd.github.io

# limit volume level

limt=110
step=$1
curr=$(pactl list sinks \
  | grep 'Volume: front' \
  | cut -d / -f 2 \
  | tr -d '%')

case $2 in
  "mut")
    pactl set-sink-mute 0 toggle
    ;;
  "dec")
    pactl set-sink-volume 0 -${step}%
    ;;
  "inc")
    if [ $(($curr + $step)) -le $limt ]; then
      pactl set-sink-volume 0 +${step}%
    else
      pactl set-sink-volume 0 ${limt}%
    fi
    ;;
esac

bar_restart.sh
