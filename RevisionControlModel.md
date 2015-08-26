# Introduction #

Several Books developers have begun using a hybrid revision control system consisting of the Google Code Subversion server as a backend and the git revision control system (http://git.or.cz/) on local computers.  This model allows for a rich revision history as developers work locally without polluting the Subversion repository with partial or non-working commits.

This model also works well in an environment where there are many developers but only a few with commit rights to the "central" repository.  As branch changes are ready for merging into the tree, a developer can send the local ".git" repository to anyone with commit rights.  The committer can than merge changes along with complete change history into the trunk.  All other developers can then easily pull those changes down to their local git repository.

This article describes how to use git and Subversion to develop for Books.


# Installation #

First and foremost, git must be installed on the local system.

Most Linux distributions have git in their package tree at this point, and such an install should work fine.

For Mac OS users, git can be installed via the Darwin Ports system.  The svn variant must be built, so `sudo port install git-core +svn`.

For Windows, the story isn't quite so simple as git makes use of many features provided by UNIX-like operating systems which are absent on Windows, even with CygWin.  git will work on Windows, but suffers a performance penalty.  Information about the installation process is available here: http://git.or.cz/gitwiki/WindowsInstall

# Initial SVN Pull #

Once git is installed, the current Subversion repository must be pulled down to the local git repository.  The git-svn tool makes this simple.
```
cd /whereever/source/should/go/
git-svn clone http://iphoneebooks.googlecode.com/svn/trunk/ iphoneebooks
```
The full history of Books' development will be downloaded from Subversion to the local git repository.  For those with committer status on the gCode SVN, use 'https' instead of 'http', and provide username and password when prompted.

Once the git-svn pull is complete, change to the newly created iphoneebooks directory.  There, an `ls` will reveal...  Nothing!  At this point, git-svn has created a git repository which is stored in the '.git' directory.  An `ls -l` should reveal this.  In order to begin developing, checkout the code from the local git repository with `git checkout`.  Now `ls` will reveal all of the Books source code.

# Developing and Checking In #

Development with git proceeds much as it does with other revision control systems.  As changes are made, they should be periodically checked into the local git repository.  These local changes are private and are not visible in Subversion (yet).  One of the first differences between git and svn becomes apparent during checkin.  While Subversion checkins generally include all source changed, git allows much finer control of what is included in a checkin.  Each modified file must be explicitly added to the changes to be checked in.  git will show what changes have occurred using the `git status` command.  Changed files are added to the commit with `git add file ...`.  Changes are then committed to the repository with `git commit -m "Commit message"`.  As a shortcut, all changed files can be committed with `git commit -a -m "Commit message"`

## Sample Checkin ##

Assuming some changes have been made to Books files, a commit process might look like the following:

First check changed status with `git status`:
```
fawn:iphoneebooks-git pendor$ git status
# On branch zsb
# Changed but not updated:
#   (use "git add <file>..." to update what will be committed)
#
#	modified:   .gitignore
#	modified:   Makefile
#
no changes added to commit (use "git add" and/or "git commit -a")
```

Add changes to the commit:
```
fawn:iphoneebooks-git pendor$ git add .gitignore Makefile
```

And finally commit changes to the local git repository:
```
fawn:iphoneebooks-git pendor$ git commit -m "Add comment to Makefile"
Created commit 1ff94a9: Add comment to Makefile
 2 files changed, 3 insertions(+), 0 deletions(-)
```

# Seeing Others' Changes #

As multiple users work on the project, odds are the Subversion repository will change out from under any pulled git repository.  New changes can be pulled from SVN at any time by running `git-svn rebase`.  This command will grab any changes and attempt to intelligently merge them underneath changes in the current git repository.

A rebase transaction should look something like this:
```
fawn:iphoneebooks-git pendor$ git-svn rebase
	M	Makefile
r250 = f609f14bfbadf0a9ec7356e1f2606d693c4217d1 (git-svn)
First, rewinding head to replay your work on top of it...
HEAD is now at f609f14... Trivial change to demonstrate rebase
Fast-forwarded zsb to refs/remotes/git-svn.
```

If the local git repository contains changes to files that were also changed in SVN, a less clean rebase may occur:
```
fawn:iphoneebooks-git pendor$ git-svn rebase
	M	Makefile
r251 = be1e749daa7f3dd94d1b7ce273f39aafc503985a (git-svn)
First, rewinding head to replay your work on top of it...
HEAD is now at be1e749... Trivial change to demonstrate rebase

Applying Trivial change to test rebase conflict

Adds trailing whitespace.
.dotest/patch:14:# 
error: patch failed: Makefile:1
error: Makefile: patch does not apply
Using index info to reconstruct a base tree...
Adds trailing whitespace.
<stdin>:14:# 
warning: 1 line adds whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merged Makefile
CONFLICT (content): Merge conflict in Makefile
Failed to merge in the changes.
Patch failed at 0001.

When you have resolved this problem run "git rebase --continue".
If you would prefer to skip this patch, instead run "git rebase --skip".
To restore the original branch and stop rebasing run "git rebase --abort".

rebase refs/remotes/git-svn: command returned error: 1
```

git will attempt to automerge patches to the greatest degree possible, but sometimes a manual merge will be required.  Any conflicting files will be decorated with information about the failed patches.  At this point, it is unlikely that the local tree will build.  Searching for seven equal signs should help find the failed commits.

Once conflicts are fixed, each resolved file must be added with `git add filename`.  Then `git rebase --continue`:
```
fawn:iphoneebooks-git pendor$ git add Makefile
fawn:iphoneebooks-git pendor$ git rebase --continue

Applying Trivial change to test rebase conflict

Wrote tree 5d8921030be4ace012b663a1be5e4af5a753fce0
Committed: 41d70c28834ca56c2a4376ea44a6b27dd5c7a8f4
```

At that point, `git status` should show no changes and `git-svn rebase` should complete successfully.

# Contributing Changes #

## For committers ##
For users with SVN commit access, committing changes back to the central repository is easy.  Simply run `git-svn dcommit`.  All commits from the local git repository will be pushed to SVN individually.  By running one command, the entire per-commit history of local development is preserved in SVN.

A dcommit might look like the following:

First a "dry run" to make sure no errors will occur:
```
fawn:iphoneebooks-git pendor$ git-svn dcommit --dry-run
Committing to https://iphoneebooks.googlecode.com/svn/trunk ...
diff-tree 1ff94a9118bae6aac469f9778c6d7f3c909a4a80~1 1ff94a9118bae6aac469f9778c6d7f3c909a4a80
```

If errors or conflicts are shown, it may be necessary to do a rebase and merge before committing changes.

Assuming no errors are reported, commit:
```
fawn:iphoneebooks-git pendor$ git-svn dcommit
Committing to https://iphoneebooks.googlecode.com/svn/trunk ...
	M	.gitignore
	M	Makefile
Committed r249
	M	.gitignore
	M	Makefile
r249 = 316c31ee415d533647358e806f31bf7438604cad (git-svn)
No changes between current HEAD and refs/remotes/git-svn
Resetting to the latest refs/remotes/git-svn
```

## For non-committers ##

For those without commit access, the process has a few more steps, but isn't terribly difficult.  All changes must be checked in to the local git repository.  At that point, there are a few options.  git has very strong patch management capabilities, and for many small changes, the git format-patch or diff commands are useful.  For larger change sets, providing a copy of the '.git' directory to a committer is sufficient to grant access to the entire development history.  Simply tar up the git directory (`tar -cjvf my-git.tbz .git`) and send it along to a committer.

Once changes are submitted to the SVN, `git-svn rebase` will retrieve the changed metadata back into the local git repository.

Another user's git repository can be mounted on the local repository with the following:
```
git remote add branchName /path/to/other/.git
git fetch branchName
```

(_Stay tuned for better instructions on this.  We're still getting the hang of it ourselves!_)

# Further Reading #

The above is of course only a _tiny_ subset of git's capabilities.  For more information, the developers have found the following resources useful:

  * http://utsl.gen.nz/talks/git-svn/intro.html - An introduction to git-svn
  * http://git.or.cz/course/svn.html - A git crash course for svn users
  * http://www.kernel.org/pub/software/scm/git/docs/git-svn.html - The git-svn man page
  * http://www.kernel.org/pub/software/scm/git/docs/user-manual.html - The git users' manual
  * http://www.kernel.org/pub/software/scm/git/docs/tutorial.html - A brief git tutorial

## Advanced Topics ##

For those who are promoted to committer status, some adjustment is necessary to point git-svn to the authenticated repository.  Unfortunately gCode uses two different SVN URL's for anonymous or authenticated access (http versus https).  There's no way to use the authenticated URL anonymously nor vice versa.

The following URL contains instructions for migrating the URL for a git-svn repository.  This has been used successfully by at least one member of the development team, but it's not for the faint of heart!

  * http://www.sanityinc.com/articles/relocating-git-svn-repositories