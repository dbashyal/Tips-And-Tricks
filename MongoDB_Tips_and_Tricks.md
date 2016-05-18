# Mongo DB
I am a first time user of mongo db, so I am going to note down all commands I'll need to use again and again. You can start mondo admin on shell as:

```php
$ mongo admin

# show mostly used mongo commands using help
$ help
```

* Show Databases

```php
# Print a list of all databases on the server.
$ show dbs
```

* Use Database

```php
# Switch current database to <db>. The mongo shell variable db is set to the current database.
$ use <dbname>
```

* Show Collections / Tables

```php
# Print a list of all collections for current database
$ show collections
// or
$ show tables
```
