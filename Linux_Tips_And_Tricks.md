# Linux Tips and Tricks

## Find and delete files

* `find . -name "*.bak" -type f -delete`
* `find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f`
