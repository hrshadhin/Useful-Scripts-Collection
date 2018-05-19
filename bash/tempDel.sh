#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	#This script will automatically delete temporary files
	rm -rf /tmp/* 
	rm -rf /var/tmp/*
	echo "Temporary files deleted succesfully.."

else
	echo "Only root may delete temporary files."
	exit 3
fi
