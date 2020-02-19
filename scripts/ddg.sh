#!/bin/sh

if [ -z $1 ]; then
  url="ddg.gg"
else
  url="ddg.gg/?q=$(echo $* | tr ' ' '+')"
fi

lynx $url
