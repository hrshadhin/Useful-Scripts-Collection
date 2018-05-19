#!/bin/bash
# Script to add a user to Linux system
if [ $(id -u) -eq 0 ]; then
	echo "Enter the file name,that have user infromation?" #input file should be regular file and contains username and password as following format "user1-123456"
# user1 is username and 123456 is password but '-' is the devider for username and password
	read file

	if [ -f "$file" ]
	then
	
	while read line; do 
    		username=$(echo $line | cut -f1 -d-)
		password=$(echo $line | cut -f2 -d-)
		if [ $username = $password ];
		then
			echo "Password for '$username' not provided!.Check the text fromate 'username-passwod' i.e 'june-4578'"
			exit 1
		else
			egrep "^$username" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				echo "user '$username' exists!"
				exit 1
			else
				pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
				useradd -m -p $pass $username
				[ $? -eq 0 ] && echo "'$username' User has been added to system!" || echo "Failed to add a user!"
			fi
		fi
		


	done < $file
	else
		echo "$file not found."
	fi

	
else
	echo "Only root may add a user to the system"
	exit 3
fi
