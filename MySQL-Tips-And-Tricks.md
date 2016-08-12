## delete cache
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
