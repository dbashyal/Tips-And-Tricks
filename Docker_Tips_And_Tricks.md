# Just started to learn docker say archiving some commands here

1> force remove all images
```php
// windows
FOR /f "tokens=*" %i IN ('docker images -a -q') DO docker rmi -f %i

// linux
docker rmi -f $(docker images -a -q)
```

2> force remove all containers
```php
// windows 
FOR /f "tokens=*" %i IN ('docker ps -a -q') DO docker rm -f %i

// linux
docker rm -f $(docker ps -a -q)
```

3> If you get error `An error occurred trying to connect: Get http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/containers/json: open //./pipe/docker_engine: The system cannot find the file specified.` make sure docker for windows is running and check 'Docker for windows services' in windows services.

4> attach local drive to container using (-v localfolder:remotefolder)
```php
docker run -d -p 80:80 -p 3306:3306 -v c:/_projects:/data --name codefight codefight/cms

// then access the container running
docker exec -it codefight /bin/bash

// check if folder attached or not
$ ls -la /data
```
