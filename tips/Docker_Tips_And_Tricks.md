# Docker Tips and Tricks
##### I have just started to learn/use docker. I am archiving some useful commands here as I find one that I'll need when I forget and need to google again.

* If you get error `An error occurred trying to connect: Get http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/containers/json: open //./pipe/docker_engine: The system cannot find the file specified.` make sure docker for windows is running and check 'Docker for windows services' in windows services. 

> Just noticed that if you setup docker using windows CMD, you will get that error in cygwin bash shell and vice-versa, so looks like we need to stick with one and always use same one. So may be better to use the docker cli, that comes with the install, so paths are not messed up?

On windows 7 to fix above error: 
```php
// try if it works:
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i

// if not, delete default machine (or rename it) with script or manually
docker-machine rm default

// delete C:\Users\DBashyal\.docker\machine\machines\default
// recreate default vm
docker-machine create --driver virtualbox default

// once done, run:
docker-machine env default

// follow instruction like running this command
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i

// you should have a working docker now
```

## attach local drive to container using (-v localfolder:remotefolder)
```php
// cd to your dockerfile and build image
docker build -t dbashyal/codefight .

// create container from above image
docker run -d -p 80:80 -p 3306:3306 -v C:\Users\dbashyal\docker\codefight:/app --name codefight dbashyal/codefight

// then access the container running
docker exec -it codefight /bin/bash

// check if folder attached or not
$ ls -la /data
```

## SSH
```php
// run: docker-machine ssh <your_environment>
// default environment is 'default'
docker-machine ssh

// or, using docker
// docker exec -i -t  <container ID or NAME> /bin/bash
// don't use run, as it will create new container
docker exec -i -t  codefight /bin/bash

// or in PuTTy
IP: 192.168.99.100
user: docker
password: tcuser

// Once logged in, to switch to root user, just run
sudo -i
//i.e.: docker@default:~$ sudo -i
```

## force remove all images
```php
// windows
FOR /f "tokens=*" %i IN ('docker images -a -q') DO docker rmi -f %i

// linux
docker rmi -f $(docker images -a -q)
```

## force (stop and) remove all containers
```php
// windows 
FOR /f "tokens=*" %i IN ('docker ps -a -q') DO docker rm -f %i

// linux or bash/power shell
docker rm -f $(docker ps -a -q)
```

## Unable to share project folder with docker because of firewall (avast on my case)
1. Go to Hyper-V Manager -> Virtual Switch Manager -> DockerNAT -> Connection Type: change from internal to private, apply, change back to internal, apply
2. Restart MobyLinuxVM
3. Restart Docker
4. Set Docker network profile to 'Private' as described above
5. Reset file sharing on DockerNAT connection as described above
6. Go to Docker -> Settings -> Shared Drives and share C:


