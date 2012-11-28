Git Tips and Tricks
===================

Purpose of this repo is to collect all the git tips and tricks. You can suggest more if you know anything useful that can be listed here.

##Git Frequently used and useful command line codes

###git config: 
Set configuration values for user name,email etc
```git
git config --global user.name "Damodar Bashyal"
git config --global user.email "git@dltr.org"
```

###git clone: 
Makes a Git repository copy from a remote source. Also adds the original location as a remote so you can fetch from it again. If you have permissions you can push your changes to it too.
```git
git clone git@github.com:dbashyal/Git-tips-and-tricks.git master
```