#!/bin/bash
#This script 'disConnectMe.sh' is for shutdown
#-My Laptop and before that its shutdown my router
#16-03-2016 03:05Am
#Author:<H.R.Shadhin>root@hrshadhin.me

echo 'Going to login to router and shutdown it....'
ssh root@192.168.1.1 'poweroff'
echo 'Router is powered off now'
echo 'Going to shutdown laptop....Come back soon....'
sudo poweroff
