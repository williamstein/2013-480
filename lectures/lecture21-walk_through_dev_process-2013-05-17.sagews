︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%hide
%md

# Lecture 21: Developing Sage in the Cloud

#### May 17, 2013

1. Remember to start G+ recorder

2. Questions?

3. Talk about how to modify Sage itself.  I will do this all from <https://cloud.sagemath.com>, though pretty much everything I do applies with any UNIX account.

︡53be1525-4aaa-4546-ba1d-ba875f6d5dd4︡{"html":"<h1>Lecture 21: Developing Sage in the Cloud</h1>\n\n<h4>May 17, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Questions?</p></li>\n<li><p>Talk about how to modify Sage itself.  I will do this all from <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a>, though pretty much everything I do applies with any UNIX account.</p></li>\n</ol>\n"}︡
︠d7e4c991-d1ad-4754-b4b0-d9cf6c08e62fi︠
%hide
%md

## Today's Goal: Explain how to contribute to Sage itself

- This lecture is **extremely important** if you want to tackle anything at <http://trac.sagemath.org> for your final project.

- This is much less important for you otherwise.

- Warning: some aspects of the Sage development process will change substantially in maybe **October 2013**, when we switch from Mercurial to git.

︡702999bd-3874-4520-a377-1f890f4e9099︡{"html":"<h2>Today&#8217;s Goal: Explain how to contribute to Sage itself</h2>\n\n<ul>\n<li><p>This lecture is <strong>extremely important</strong> if you want to tackle anything at <a href=\"http://trac.sagemath.org\">http://trac.sagemath.org</a> for your final project.</p></li>\n<li><p>This is much less important for you otherwise.</p></li>\n<li><p>Warning: some aspects of the Sage development process will change substantially in maybe <strong>October 2013</strong>, when we switch from Mercurial to git.</p></li>\n</ul>\n"}︡
︠4116907b-770e-4c21-9485-1adb4bbfe0e6i︠
%md

## Get your stuff together (to develop on cloud.sagemath):

