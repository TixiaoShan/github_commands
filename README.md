# Useful GitHub commands

### Install Git
`sudo apt-get install git`

###  Add existing project to Github
1. Create repository on GitHub without initializing with README file.

2. navigate to the directory and initialize: `git init`

3. Add all the files: `git add .`

4. commit the files: `git commit -m "First commit"`

5. add the URL: `git remote add origin remote repository URL`

6. verify the new URL: `git remote -v`

7. push changes: `git push origin master`

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

### Push to repositoray after changes

