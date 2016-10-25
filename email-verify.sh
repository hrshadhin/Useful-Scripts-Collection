#!/bin/bash
#:
#: email-verify.sh
#:
#: Date: 23/10/2016 11:40:28 AM UTC
#: Author: H.R.Shadhin <root@hrshadhin.me>
#: Discription: Verify (or) Validate the e-Mail Adresses.
#:
#: Copyright (c) 2016 Under GPL-3.0 License.
#:
#: Usage: ./email-verify.sh hrshadhin.i386@gmail.com
#:
#:get argument
emailAddr=$1
#:extract host from email address
eHost="$(echo $emailAddr | awk -F @ {'print $2'})"
smHost="$(nslookup -q=mx $eHost | grep "exchanger" |head -n1 | awk '{print $6 }'| sed 's/\.$//')"
cat << __EOF > e-veri1
#!/usr/bin/expect
#:If it all goes pear shaped the script will timeout after 20 seconds.
set timeout 20
set vsmhost "$smHost"
set vemailaddr "$emailAddr"
#:This spawns the telnet program and connects it to the variable name
spawn telnet \$vsmhost 25
#:The script expects ESMTP
expect "ESMTP"
#:The script sends helo to domain
send "helo example.com\r"
#:The script expects OK
expect "250"
#:The script sends mail from
send "mail from:<hrshadhin@example.com>\r"
expect "250"
#:The script sends mail to
send "rcpt to:<\$vemailaddr>\r"
#:The script expects OK
expect "250"
#:The script send exit
send "quit\r"
expect eof
__EOF
#:extract output to file
expect e-veri1 > result.txt
#:check result for invalid email
grep 550 result.txt >/dev/null
if [ "$?" -eq 0 ]
	then
		echo 'Bad'
	else
		echo 'Good'
fi
#:end script
