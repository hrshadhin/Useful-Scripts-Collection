# docker tricks
## composer update kill for memory
`sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024`
`sudo /sbin/mkswap /var/swap.1`
`sudo chmod 600 /var/swap.1`
`sudo /sbin/swapon /var/swap.1`

## mariadb directory permission issue
`sudo chown -R 1001:1001 /var/www/html/dockers/flyregent/mariadb/mariadb/`
then 
`chmod -R 777 /var/www/html/dockers/flyregent/mariadb/`
