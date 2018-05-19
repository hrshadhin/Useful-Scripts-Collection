#!/bin/bash
#this script backup linux system important files
if [ $(id -u) -eq 0 ]; then
	echo "System importants files are beging backup..........."
	sleep 1
	mkdir /home/Backup
	
	
	
	cp /etc/crontab /home/Backup
	cp /etc/fstab /home/Backup
	cp /etc/group /home/Backup
	cp /etc/hosts /home/Backup
	cp /etc/hosts.allow /home/Backup
	cp /etc/hosts.deny /home/Backup
	cp /etc/issue /home/Backup
	cp /etc/motd /home/Backup
	cp /etc/passwd /home/Backup
	cp /etc/shadow /home/Backup
	cp /etc/profile /home/Backup
	cp /etc/resolv.conf /home/Backup
	cp /etc/securetty /home/Backup
	cp /etc/meminfo /home/Backup
	
	cd /home/Backup	

	for FILE in `ls`;do
		zip -r systemIFB_`date +%Y%m%d`.zip $FILE
	done
	sleep 3
	cp systemIFB_`date +%Y%m%d`.zip ../

	cd ..

	rm -rf /home/Backup
	echo "\nYour backup file saved in /home/systemIFB_`date +%Y%m%d`.zip\n"

	
else
	echo "Only root may delete users to the system"
	exit 1
fi

