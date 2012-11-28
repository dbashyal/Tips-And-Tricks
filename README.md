Git Tips and Tricks
===================

Purpose of this repo is to collect all the git tips and tricks. You can suggest more if you know anything useful that can be listed here.

##Git Frequently used and useful command line codes

###git config: 
Set configuration values for user name,email etc
```
git config --global user.name "Damodar Bashyal"
git config --global user.email "git@dltr.org"
```

###git clone: 
Makes a Git repository copy from a remote source. Also adds the original location as a remote so you can fetch from it again. If you have permissions you can push your changes to it too.
```
git clone git@github.com:dbashyal/Git-tips-and-tricks.git master
```

###git commit:
Takes all of the changes written in the index, creates a new commit object pointing to it and sets the branch to point to that new commit.
```
git commit -m "added commit command on readme file"
// or to add and commit at once
git commit -a -m "added commit command on readme file"
```

###git status:
Shows status of files in the index versus the working directory. It will list out files that are untracked (only in your working directory), modified (tracked but not yet updated in your index), and staged (added to your index and ready for committing).
```
git status
```
