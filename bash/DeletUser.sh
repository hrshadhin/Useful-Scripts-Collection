#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	echo "Enter username to delete:"
	read user
	if [ -z "$user" ]
	then
		echo "Provide a username first."
		exit 1

	else
		egrep "^$user" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				
				
				userdel $user
				rm -rf /home/$user
				echo "user '$user' deleted successfully."
			else
				echo "'$user' user not exists in the system!"
				exit 2
			fi

	fi
else
	echo "Only root may delete users to the system"
	exit 3
fi
