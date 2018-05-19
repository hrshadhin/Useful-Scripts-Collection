#!/bin/bash
# findPi:
#       Find all Pi's on the LAN
#	Author: H.R.Shadhin

fping -a -r1 -g 10.10.10.100/8  &> /dev/null
arp -n | fgrep " b8:27:eb"
