#!/bin/sh

check_battery() {
  # battery and status
  b_battery=$(acpi -b \
    | cut -d ',' -f 2 \
    | grep -o '[0-9]*')
  b_status=$(acpi -b | cut -d ' ' -f 3)

  if [ $b_status = 'Full,' ]; then
    dunstify 'The battery is full' 'You might unplug the cable'
  elif [ $b_battery -lt 15 ] && [ $b_status = 'Discharging,' ]; then
      dunstify "The battery is $b_battery%" "It's dying! Please help!"
  fi
}

while true; do
  check_battery
  sleep 10m
done
