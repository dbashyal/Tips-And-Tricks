# MySQL Tips and Tricks

### Convert mysql timezone of a field while running query
```sql
SELECT * FROM sales_creditmemo where CONVERT_TZ(created_at  , 'UTC', 'Australia/Sydney') >= '2021-08-02'
```

#### clean the disc cache in the terminal

`sync && echo 3 | sudo tee /proc/sys/vm/drop_caches`

#### After disc cache clean, reset mysql query cache

`RESET QUERY CACHE;`

### You can also, flush query cache, (doesn't remove queries but removes data)

`FLUSH QUERY CACHE;`


# Clean install that worked for me in new docker
```php
sudo apt-get update
sudo apt-get remove --purge mysql\*
sudo apt-get install mysql-server mysql-client
// stop service and kill any ghost processes
/etc/init.d/mysql stop
ps -Af | grep mysql
kill [the id]

// now start again
/etc/init.d/mysql restart
mysql_install_db
/usr/bin/mysql_secure_installation
```

# Run mysql query directly from linux command line
```bash
$ mysql -u root -p -e "show databases;"
$ mysql -u root -p -e "use codefight; select * from config;" | > config.tsv

# replace tab with comma
$ sed "s/\t/,/g" config.tsv > config.csv

# if data already contains comma, do this instead
$ sed "s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g" config.tsv > config.csv
```

# Dump selected tables only
```bash
mysqldump -u username -p db_name table1_name table2_name table3_name > dump.sql

# or for remote
mysqldump -h [RDS endpoint/IP] -u username -p db_name table1_name table2_name table3_name > dump.sql

# or to dump all tables with like, find all table names first
mysql -N information_schema -e "select table_name from tables where table_schema = 'databasename' and table_name like 'bak_%'" > tables.txt
# then combine all table names into 1 line and run below
mysqldump dbname `cat tables.txt` > dump_file.sql
```
