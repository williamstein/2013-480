︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md

# Lecture 17: Github and SageMathCloud

1. Remember to start G+ recorder
2. Reminder: homework due Wednesday at 11:59pm; office hours tomorrow.
3. Questions?
4. Today: Git and Github, so you'll be more capable of working on your final projects and homework.

<img src="https://help.github.com/assets/help/set-up-git-27bd5975b24e994bc994ec1cf5c82ff9.gif">
<img src="https://cloud.sagemath.com/art/cloud.png">
︡d3ac15a1-655d-48ca-b063-02493639277c︡{"html":"<h1>Lecture 17: Github and SageMathCloud</h1>\n\n<ol>\n<li>Remember to start G+ recorder</li>\n<li>Reminder: homework due Wednesday at 11:59pm; office hours tomorrow.</li>\n<li>Questions?</li>\n<li>Today: Git and Github, so you&#8217;ll be more capable of working on your final projects and homework.</li>\n</ol>\n\n<p><img src=\"https://help.github.com/assets/help/set-up-git-27bd5975b24e994bc994ec1cf5c82ff9.gif\">\n<img src=\"https://cloud.sagemath.com/art/cloud.png\"></p>\n"}︡
︠0b49d412-a009-45da-b4de-5d0d4e497734io︠
%hide
%md
<div class="pull-right"><img style="width:100px" src="http://yysource.com/wp-content/uploads/2012/09/got_git_tshirt1.jpg?9d7bd4" >
</div>

### Goals -- Step-by-step explanation of how to do the following:

1. Clone a repo from github (or any git repo) into your cloud.sagemath account (or any other command line account).  You can put many repo's in the same cloud.sagemath project.

2. Modify and add files to the repo and commit the changes.

3. Synchronize your account and github; push/pull/merge/fix conflicts.

4. Setup ssh keys so that you don't have to type a login/password.


<div class="lighten">
<br><br><hr>
NOTE: Currently using an external service like github (or bitbucket) is the only way to share your work in cloud.sagemath.  I plan to automate some of this, add syncing with DropBox, and also make it so anybody can directly browse your public repositories via https://cloud.sagemath.com/username/projectname/latest/path/to/file, where "latest" could be replaced by a date to get an old snapshotted version of a file. </div>
︡f2cef5fb-1de9-4271-b24a-df8f6ffe5429︡{"html":"<div class=\"pull-right\"><img style=\"width:100px\" src=\"http://yysource.com/wp-content/uploads/2012/09/got_git_tshirt1.jpg?9d7bd4\" >\n</div>\n\n<h3>Goals &#8211; Step-by-step explanation of how to do the following:</h3>\n\n<ol>\n<li><p>Clone a repo from github (or any git repo) into your cloud.sagemath account (or any other command line account).  You can put many repo&#8217;s in the same cloud.sagemath project.</p></li>\n<li><p>Modify and add files to the repo and commit the changes.</p></li>\n<li><p>Synchronize your account and github; push/pull/merge/fix conflicts.</p></li>\n<li><p>Setup ssh keys so that you don&#8217;t have to type a login/password.</p></li>\n</ol>\n\n<div class=\"lighten\">\n<br><br><hr>\nNOTE: Currently using an external service like github (or bitbucket) is the only way to share your work in cloud.sagemath.  I plan to automate some of this, add syncing with DropBox, and also make it so anybody can directly browse your public repositories via https://cloud.sagemath.com/username/projectname/latest/path/to/file, where \"latest\" could be replaced by a date to get an old snapshotted version of a file. </div>\n"}︡
︠7a349c16-a0a2-4b7c-9559-563e59227b6ei︠

%hide
%md

### 1. Clone a project from github (or any git repo) into your cloud.sagemath account:

* Create a new project

* Create a new terminal and paste this (use "Control-Shift-V" or "Command-V"):

         git clone https://github.com/williamstein/2013-480.git

* Click on "Files" and you'll see that there is a  new directory "2013-480", which you can browse.

