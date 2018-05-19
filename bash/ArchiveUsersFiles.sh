#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	echo "Enter username to archiving its files:"
	read user
	if [ -z "$user" ]
	then
		echo "Provide a username first."
		exit 1

	else
		egrep "^$user" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				
				rm -rf /home/$user/Archive/
				sleep 1
				mkdir -p /home/$user/Archive/temp
				docFile=/home/$user/Documents/
				pics=/home/$user/Pictures/
				
				cp -r $docFile /home/$user/Archive/temp
				cp -r $pics /home/$user/Archive/temp
				
				cd /home/$user/Archive/temp
				for FILE in `ls`;do
					zip -r final_`date +%Y%m%d`.zip $FILE
				done
				sleep 3
				cp final_`date +%Y%m%d`.zip ../

				cd ..

				rm -rf /home/$user/Archive/temp
				echo "\nYour backup file saved in /home/$user/Archive/final_`date +%Y%m%d`.zip\n"
			else
				echo "'$user' user not exists in the system!"
				exit 2
			fi

	fi
else
	echo "Only root may delete users to the system"
	exit 3
fi



