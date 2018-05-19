#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	echo "Enter username to update password:"
	read user
	if [ -z "$user" ]
	then
		echo "Provide a username first."
		exit 1

	else
		egrep "^$user" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				
				
				passwd $user
			else
				echo "'$user' user not exists in the system!"
				exit 2
			fi

	fi
else
	echo "Only root may update password of users to the system"
	exit 3
fi