* If you click on the half-hidden eye on the right, you'll see hidden files, in particular a ".git" folder.  It is your local copy of the complete history of the repository.


︡0b5233d0-4c43-4a49-bd09-eca30fcbb6c4︡{"html":"<h3>1. Clone a project from github (or any git repo) into your cloud.sagemath account:</h3>\n\n<ul>\n<li><p>Create a new project</p></li>\n<li><p>Create a new terminal and paste this (use &#8220;Control-Shift-V&#8221; or &#8220;Command-V\"):</p>\n\n<p>git clone https://github.com/williamstein/2013-480.git</p></li>\n<li><p>Click on &#8220;Files&#8221; and you&#8217;ll see that there is a  new directory &#8220;2013-480&#8221;, which you can browse.</p></li>\n<li><p>If you click on the half-hidden eye on the right, you&#8217;ll see hidden files, in particular a &#8220;.git&#8221; folder.  It is your local copy of the complete history of the repository.</p></li>\n</ul>\n"}︡
︠7b20f958-e155-468e-864d-c054e491f8b2i︠

%hide
%md

### 2. How to modify and add files to the repo, and commit the changes.

* Make a change to a file.

* Type this into the terminal

       cd 2013-480   # or whatever you called your repo; you can tab complete.
       ls            # list files
       git status
       git commit -a

* Today this should complain about git user info (in a week or two cloud.sagemath will fill this info in based on your account).  For now, let's do it manually, as we're told to do.  Copy with "highlight and control-c or command-c":

       git config --global user.email "wstein@gmail.com"; git config --global user.name "William Stein"

* Now do "git commit -a" again.

