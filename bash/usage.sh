#!/bin/bash
#This script use for showing cpu,memory,swap memory and Disk usage on Linux sytem
prev_total=0
prev_idle=0
while true; do #loop start
cpu=`cat /proc/stat | head -n1 | sed 's/cpu  //'` #get cpu usage 
user=`echo $cpu | awk '{print $1}'` #get individual cpu usage by user,system,nice,idle etc
system=`echo $cpu | awk '{print $2}'`
nice=`echo $cpu | awk '{print $3}'`
idle=`echo $cpu | awk '{print $4}'`
wait=`echo $cpu | awk '{print $5}'`
irq=`echo $cpu | awk '{print $6}'`
srq=`echo $cpu | awk '{print $7}'`
zero=`echo $cpu | awk '{print $8}'`
total=$(($user+$system+$nice+$idle+$wait+$irq+$srq+$zero)) #totaling process status
diff_idle=$(($idle-$prev_idle)) #get IDLE status
diff_total=$(($total-$prev_total)) #get actual process
usage=$(($((1000*$(($diff_total-$diff_idle))/$diff_total+5))/10)) # calculate cpu usage in Percentage %

 FREEMEM=`free | awk '{ print $4 }' | sed -n 2p` #get free memory
CACHESIZE=`cat /proc/meminfo | grep Cached | awk '{print $2}' | sed -n 1p` #cache size of memory
TOTALMEM=`free | awk '{ print $2 }' | sed -n 2p` #total memory
MEMINUSE=$(($TOTALMEM-$CACHESIZE-$FREEMEM))  #get current usage of memory
tsaw=`free | awk '{ print $2 }' | sed -n 4p` #total swap memory
fsaw=`free | awk '{ print $4 }' | sed -n 4p` #free swap memroy

drootsize=`df -h /root | awk '{ print $2 }' | sed -n 2p` #get Disk usage by / (/root)
drootuse=`df -h /root | awk '{ print $3 }' | sed -n 2p` #free Disk of /root
dhomesize=`df -h /home | awk '{ print $2 }' | sed -n 2p` #get Disk usage by /home
dhomeuse=`df -h /home | awk '{ print $3 }' | sed -n 2p`  #free disk of /home

minussawp=$(($tsaw-$fsaw)) #calculation for unit conversion for MB
usemb=$(($MEMINUSE/1024))
totalmb=$(($TOTALMEM/1024))
useswap=$(($minussawp/1024)) 
totalswap=$(($tsaw/1024))
clear
#output section
echo "CPU usage: $usage%"
echo "RAM usage: $usemb/$totalmb MB"
echo "Swap usage: $useswap/$totalswap MB"
echo "  Disk Uses:\nRoot:$drootuse/$drootsize"
echo "Home:$dhomeuse/$dhomesize"
echo "\n  Press Ctrl+Z to back terminal promt"
sleep 1
done
