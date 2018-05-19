#!/bin/bash
echo "Enter the directory location:"
read mydir
totalFiles=$(find $mydir -type f | wc -l) #get total files

tsize=$(du -bs $mydir | awk '{print $1}') #get total size

SubDir=$(ls -l $mydir |grep ^d|wc -l) #get subdirectories

totalsize=$(echo "scale=5; ($tsize/1024)/1024" |bc ) #convert to MB
 
echo "Total SubDirectories= $SubDir"
echo "Total Files= $totalFiles"
echo "Total Size= $totalsize MB"

