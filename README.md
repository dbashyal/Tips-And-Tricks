Git Tips and Tricks
===================

Purpose of this repo is to collect all the git tips and tricks. You can suggest more if you know anything useful that can be listed here.

##Git Frequently used and useful command line codes

###git config: 
Set configuration values for user name,email etc
```
$ git config --global user.name "Damodar Bashyal"
$ git config --global user.email "git@dltr.org"
```

###git clone: 
Makes a Git repository copy from a remote source. Also adds the original location as a remote so you can fetch from it again. If you have permissions you can push your changes to it too.
```
$ git clone git@github.com:dbashyal/Git-tips-and-tricks.git master
```

###git commit:
Takes all of the changes written in the index, creates a new commit object pointing to it and sets the branch to point to that new commit.
```
$ git commit -m "added commit command on readme file"

// or to add and commit at once
$ git commit -a -m "added commit command on readme file"
```

###git amend/edit commit:
Edit/Amend last git commit message
```
$ git commit --amend -m "New commit message"
```

###git ignore file mode
This will ignore files that don't have content change.
```
$ git config core.filemode false
```

###git status:
Shows status of files in the index versus the working directory. It will list out files that are untracked (only in your working directory), modified (tracked but not yet updated in your index), and staged (added to your index and ready for committing).
```
$ git status
```

###git branch:
Lists existing branches, including remote branches if '-a' is provided. Creates a new branch if a branch name is provided.
```
$ git branch
$ git branch -a

// create branch
$ git branch <name_of_your_new_branch>

// push to remote
$ git push origin <name_of_your_new_branch>

// delete local branch
$ git branch -D <name_of_your_branch>

// delete remote branch
$ git push origin :<name_of_your_branch>
```

###git prune:
This will delete all remote branches that do not exist locally. To delete selected branch from remote use above code.
```
$ git push --prune origin

// effectively make the remote look like the local copy of the repo (local heads, remotes and tags are mirrored on remote)
$ git push --mirror

// As of Git v1.7.0, you can delete a remote branch using
$ git push origin --delete feature/scroll

// you can also delete remote branch like this
$ git push origin :feature/scroll
```

###Find list of conflicting files
```
git diff --name-only --diff-filter=U
```

###Git tag
```
// Create new tag
git tag -a 1.3.4 -m 'Tagged as version 1.3.4'

// Push new tag to repository
git push origin 1.3.4

// Delete tag
git tag -d 1.3.4
git push origin :refs/tags/1.3.4
```

##delete
###Git Delete Last Commit: not pushed
```
git reset --soft HEAD~1
// --soft option will delete the commit but it will leave all your changed files "Changes to be committed", as git status would put it.
```

###Git restore deleted file which is yet to commit
```
git checkout HEAD deleted-file.php
```

###Git Save password / authentication
```
// store
git config credential.helper store

// unset
// current repo
git config credential.helper store
// global
git config --global credential.helper store

// or use cache, where timeout is in seconds
git config --global credential.helper 'cache --timeout=xx'
```


# resources
1. http://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-in-github
2. http://www.siteground.com/tutorials/git/commands.htm
3. http://stackoverflow.com/a/12240995/534525 (save pwd)
