#!/bin/bash 

###################################################################
#Script Name	: mysql_db_backup_auto.sh                                                                                              
#Description	: This script the dump the desire database from mysql
#                 and upload it to google drive specific folder.
#Args           :
#Date           : 20/03/2018 17:30:20                                                                                           
#Author         : H.R. Shadhin                                                
#Email          : dev@hrshadhin.me                                           
###################################################################

# Bail out if there are any errors.
set -e

#server name for dump file prefix
servername="myserver"

# The name of the database we're going to backup.
dbname="my_db"

# The Google Drive folder ID where database exports will be uploaded to
gdrivefolderid="1D_1KQg6wURzd"

# Number of days we want to retain local backups for
retentiondays=1

# Date format for dates appended to database export files 
dateformat="%Y-%m-%d_%H:%M:%S"

# The local directory where we'll be storing database exports
dumpdir="/var/spool/db-dump"

#skips tables name
EXCLUDED_TABLES=(
sym_channel
sym_conflict
sym_context
)

ignored_table_string=''
for TABLE in "${EXCLUDED_TABLES[@]}"
do :
   ignored_table_string+=" --ignore-table=${dbname}.${TABLE}"
done


# Options to pass to the mysqldump command
mysqlopts="--user=root --password=123456 --no-create-info --skip-triggers"

# Make sure the directory exists
mkdir -p "$dumpdir"

# Delete local export files older than our retentiondays value
find "$dumpdir" -type f -name "*.sql.gz" -mtime +"$retentiondays" -print -exec rm "{}" \;

# Zip up any existing export files
#find "$dumpdir" -type f -name "*.sql" -print -exec gzip "{}" \;

# Perform a backup of the live database
file="$servername-$dbname-$(date +$dateformat).sql.gz"
path="$dumpdir/$file"

mysqldump $mysqlopts "$dbname" $ignored_table_string | gzip > "$path"

# Upload the newly created file to Google Drive
/usr/local/bin/gdrive upload --parent "$gdrivefolderid" "$path"
