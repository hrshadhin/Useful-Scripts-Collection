#!/bin/bash

#this script use to alter table columns in a specific mysql database
#its only alter columns that have varchar(1) ,varchar(2) and varchar(3) datatype
#And change those columns to varchar(15)


#db settings and temp variable settings
user="root" #mysql user
pwd="toor" #mysql password
database="testRIng" #database to alert tables

#these two are temp variable for this script
fileName="wantedTablesAndColumns.txt"
tempDB="wanted.db"

command="select TABLE_NAME,COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where COLUMN_TYPE IN ('varchar(1)','varchar(2)','varchar(3)') AND TABLE_SCHEMA = '$database' order by TABLE_NAME" 

#execute myssql queries
output=$( mysql -u $user -p$pwd << EOF 
$command
EOF
)

#save output to file
echo "$output" >> $fileName
#create a sqlite db
sqlite3 $tempDB  "create table modTables (id INTEGER PRIMARY KEY,tableName TEXT,columnName TEXT);"

#read file and insert data to sqlite db
{
read
while read -r table column
do
 sqlite3 $tempDB  "insert into modTables (tableName,columnName) values ('$table','$column');"
done
} < $fileName

#select tables from sqlitedb
echo "Below tables can be alter!"
sqlite3 wanted.db  "select distinct tableName from modTables;"
echo ""
echo "type tables name with a space to alter:[table1 table2 table55]"

#read user input
read -a desireTables
#set query variable
mysqlquery="USE $database;"
#build alter sql query accroding to user seleted tables
for table in ${desireTables[@]}
do
    results=$(sqlite3 wanted.db  "select columnName from modTables where tableName='$table';")
    read -r -a columns <<< $results    
    for column in ${columns[@]}
    do
        mysqlquery="$mysqlquery ALTER TABLE $table MODIFY COLUMN $column VARCHAR(15);"
    done

done

#execute alter table mysql query
output=$( mysql -u $user -p$pwd << EOF 
$mysqlquery
EOF
)
echo "check output about error"
rm $fileName
rm $tempDB

