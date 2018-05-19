#!/bin/bash
#This script 'quotes.sh' is for show
#desktop notification of inspiring quotes in time interval
#07-04-2017 03:00PM
#Author:<H.R.Shadhin>root@hrshadhin.me
randomId=$(shuf -i 1-30 -n 1)
message=$(sqlite3 /home/hbot/bin/things.db  "select title,body from message where id=$randomId;")
IFS='|' read -r -a columns <<< $message
title=${columns[0]}
body=${columns[1]}
export DISPLAY=:0
/usr/bin/notify-send "$title" "$body" -t 5000
