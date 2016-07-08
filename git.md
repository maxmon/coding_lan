- [git setup](https://help.github.com/articles/set-up-git/)

- [ssh key](https://help.github.com/articles/generating-ssh-keys/)
	- 注意win7 下add ssh key时

			eval `ssh-agent -s`


##common command

`git clone git@github.com:[user name]/[repsitory]`

`git commit -am "commit message"`

`git push -u origin [remote]`

###from baidu-device

>update local code

	git fetch --al
	git add [file]
	git rebase origin [remote branch]
	
>checkout new branch and merge 

	git fetch --al
	git checkout -b [new] --track origin [remote branch]
	git merge --squash [old]
	//fix conflict

>dbg branch

	git push origin 本地分支:dbg_,,,
	git push origin :dbg_,,,//delete branch

>cherry commit

	git cherry-pick commit_id

##[.gitignore](https://help.github.com/articles/ignoring-files/)

	touch .gitignore
//写入_book
If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

	git rm --cached 

##errors

###no repository
git remote add [remote repository url]

##github - setup

create a new repository on the command line


echo "# git" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/maxmon/git.git
git push -u origin master
…or push an existing repository from the command line


git remote add origin https://github.com/maxmon/git.git
git push -u origin master