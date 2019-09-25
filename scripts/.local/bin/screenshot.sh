#!/bin/sh

save_to=~/pictures/screenshots
template='%Y-%m-%d_%s_$wx$h.jpg'

if [ ! -d $save_to ]; then
  mkdir -p $save_to
fi

if [ -z $1 ]; then
  scrot -q 100 "$template" -e "mv \$f $save_to"
elif [ $1 = "w" ]; then
  scrot -u -q 100 "$template" -e "mv \$f $save_to"
elif [ $1 = "s" ]; then
  scrot -s -q 100 "$template" -e "mv \$f $save_to"
fi
