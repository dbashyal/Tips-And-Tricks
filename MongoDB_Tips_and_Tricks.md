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

* insert into db.collections
```php
$ use myproject # dbname
$ db.trademe_photos.insert({name: 'image1.jpg', data: 'data 1 goes here', md5: '1sjdhfjhjf'}) # one insert
$ db.trademe_photos.insert(
[
  {name: 'image2.jpg', data: 'data 2 goes here', md5: '2sjdhfjhjf'},
  {name: 'image3.jpg', data: 'data 3 goes here', md5: '3sjdhfjhjf'}
]
) # multiple inserts
```
* Select * from db.collections
```php
$ use myproject # dbname
$ db.trademe_photos.find() # trademe_photos is a collection inside db 'myproject'
$ db.trademe_photos.find().pretty() # prettify result
```
