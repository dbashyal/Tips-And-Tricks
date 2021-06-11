#!/bin/bash
if [ `whoami` != 'damu' ]
  then
    echo ""
    echo "You must be user 'damu' to run this."
        echo ""
    exit
fi

sql_dump_date=`date +"%s"`
sql_dump_name=damu-db-b2b-${sql_dump_date}.sql

mysqldump --hex-blob --skip-triggers --set-gtid-purged=OFF --column-statistics=0 damu_b2b > /home/damu/backups/${sql_dump_name}

sed -i 's/DEFINER=[^*]*\*/\*/g' /home/damu/backups/${sql_dump_name}

tar -cvzf /home/damu/backups/${sql_dump_name}.tar.gz /home/damu/backups/${sql_dump_name}
