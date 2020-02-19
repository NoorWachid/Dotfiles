#!/bin/sh

wpr_loc=~/pic/wp

while true; do
  total=$(find $wpr_loc -type f | wc -l)
  timestamp=$(date "+%s")
  index=$(( ($timestamp % $total) + 1 ))
  picked=$(find $wpr_loc -type f | head -n $index | tail -n 1)

  feh --bg-fill $picked
  sleep 30m
done
