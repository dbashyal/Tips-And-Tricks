# Linux Tips and Tricks

## Find and delete files

```bash
find . -name "*.bak" -type f -delete
find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f

# find html files older than 7 days and delete them
/usr/bin/find ./ -mtime +7 -name "*.html" -exec rm -f {} \;
```

## Find and delete folders

```bash
# Multiple ways to find and delete files
find . -name test -type d -print0|xargs -0 rm -rf --
find . -name test -type d -exec rm -rf {} \;
find . -name test -type d -exec rm -rf {} +
find . "test" -type d -exec rm -rf {} \;
find . -name test -exec rm -R "{}" \;
```

## chmod all files and directories recursively
```bash
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

## Truncate all files in a directory
```bash
for f in *; do >$f; done
```

## Grep commands
```bash
grep -RoH "80" ./
grep -Rie "80" ./
grep -Rie "listen.*80" ./
```
