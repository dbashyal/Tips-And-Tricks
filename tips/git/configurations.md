# Git configurations

## Set configuration values for user name,email etc

```bash
$ git config --global user.name "Damodar Bashyal"
$ git config --global user.email "dbashyal@twitter.com"
```

## Git Save password / authentication
```bash
# for current repository
$ git config credential.helper store

# or, for global
git config --global credential.helper store

# or use cache, where timeout is in seconds
git config --global credential.helper 'cache --timeout=xx'

# open your git bash terminal and run
$ eval `ssh-agent -s`
$ ssh-add

# or, open your ~/.bash_profile (or, ~/.bashrc) and add those lines 
# and open new bash window, you will have to enter pass phrase only once.
eval `ssh-agent -s`
ssh-add

# for windows CMD, alternative method that worked is:
# Run: 
FOR /F "delims=;" %G IN ('ssh-agent') DO @Echo SET %G

# and save output to .bat and modify as below and run that bat file.
@echo off
set SSH_AUTH_SOCK=/tmp/ssh-840uhYyWibks/agent.11372
set SSH_AGENT_PID=4820
ssh-add

# or just download sshlogin.bat file and run it. check root of this repo for the file.

# UPDATE :: found a bat file in latest git that you can run
# C:\Program Files\Git\cmd\start-ssh-agent.bat
start-ssh-agent
```

## git merge conflicts with meld
```bash
$ git config --global merge.tool meld
$ git config --global mergetool.meld.path "C:\Program Files (x86)\Meld\Meld.exe"
```

## git ignore file mode
This will ignore files that don't have content change.
```bash
$ git config core.filemode false
```
If that doesn't work, you can run below command if you see files modified but with not content difference.
```bash
git add -uv
```

## Config to get short commit hash

```bash
$ git config --global log.abbrevcommit yes
$ git config --global core.abbrev 8

# now run below to get short hash
$ git log --pretty=oneline
```

[Back to Index](https://github.com/dbashyal/Tips-And-Tricks/blob/master/tips/Git_Tips_And_Tricks.md)
