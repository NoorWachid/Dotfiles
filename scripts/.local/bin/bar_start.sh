#!/bin/sh

delimiter="|"

trim() {
  sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'
}

update() {
  # volume
  b_volume=$(pactl list sinks \
    | grep 'Volume: front' \
    | cut -d / -f 2 \
    | tr -d '%' \
    | trim)
  b_muted=$(pactl list sinks \
    | grep 'Mute' \
    | cut -d ' ' -f 2)
  if [ $b_muted = 'no' ]; then
    b_muted=''
  else
    b_muted='M'
  fi

  # brightness
  b_brightness=$(xbacklight -get)
  b_brightness=${b_brightness%.*}


  # battery and status
  b_battery=$(acpi -b \
    | cut -d ',' -f 2 \
    | cut -d '%' -f 1 \
    | trim)
  b_status=$(acpi -b | cut -d ' ' -f 3)
  if [ $b_status = 'Full,' ]; then
    b_status='F'
  elif [ $b_status = 'Charging,' ]; then
    b_status='C'
  else
    b_status=''
  fi

  # datetime
  b_datetime=$(date "+%a %d %b %H:%M %p")

  # ethernet connection
  b_c_count=$(nmcli -t -f NAME c show --active | wc -l)

  if [ $b_c_count = 0 ]; then
    b_connection=""
  elif [ $b_c_count -eq 1 ]; then
    b_connection="$(nmcli -t -f NAME c show --active) |"
  else
    b_connection="$(nmcli -t -f NAME c show --active \
      | sed -e 'N;s/\n/, /') |"
  fi

  xsetroot -name "${b_connection} L${b_brightness} V${b_muted}${b_volume} B${b_status}${b_battery} | ${b_datetime} "
}

while true; do
  update
  sleep 1m 
done
