#!/bin/bash
#:
#: veldev.sh
#:
#: Date: 16/11/2016 17:55:00 UTC
#: Author: H.R.Shadhin <root@hrshadhin.me>
#: Discription: Automate nginx vhost for laravel project. Valet like .dev domain
#:
#: Copyright (c) 2016 Under GPL-3.0 License.
#:
#: Installation & Usage:
#: ---------------------
#: add this "address=/.dev/127.0.0.1" with out quotes at end of
#: this "/etc/dnsmasq.conf" file and run "sudo service dnsmasq restart"
#: Now you can place the script anywhere OR add it in environment path.
#: Then go to your project root and run the script with domain name
#: with out '.dev'
#:
#: Usage: ./veldev.sh <your-desired-url>
#

# Functions
ok() { echo -e '\e[32m'$1'\e[m'; } # Green
die() { echo -e '\e[1;31m'$1'\e[m'; exit 1; }

# Variables
NGINX_AVAILABLE_VHOSTS='/etc/nginx/sites-available/'
NGINX_ENABLED_VHOSTS='/etc/nginx/sites-enabled/'
WEB_ROOT="$(pwd)/public"

# Sanity check
[ $(id -g) != "0" ] && die "Script must be run as root."
[ $# != "1" ] && die "No domain name given\nUsage: laradev <your-desired-url>"

domain="$1.dev"
block="$NGINX_AVAILABLE_VHOSTS$domain"
sudo tee $block > /dev/null <<EOF
server {
        listen 80;

        root $WEB_ROOT;
        index index.php;
        server_name $domain www.$domain;
	location / {
        	try_files \$uri \$uri/ /index.php?\$query_string;
	 }

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
        	fastcgi_pass unix:/run/php/php7.0-fpm.sock;
	}
}
EOF

sudo ln -s $block $NGINX_ENABLED_VHOSTS
#check any error happened
if [ "$?" != "0" ]; then
	die "[ERROR] check whats happened!"
fi

sudo nginx -t && sudo service nginx reload

ok "$domain added to nginx vhost\nWeb Root is $WEB_ROOT"
