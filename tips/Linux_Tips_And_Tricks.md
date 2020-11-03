# Linux Tips and Tricks

## Find and delete files

* `find . -name "*.bak" -type f -delete`
* `find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f`

## Find and delete folders

```bash
# Multiple ways to find and delete files
find . -name test -type d -print0|xargs -0 rm -rf --
find . -name test -type d -exec rm -rf {} \;
find . -name test -type d -exec rm -rf {} +
find . -name "*.log" -type f -delete
find . "test" -type d -exec rm -rf {} \;
find . -name test -exec rm -R "{}" \;

# find html files older than 7 days and delete them
/usr/bin/find ./ -mtime +7 -name "*.html" -exec rm -f {} \;
```

## chmod all files and directories recursively
```
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

## Truncate all files in a directory
```
for f in *; do >$f; done
```
