#!/bin/sh

location=~/.todo

if [ ! -f ${location} ]; then
  touch ${location}
fi

selected=$(cat ${location} | dmenu -l 10)

if grep "^${selected}$" ${location}; then
  inverted="$(grep -v "^${selected}$" ${location})"
  echo "${inverted}" | sed '/^\s*$/d' > ${location}
  echo "-- removed --"
else
  echo "${selected}" | sed '/^\s*$/d' >> ${location}
  echo "-- created --"
fi

