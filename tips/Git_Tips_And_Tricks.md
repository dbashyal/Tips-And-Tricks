Git Tips and Tricks
===================

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=dbashyal&url=https://github.com/dbashyal&title=Github Repos&language=&tags=github&category=software)

Purpose of this repo is to collect all the git tips and tricks. You can suggest more if you know anything useful that can be listed here.

##Git Frequently used and useful command line codes

###git config: 
Set configuration values for user name,email etc
```php
$ git config --global user.name "Damodar Bashyal"
$ git config --global user.email "git@dltr.org"
```

###git clone: 
Makes a Git repository copy from a remote source. Also adds the original location as a remote so you can fetch from it again. If you have permissions you can push your changes to it too.
```php
$ git clone git@github.com:dbashyal/Git-tips-and-tricks.git master
```

###git commit:
Takes all of the changes written in the index, creates a new commit object pointing to it and sets the branch to point to that new commit.
```php
$ git commit -m "added commit command on readme file"

// or to add and commit at once
$ git commit -a -m "added commit command on readme file"
```

###git amend/edit commit:
Edit/Amend last git commit message
```php
$ git commit --amend -m "New commit message"
```

###git ignore file mode
This will ignore files that don't have content change.
```php
$ git config core.filemode false
```
If that doesn't work, you can run below command if you see files modified but with not content difference.
```php
git add -uv
```

##git pull/fetch force rewrite local to be same as origin HEAD branch
```php
git fetch --all
git reset --hard origin/<current_branch>
```

###Git Undo add / Reset File / Git Unstage File
```php
git reset <file>

// or
git reset <HEAD | commit> <file>

// Overwrite local changes with last commit from HEAD
git checkout -- <file>

// remove previously committed file from git repository
git rm --cached <added_file_to_undo>
```

##Git delete / reset / unstage local commit
###Git Delete Last Commit: not pushed
```php
git reset commit_hash
// or
git reset --soft HEAD~1
// --soft option will delete the commit 
// but it will leave all your changed files 
// "Changes to be committed", as git status would put it.
```

###git status:
Shows status of files in the index versus the working directory. It will list out files that are untracked (only in your working directory), modified (tracked but not yet updated in your index), and staged (added to your index and ready for committing).
```php
$ git status
```

###git branch:
Lists existing branches, including remote branches if '-a' is provided. Creates a new branch if a branch name is provided.
```php
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
```php
$ git push --prune origin

// effectively make the remote look like the local copy of the repo (local heads, remotes and tags are mirrored on remote)
$ git push --mirror

// As of Git v1.7.0, you can delete a remote branch using
$ git push origin --delete feature/scroll

// you can also delete remote branch like this
$ git push origin :feature/scroll
```

###Find list of conflicting files
```php
git diff --name-only --diff-filter=U
```

##Find difference between committed and modified file
```php
git diff <-option> <filename>
// Options:
// --ignore-space-at-eol
// => Ignore changes in whitespace at EOL.

// -b (--ignore-space-change)
// => Ignore changes in amount of whitespace. This ignores whitespace at line end, and considers all other sequences of one or more whitespace characters to be equivalent.

// -w (--ignore-all-space)
// => Ignore whitespace when comparing lines. This ignores differences even if one line has whitespace where the other line has none.

// --ignore-blank-lines
// => Ignore changes whose lines are all blank.
```

###Git tag
```php
// Create new tag
git tag -a 1.3.4 -m 'Tagged as version 1.3.4'

// Push new tag to repository
git push origin 1.3.4

// Delete tag
git tag -d 1.3.4
git push origin :refs/tags/1.3.4
```

###Git restore deleted file which is yet to commit
```php
git checkout HEAD deleted-file.php
```

###Git Save password / authentication
```php
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
