# Useful GitHub commands

### Install Git
`sudo apt-get install git`

###  Add existing project to Github
1. Create repository on GitHub without initializing with README file.

2. navigate to the directory and initialize: `git init`

3. Add the files in local repository and stages them for commit: `git add .`

4. commit the files: `git commit -m "First commit"`

5. add the URL: `git remote add origin https://github.com/username/myproject.git`

6. verify the new URL: `git remote -v`

7. push changes: `git push origin master`

### Push to repositoray after making changes

1. Add the files in local repository and stages them for commit: `git add .`

2. commit the files: `git commit -m "current commit"`

3. push changes: `git push origin master`

### Pull new changes from remote

1. `git pull` is a convenient shortcut for completing both `git fetch` and `git merge` in the same command
   
   If you run into a merge conflict you cannot resolve, or if you decide to quit the merge, you can use `git merge --abort` to take the branch back to where it was in before you pulled.

### Set Username
1. set Git username for every repository on your computer:

   `git config --global user.name "TixiaoShan"`
   
   Setting your Git username for a single repository:
   
   `git config user.name "TixiaoShan"`
   
   check username:
   
   `git config user.name`  

2. set your email address for every repository on your computer

   `git config --global user.email "tixiao.shan@gmail.com"`
   
   Setting your email address for a single repository:
   
   `git config user.email "tixiao.shan@gmail.com"`
   
   check email address:
   
   `git config user.email`

### Set Password

Turn on the credential helper so that Git will save your password in memory for some time. By default, Git will cache your password for 15 minutes.

1. Set git to use the credential memory cache:

    `git config --global credential.helper cache`

2. Set the cache to timeout after 1 hour (setting is in seconds):

    `git config --global credential.helper 'cache --timeout=3600'`

### Other commands

1. Delete file or folder:

    `git rm -r file-name.txt or folder` then `git commit -m "Remove file or folder"`

2. Check status:

    `git status`

3. [Many other commands](https://github.com/joshnh/Git-Commands)