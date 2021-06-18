#!/bin/bash
#title           :setup-ssh.sh
#description     :Setup open ssh server & securely configure on debian system
#author          :H.R. Shadhin <dev@hrshadhin.me>
#date            :2021-06-19
#version         :1.0
#usage           :bash setup-ssh.sh
#bash_version    :4.4.20(1)-release
#==============================================================

# variables
ALLOWED_FROM="192.168.3.0/24"
SSH_PORT=2022
HAVE_UFW=true

# update system
sudo apt-get update
sudo apt-get upgrade

# install ssh
sudo apt-get install -y --no-install-recommends openssh-server

# now configure sshd_config
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sudo tee /etc/ssh/sshd_config > /dev/null <<EOT
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# What ports, IPs and protocols we listen for
Port ${SSH_PORT}
# Use these options to restrict which interfaces/protocols sshd will bind to
#ListenAddress ::
#ListenAddress 0.0.0.0
Protocol 2

# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key


# Logging | to log failed login attempts change the value from INFO to VERBOSE.
SyslogFacility AUTH
LogLevel INFO

# Authentication:
LoginGraceTime 2m
PermitRootLogin no
StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

PubkeyAuthentication yes
# Expect .ssh/authorized_keys2 to be disregarded by default in future.
#AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes

# To enable empty passwords, change to yes (NOT RECOMMENDED)
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Change to no to disable tunnelled clear text passwords
PasswordAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding no
X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
PrintMotd no
PrintLastLog yes
TCPKeepAlive yes
#UseLogin no
#PermitUserEnvironment no
#Compression delayed
ClientAliveInterval 300
ClientAliveCountMax 0
#UseDNS no
#PidFile /var/run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

#Banner /etc/issue.net

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem sftp	/usr/lib/openssh/sftp-server

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes
EOT

# now setup firewall
if $HAVE_UFW ; then
    sudo ufw allow from $ALLOWED_FROM  to any port $SSH_PORT
    sudo ufw status verbose
else
    sudo iptables -A INPUT -p tcp -m state --state NEW --source $ALLOWED_FROM --dport $SSH_PORT -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport $SSH_PORT -j DROP
fi

# restart ssh
sudo systemctl restart ssh.service

echo "Done!"