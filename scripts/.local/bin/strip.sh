#!/bin/sh

curl $1 | sed 's/<[^>]*>//g; s/&amp;/\&/g; s/&quot;/"/g; s/&#39;//g'
