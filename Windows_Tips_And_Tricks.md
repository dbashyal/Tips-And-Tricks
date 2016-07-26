# Windows Tips and Tricks
Some of the frequently used commands with tips and tricks.

## Find and kill a process that's using a port e.g. 3001
```php
> netstat -o -n -a | findstr 0.0:3001
// TCP    0.0.0.0:3001      0.0.0.0:0              LISTENING       101101

// kill that process
> taskkill /F /PID 101101
```
