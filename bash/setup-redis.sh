#!/bin/bash
#title           :setup-redis.sh
#description     :Setup redis server & configure on debian system
#author          :H.R. Shadhin <dev@hrshadhin.me>
#date            :2021-06-17
#version         :1.0
#usage           :bash setup-redis.sh
#bash_version    :4.4.20(1)-release
#==============================================================

# variables
HAVE_UFW=false
INTERNAL_IP_ADDRESS="127.0.0.1" #192.168.10.15
SET_AUTH_PASS=false
AUTH_PASSWORD="mysupersecret" # $(openssl rand 60 | openssl base64 -A)
AUTH_ARGS=""

DIABLE_DANGEROUS_COMMANDS=false
read -r -d '' DANGEROUS_COMMANDS << EndOfText
rename-command FLUSHALL "DELITALL"
rename-command CONFIG "MYSERVERCONF"
rename-command SHUTDOWN "MYSERVEROFF"
rename-command DEBUG ""
EndOfText

# update system
sudo apt-get update
sudo apt-get upgrade

# install redis
sudo apt-get install -y --no-install-recommends redis-server

# restart, enable to start on boot
sudo systemctl restart redis-server.service
sudo systemctl status redis-server.service
sudo systemctl enable redis-server.service

# testing
echo "checking is it running..."
sudo netstat -lnp | grep redis
redis-cli ping

# securing 
# - never expose redis to public internet
# - listen only on loopback 127.0.0.1
# - expose inside private network with password if needed

sudo sed -i "s/^bind 127.0.0.1.*/bind $INTERNAL_IP_ADDRESS/" /etc/redis/redis.conf

if $SET_AUTH_PASS ; then
    sudo sed -i "s|# requirepass.*|requirepass $AUTH_PASSWORD|" /etc/redis/redis.conf
    AUTH_ARGS="-a $AUTH_PASSWORD"
fi

if $DIABLE_DANGEROUS_COMMANDS ; then
    echo "$DANGEROUS_COMMANDS" | sudo tee -a /etc/redis/redis.conf
fi

sudo systemctl restart redis-server.service

# testing
echo "checking is it running..."
sudo netstat -lnp | grep redis

echo "testing basic commands..."
redis-cli -h $INTERNAL_IP_ADDRESS -p 6379 $AUTH_ARGS ping
redis-cli -h $INTERNAL_IP_ADDRESS -p 6379 $AUTH_ARGS set keytest "set key is ok"
redis-cli -h $INTERNAL_IP_ADDRESS -p 6379 $AUTH_ARGS get keytest

if $DIABLE_DANGEROUS_COMMANDS ; then
	echo "testing custom commands..."
    redis-cli -h $INTERNAL_IP_ADDRESS -p 6379 $AUTH_ARGS FLUSHALL
    redis-cli -h $INTERNAL_IP_ADDRESS -p 6379 $AUTH_ARGS DELITALL
fi

# enable firewall
if $HAVE_UFW ; then
	sudo ufw allow 6379
	sudo ufw status
fi

