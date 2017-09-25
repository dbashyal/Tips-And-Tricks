Node Tips and Tricks
====================

If you get `KILLED` when running node script, kill all node processes and restart.
## Windows
```
// find and kill only selected
C:\>netstat -ano | find "LISTENING" | find "8080"
taskkill /pid 14828

// kill all
taskkill /f /im node.exe
```

## Linux
```
// find and kill only selected
netstat -nlp | grep :8080
kill -9 1073

// or, kill all
killall node
```

## Centos 7 npm install throws error:
```
// to fix pass param --no-bin-links with install command as below
// install newlic and save to package.json
npm install newrelic --save --no-bin-links

// install modules from package.json
npm install --no-bin-links
```

---
### Resources
* [stop all instances of node.js server](http://stackoverflow.com/a/14790921/534525)