- **The Guide:** most important *document* is [The Sage Developer's Guide](http://sagemath.org/doc/developer/) (and [PDF](http://sagemath.org/pdf/en/developer/developer.pdf)).  Ignore the stuff about "cloning", since it isn't worth the effort for a single project.

- **Your own Sage:** You want the Ubuntu 12.04LTS 64-bit version, available at [the download page](http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/).   It's fine to start with a binary of the latest release.  You can also build from source, if you want, but that will take over an hour.

︡98a7531e-aea5-408d-a692-23300d5b2ead︡{"html":"<h2>Get your stuff together (to develop on cloud.sagemath):</h2>\n\n<ul>\n<li><p><strong>The Guide:</strong> most important <em>document</em> is <a href=\"http://sagemath.org/doc/developer/\">The Sage Developer&#8217;s Guide</a> (and <a href=\"http://sagemath.org/pdf/en/developer/developer.pdf\">PDF</a>).  Ignore the stuff about &#8220;cloning&#8221;, since it isn&#8217;t worth the effort for a single project.</p></li>\n<li><p><strong>Your own Sage:</strong> You want the Ubuntu 12.04LTS 64-bit version, available at <a href=\"http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/\">the download page</a>.   It&#8217;s fine to start with a binary of the latest release.  You can also build from source, if you want, but that will take over an hour.</p></li>\n</ul>\n"}︡
︠d9fd500b-a3ac-4c6c-ab04-039190dc2934i︠
%md
## Step 1: Install your own copy of Sage in /scratch

Open a terminal and paste the following, where you should replace "name" by something of your choice with no spaces in it.
The commands below all use [bash](http://en.wikipedia.org/wiki/Bash_\(Unix_shell\)), which you should learn.

    # make a directory
    export N="name"; cd /scratch; mkdir $N; cd $N

    wget http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux.tar.lzma

    # this should take about *TWO MINUTES* (71,870 files in there!)
    tar xf *.tar.lzma; rm *.tar.lzma

    # make it so you can edit files in Sage via the graphical interface
    cd; ln -s /scratch/$N/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux sage

    # start the sage command line, as a test.
    cd sage; ./sage -br

<br><br>
**NOTES:**

 - The /scratch directory is not (necessarily) backed up.  When you make significant changes to files (etc.), download or in some other way save those files, just in case.

 - This copy of Sage you just installed has nothing to do with the Sage used for Sage worksheets (.sagews files)... yet.  You must use the command line for now.


︡535c7dc1-a198-42df-b547-69e2418ff54f︡{"html":"<h2>Step 1: Install your own copy of Sage in /scratch</h2>\n\n<p>Open a terminal and paste the following, where you should replace &#8220;name&#8221; by something of your choice with no spaces in it.\nThe commands below all use <a href=\"http://en.wikipedia.org/wiki/Bash_(Unix_shell)\">bash</a>, which you should learn.</p>\n\n<pre><code># make a directory\nexport N=\"name\"; cd /scratch; mkdir $N; cd $N\n\nwget http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux.tar.lzma\n\n# this should take about *TWO MINUTES* (71,870 files in there!)\ntar xf *.tar.lzma; rm *.tar.lzma\n\n# make it so you can edit files in Sage via the graphical interface\ncd; ln -s /scratch/$N/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux sage\n\n# start the sage command line, as a test.\ncd sage; ./sage -br\n</code></pre>\n\n<p><br><br>\n<strong>NOTES:</strong></p>\n\n<ul>\n<li><p>The /scratch directory is not (necessarily) backed up.  When you make significant changes to files (etc.), download or in some other way save those files, just in case.</p></li>\n<li><p>This copy of Sage you just installed has nothing to do with the Sage used for Sage worksheets (.sagews files)&#8230; yet.  You must use the command line for now.</p></li>\n</ul>\n"}︡
︠930b8d75-41f5-476b-a4f2-6705dae7b213i︠
%md

## Step 2: As a test, try changing something in Sage, building the changes, and testing them.

Let's do something silly -- we'll make it so the gcd function prints "hi mom!" whenever it runs.

- Figure out where the gcd command is defined by starting Sage and typing "gcd??"

        cd ~/sage; ./sage
        sage: gcd??
        Type:       function
        String Form:<function gcd at 0x358a9b0>
        File:       .../sage/rings/arith.py
        Definition: gcd(a, b=None, **kwargs)
        ...


    **WARNING:** Very confusingly, the file listed there is the live one being used, note the actual source file, so we have to change the beginning of the path from what it is to devel/sage/sage/.  This has confused the hell out of many people.  There is a fix at [Trac #12659]( http://trac.sagemath.org/sage_trac/ticket/12659), but sadly it hasn't gotten included in Sage.
︡56f8631c-a3df-40f9-aedb-349c2d2512aa︡{"html":"<h2>Step 2: As a test, try changing something in Sage, building the changes, and testing them.</h2>\n\n<p>Let&#8217;s do something silly &#8211; we&#8217;ll make it so the gcd function prints &#8220;hi mom!&#8221; whenever it runs.</p>\n\n<ul>\n<li><p>Figure out where the gcd command is defined by starting Sage and typing &#8220;gcd??&#8221;</p>\n\n<pre><code>cd ~/sage; ./sage\nsage: gcd??\nType:       function\nString Form:&lt;function gcd at 0x358a9b0&gt;\nFile:       .../sage/rings/arith.py\nDefinition: gcd(a, b=None, **kwargs)\n...\n</code></pre>\n\n<p><strong>WARNING:</strong> Very confusingly, the file listed there is the live one being used, note the actual source file, so we have to change the beginning of the path from what it is to devel/sage/sage/.  This has confused the hell out of many people.  There is a fix at <a href=\"http://trac.sagemath.org/sage_trac/ticket/12659\">Trac #12659</a>, but sadly it hasn&#8217;t gotten included in Sage.</p></li>\n</ul>\n"}︡
︠6870df5f-d396-4bb8-9bc5-b25e3c6e5c06i︠
%md
## Step 2 (continued): edit sage/devel/sage/sage/rings/arith.py

- Navigate with the file browser (click "Files" in the top) to sage/devel/sage/sage/rings and click on arith.py.

- Find "def gcd" and add a line to it.

- Click "Save" so your changes are saved to disk.

- Go to the terminal, quite Sage, and type `./sage -br`. Then type `gcd(2,3)`.  If you see what is below, you did it!

        sage: quit
        Exiting Sage (CPU time 0m1.04s, Wall time 11m33.42s).
        ~/sage$ ./sage -br
        ...
        byte-compiling /scratch/wstein/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux/local/lib/python2.7/site-packages/sage/rings/arith.py to arith.pyc
        running install_egg_info
        ----------------------------------------------------------------------
        | Sage Version 5.9, Release Date: 2013-04-30                         |
        | Type "notebook()" for the browser-based notebook interface.        |
        | Type "help()" for help.                                            |
        ----------------------------------------------------------------------
        sage: gcd(2,3)
        Hi mom!
        1
︡b6a8a2e4-c08c-4c53-a5c9-416bf026e4ca︡{"html":"<h2>Step 2 (continued): edit sage/devel/sage/sage/rings/arith.py</h2>\n\n<ul>\n<li><p>Navigate with the file browser (click &#8220;Files&#8221; in the top) to sage/devel/sage/sage/rings and click on arith.py.</p></li>\n<li><p>Find &#8220;def gcd&#8221; and add a line to it.</p></li>\n<li><p>Click &#8220;Save&#8221; so your changes are saved to disk.</p></li>\n<li><p>Go to the terminal, quite Sage, and type <code>./sage -br</code>. Then type <code>gcd(2,3)</code>.  If you see what is below, you did it!</p>\n\n<pre><code>sage: quit\nExiting Sage (CPU time 0m1.04s, Wall time 11m33.42s).\n~/sage$ ./sage -br\n...\nbyte-compiling /scratch/wstein/sage-5.9-linux-64bit-ubuntu_12.04.2_lts-x86_64-Linux/local/lib/python2.7/site-packages/sage/rings/arith.py to arith.pyc\nrunning install_egg_info\n----------------------------------------------------------------------\n| Sage Version 5.9, Release Date: 2013-04-30                         |\n| Type \"notebook()\" for the browser-based notebook interface.        |\n| Type \"help()\" for help.                                            |\n----------------------------------------------------------------------\nsage: gcd(2,3)\nHi mom!\n1\n</code></pre></li>\n</ul>\n"}︡
︠b48f3a77-caaa-4277-a3d5-d5a5289b45c8i︠
%md
### Tips:

- If you click on "Recent", it lists recently opened files, which is an easy way to get back to a file you've opened.

- If you open a file, then click "Files", the current directory is the one that contains that file.
︡a864d835-a81e-4f20-be0d-e57cc8977c00︡{"html":"<h3>Tips:</h3>\n\n<ul>\n<li><p>If you click on &#8220;Recent&#8221;, it lists recently opened files, which is an easy way to get back to a file you&#8217;ve opened.</p></li>\n<li><p>If you open a file, then click &#8220;Files&#8221;, the current directory is the one that contains that file.</p></li>\n</ul>\n"}︡
︠92a4dd9a-60a5-41c7-a8d3-d8af2af66bdbi︠

%md

## Step 3: Create a patch with your changes

- Sage currently uses [Mercurial]() instead of Git for revision control.    So,

- Create a file called ".hgrc" in your home directory with these lines (except use your name and email address).  The ignorews is because <https://cloud.sagemath.com> strips trailing whitespace from line, but the Sage library has tons of trailing whitespace.

        [ui]
        username = William Stein <wstein@gmail.com>
        [diff]
        ignorews=yes

- The Sage library repository is in devel/sage, so do this in the terminal:

        sage: quit
        Exiting Sage (CPU time 0m0.04s, Wall time 7m58.86s).
        ~/sage$ cd devel/sage/
        ~/sage/devel/sage$

- See what we've done.

         ~/sage/devel/sage$ hg diff |more

- So we commit as follows (enter a commit message and save):

        ~/sage/devel/sage$ hg commit -a

- View the log:

        ~/sage/devel/sage$ hg log | more

- Generate a patch (could replace tip by any changelog number, e.g., 18218):

        ~/sage/devel/sage$ hg export tip > ~/my_change.patch   # this will end up in your home directory

- Download patch to your computer by navigating to home directory and clicking on download icon near patch file.
︡a7e3e753-e06d-405e-902b-2d99baeab002︡{"html":"<h2>Step 3: Create a patch with your changes</h2>\n\n<ul>\n<li><p>Sage currently uses <a href=\"\">Mercurial</a> instead of Git for revision control.    So,</p></li>\n<li><p>Create a file called &#8220;.hgrc&#8221; in your home directory with these lines (except use your name and email address).  The ignorews is because <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a> strips trailing whitespace from line, but the Sage library has tons of trailing whitespace.</p>\n\n<pre><code>[ui]\nusername = William Stein &lt;wstein@gmail.com&gt;\n[diff]\nignorews=yes\n</code></pre></li>\n<li><p>The Sage library repository is in devel/sage, so do this in the terminal:</p>\n\n<pre><code>sage: quit\nExiting Sage (CPU time 0m0.04s, Wall time 7m58.86s).\n~/sage$ cd devel/sage/\n~/sage/devel/sage$\n</code></pre></li>\n<li><p>See what we&#8217;ve done.</p>\n\n<pre><code> ~/sage/devel/sage$ hg diff |more\n</code></pre></li>\n<li><p>So we commit as follows (enter a commit message and save):</p>\n\n<pre><code>~/sage/devel/sage$ hg commit -a\n</code></pre></li>\n<li><p>View the log:</p>\n\n<pre><code>~/sage/devel/sage$ hg log | more\n</code></pre></li>\n<li><p>Generate a patch (could replace tip by any changelog number, e.g., 18218):</p>\n\n<pre><code>~/sage/devel/sage$ hg export tip &gt; ~/my_change.patch   # this will end up in your home directory\n</code></pre></li>\n<li><p>Download patch to your computer by navigating to home directory and clicking on download icon near patch file.</p></li>\n</ul>\n"}︡
︠5915d410-b116-4aeb-aba2-9c98326d6447i︠

%md

## Next time:

### Queues: You can use mercurial queues as explained in the Developer's guide to make sure your patch is nice.

### There's also a lot of information about the proper format for docstrings, how to test your code, etc.
︡292eb84b-db2a-41ec-a142-4cb532de227e︡{"html":"<h2>Next time:</h2>\n\n<h3>Queues: You can use mercurial queues as explained in the Developer&#8217;s guide to make sure your patch is nice.</h3>\n\n<h3>There&#8217;s also a lot of information about the proper format for docstrings, how to test your code, etc.</h3>\n"}︡
︠687ce81d-e79f-4a78-820e-8984dbfd7b5f︠
















