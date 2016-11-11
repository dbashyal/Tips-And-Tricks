Node Tips and Tricks
====================

If you get `KILLED` when running node script, kill all node processes and restart.
#####windows
```
// find and kill only selected
C:\>netstat -ano | find "LISTENING" | find "8080"
taskkill /pid 14828

// kill all
taskkill /f /im node.exe
```
