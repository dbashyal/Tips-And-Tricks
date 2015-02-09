# Linux Tips and Tricks

## Find and delete files

* `find . -name "*.bak" -type f -delete`
* `find . -name "*.bak" -type f -print0 | xargs -0 /bin/rm -f`

## Find and delete folders

* `find . -name test -type d -print0|xargs -0 rm -r --`
* `find . -name test -type d -exec rm -r {} \;`
* `find . -name test -type d -exec rm -r {} +`
* `find . -name "test" -type d -delete`
* `find . "test" -type d -exec rm -rf {} \;`
* `find . -name test -exec rm -R "{}" \;`
