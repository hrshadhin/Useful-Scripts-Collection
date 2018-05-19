#!/bin/bash
################################################################################
# Script for Uninstallation: ODOO 8 ERP on Ubuntu 14.04 LTS
# Author: <H.R.Shadhin>root@hrshadhin.me,2016
#-------------------------------------------------------------------------------
#  
# This script will remove ODOO Server on
# Ubuntu 14.04 Server
#-------------------------------------------------------------------------------
# USAGE:
#
# odoo-uninstaller
#
# EXAMPLE:
# ./odoo-uninstaller 
#
################################################################################

if [ "$(id -u)" != "0" ]; then
	echo "Sorry man, you are not Mr.Root !"
	exit 1
fi 
service odoo-server stop
#Remove config file(s)
rm -f /etc/odoo-server.conf
rm -f /etc/odoo.conf
#Remove application code
rm -R /opt/odoo
#Remove startup process
update-rc.d -f odoo-server remove
rm -f /etc/init.d/odoo-server
#Remove logs
rm -R /var/log/odoo
#Remove databases
sudo service postgresql stop
apt-get remove postgresql -y
apt-get --purge remove postgresql\* -y
rm -r -f /etc/postgresql/
rm -r -f /etc/postgresql-common/
rm -r -f /var/lib/postgresql/

#Remove wkhtmltox Reporting Tool
apt-get remove wkhtmltox

#Delete users and groups
userdel odoo
userdel -r postgres
groupdel postgres