* Enter a 1-line commit message, then type "Control-X".  <div class="lighten">(The default editor is very minimal.  I want to make it use a full graphical web-based editor automatically, but haven't worked out how to do that yet!)</div>

* Add a file (using "+ New" at the top); make sure your new file is in the repo path.  Let's say it is test.md.

* Do "git add test.md" then "git commit -a", and proceed as above.
︡046aaaf0-d7c5-43ca-a00a-3ccc034115a8︡{"html":"<h3>2. How to modify and add files to the repo, and commit the changes.</h3>\n\n<ul>\n<li><p>Make a change to a file.</p></li>\n<li><p>Type this into the terminal</p>\n\n<p>cd 2013-480   # or whatever you called your repo; you can tab complete.\n   ls            # list files\n   git status\n   git commit -a</p></li>\n<li><p>Today this should complain about git user info (in a week or two cloud.sagemath will fill this info in based on your account).  For now, let&#8217;s do it manually, as we&#8217;re told to do.  Copy with &#8220;highlight and control-c or command-c\":</p>\n\n<p>git config &#8211;global user.email &#8220;wstein@gmail.com&#8221;; git config &#8211;global user.name &#8220;William Stein&#8221;</p></li>\n<li><p>Now do &#8220;git commit -a&#8221; again.</p></li>\n<li><p>Enter a 1-line commit message, then type &#8220;Control-X&#8221;.  <div class=\"lighten\">(The default editor is very minimal.  I want to make it use a full graphical web-based editor automatically, but haven&#8217;t worked out how to do that yet!)</div></p></li>\n<li><p>Add a file (using &#8220;+ New&#8221; at the top); make sure your new file is in the repo path.  Let&#8217;s say it is test.md.</p></li>\n<li><p>Do &#8220;git add test.md&#8221; then &#8220;git commit -a&#8221;, and proceed as above.</p></li>\n</ul>\n"}︡
︠e364c28a-10d9-457b-b4bb-9cfdd8547adbi︠
%hide
%md
### 3. Synchronize your account and github; push/pull/merge/fix conflicts

* In the repo directory, assuming you have write access to the remote repo, type "git push".  You will have to enter your login and password.

* BUT: "git push" might fail if changes were made to the repo since when you last pulled.  In that case, do "git pull" first.  It **is safe** to do "git pull" even if you have files in the repo opened in cloud.sagemath, since it will notice the files change on disk and automatically merge the changes into your editing sessions.

    * If there are no conflicts (usually the case), this will automatically merge, and you can then do "git push".

    * If there are conflicts, you will have to edit manually editing the corresponding files to resolve the conflicts, then do "git commit".

* Once the above is sorted out, do "git push".
︡e8f32f97-a98b-4b73-b2b5-c725a245a8f5︡{"html":"<h3>3. Synchronize your account and github; push/pull/merge/fix conflicts</h3>\n\n<ul>\n<li><p>In the repo directory, assuming you have write access to the remote repo, type &#8220;git push&#8221;.  You will have to enter your login and password.</p></li>\n<li><p>BUT: &#8220;git push&#8221; might fail if changes were made to the repo since when you last pulled.  In that case, do &#8220;git pull&#8221; first.  It <strong>is safe</strong> to do &#8220;git pull&#8221; even if you have files in the repo opened in cloud.sagemath, since it will notice the files change on disk and automatically merge the changes into your editing sessions.</p>\n\n<ul>\n<li><p>If there are no conflicts (usually the case), this will automatically merge, and you can then do &#8220;git push&#8221;.</p></li>\n<li><p>If there are conflicts, you will have to edit manually editing the corresponding files to resolve the conflicts, then do &#8220;git commit&#8221;.</p></li>\n</ul></li>\n<li><p>Once the above is sorted out, do &#8220;git push&#8221;.</p></li>\n</ul>\n"}︡
︠ba5d76b8-7b04-4a87-82a8-932ec82100b4i︠
%hide
%md
### 4. Setup ssh keys so that you don't have to type any login/passwords for your own repos.

If you are tired of typing passwords when syncing with github, you can create an add an ssh key to your github account.

**WARNING:** When I make it possible for other people to be members of a project, they will also be able to read the secret key you create if you don't set a passphrase... so set a passphrase.  Also, even public projects won't make all files in the project public (the .ssh will be protected by UNIX permissions, hence stay private).


* Type this in a terminal: "ssh-keygen -b 2048"; set a passphrase with at least 5 characters.

* Navigate "Using the 'Files'" link to the .ssh directory; you will have to show hidden files to see this.

* In that directory, there is a file "id_rsa.pub".  Click on it.

* Go to github.com, click "Account Settings" (in the upper right), click "SSH keys" (middle left), click "Add SSH key", and paste in the contents of id_rsa.pub

* Now if you try modifying files and pushing, *the situation will be no better* -- you would still need the login and password!

* You need to change the remote upstream for the repository from a URL (that https://githbub... thing we pasted earlier) to an ssh address.  For our example, we do this as follows, where we find the ssh address by going to the github page for our repository, and clicking "SSH" to find "git@github.com:williamstein/2013-480.git", then we do "git remote set-url origin git@github.com:williamstein/2013-480.git".
︡3ee76f35-6075-4fcf-b6a8-bb4b74b9cd04︡{"html":"<h3>4. Setup ssh keys so that you don&#8217;t have to type any login/passwords for your own repos.</h3>\n\n<p>If you are tired of typing passwords when syncing with github, you can create an add an ssh key to your github account.</p>\n\n<p><strong>WARNING:</strong> When I make it possible for other people to be members of a project, they will also be able to read the secret key you create if you don&#8217;t set a passphrase&#8230; so set a passphrase.  Also, even public projects won&#8217;t make all files in the project public (the .ssh will be protected by UNIX permissions, hence stay private).</p>\n\n<ul>\n<li><p>Type this in a terminal: &#8220;ssh-keygen -b 2048&#8221;; set a passphrase with at least 5 characters.</p></li>\n<li><p>Navigate &#8220;Using the &#8216;Files&#8217;&#8221; link to the .ssh directory; you will have to show hidden files to see this.</p></li>\n<li><p>In that directory, there is a file &#8220;id_rsa.pub&#8221;.  Click on it.</p></li>\n<li><p>Go to github.com, click &#8220;Account Settings&#8221; (in the upper right), click &#8220;SSH keys&#8221; (middle left), click &#8220;Add SSH key&#8221;, and paste in the contents of id_rsa.pub</p></li>\n<li><p>Now if you try modifying files and pushing, <em>the situation will be no better</em> &#8211; you would still need the login and password!</p></li>\n<li><p>You need to change the remote upstream for the repository from a URL (that https://githbub&#8230; thing we pasted earlier) to an ssh address.  For our example, we do this as follows, where we find the ssh address by going to the github page for our repository, and clicking &#8220;SSH&#8221; to find &#8220;git@github.com:williamstein/2013-480.git&#8221;, then we do &#8220;git remote set-url origin git@github.com:williamstein/2013-480.git&#8221;.</p></li>\n</ul>\n"}︡
︠9b2ffe9e-089a-4fca-bd66-52e62ee22b63︠
~/2013-480$ git remote -v
origin  https://github.com/williamstein/2013-480 (fetch)
origin  https://github.com/williamstein/2013-480 (push)
~/2013-480$ git remote set-url origin git@github.com:williamstein/2013-480.git
~/2013-480$ git remote -v
origin  git@github.com:williamstein/2013-480.git (fetch)
origin  git@github.com:williamstein/2013-480.git (push)
~/2013-480$ git push
Warning: Permanently added 'github.com,204.232.175.90' (RSA) to the list of known hosts.
Enter passphrase for key '/mnt/home/9onwBKpS/.ssh/id_rsa':
Everything up-to-date
~/2013-480$ git push
Enter passphrase for key '/mnt/home/9onwBKpS/.ssh/id_rsa':
Everything up-to-date
︠33ffb4d2-5413-499e-ba34-ef38072cbc35i︠
%hide
%md
### But... typing a passphrase every time is a pain.

> github: "Using a key without a passphrase is basically the same as writing down that random password in a file on your computer. Anyone who gains access to your drive has gained access to every system you use that key with. This is also a Very Bad Thing. The solution is obvious, add a passphrase." ... and use ssh-agent.

<pre>
    ~/2013-480$ eval "$(ssh-agent)"
    Agent pid 32101
    ~/2013-480$ ssh-add
    Enter passphrase for /mnt/home/9onwBKpS/.ssh/id_rsa:
    Identity added: /mnt/home/9onwBKpS/.ssh/id_rsa (/mnt/home/9onwBKpS/.ssh/id_rsa)
    ~/2013-480$ git push
    Everything up-to-date
    ~/2013-480$ git push
    Everything up-to-date
    ~/2013-480$
</pre>


You can always also remove the SSH key you added from github.

Also, if you are doing something where security isn't important, just don't set a passphrase for your key.  That is fine for this class.

︡42bdc5f0-ed77-49ee-b820-81a2a528da1d︡{"html":"<h3>But&#8230; typing a passphrase every time is a pain.</h3>\n\n<blockquote>\n  <p>github: &#8220;Using a key without a passphrase is basically the same as writing down that random password in a file on your computer. Anyone who gains access to your drive has gained access to every system you use that key with. This is also a Very Bad Thing. The solution is obvious, add a passphrase.&#8221; &#8230; and use ssh-agent.</p>\n</blockquote>\n\n<pre>\n    ~/2013-480$ eval \"$(ssh-agent)\"\n    Agent pid 32101\n    ~/2013-480$ ssh-add\n    Enter passphrase for /mnt/home/9onwBKpS/.ssh/id_rsa:\n    Identity added: /mnt/home/9onwBKpS/.ssh/id_rsa (/mnt/home/9onwBKpS/.ssh/id_rsa)\n    ~/2013-480$ git push\n    Everything up-to-date\n    ~/2013-480$ git push\n    Everything up-to-date\n    ~/2013-480$\n</pre>\n\n<p>You can always also remove the SSH key you added from github.</p>\n\n<p>Also, if you are doing something where security isn&#8217;t important, just don&#8217;t set a passphrase for your key.  That is fine for this class.</p>\n"}︡
︠94356493-3b3c-4d95-b79d-e80aedf02edf︠
















