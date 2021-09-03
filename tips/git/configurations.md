# Git configurations

## Set configuration values for user name,email etc

```bash
$ git config --global user.name "Damodar Bashyal"
$ git config --global user.email "dbashyal@twitter.com"
```

## Config to get short commit hash

```bash
git config --global log.abbrevcommit yes
git config --global core.abbrev 8

# now run below to get short hash
git log --pretty=oneline
```
