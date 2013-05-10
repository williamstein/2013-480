︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md
<span class="pull-right"> <img src="http://math.hws.edu/eck/about_tex/latex_lion.gif"></span>

# Lecture 18: Professional Quality Mathematical Documents (LaTeX)

1. Remember to start G+ recorder
2. Questions?

︡bd6916e3-4779-4af8-a1d6-718452f255b7︡{"html":"<p><span class=\"pull-right\"> <img src=\"http://math.hws.edu/eck/about_tex/latex_lion.gif\"></span></p>\n\n<h1>Lecture 18: Professional Quality Mathematical Documents (LaTeX)</h1>\n\n<ol>\n<li>Remember to start G+ recorder</li>\n<li>Questions?</li>\n</ol>\n"}︡
︠8e3f5a80-9b9d-491b-bd7a-222fbc58ded7i︠
%hide
%md
## LaTeX: Motivation

 - LaTeX is a free, open source program for creating publication quality PDF's, with incredibly good support for mathematics.

 - LaTeX is used by all the professional book/journal mathematics publishers.  It's pro.

 - LaTeX is very structural -- you worry mainlyabout content, not look.

 - The results of LaTeX usually look **vastly better** than what anybody can possibly produce using Microsoft Word, Google Docs, Libre Office, Pages, etc.   Not only is the formula layout superior, but the test spacing and justification algorithms are better.  Plus LaTeX is free.

 - As with Python, there is an enormous number of LaTeX packages that add key functionality (e.g., for nicely typesetting music).

 - A drawback is that LaTeX has a significant learning curve, and you often *have* to look up how to do things on line.  Also, the error messages can be incomprehensible and frustrating, and the workflow typically involves two different ways of viewing your document, which is annoying.
︡906d9c1c-a8ed-4b82-b2a4-4f544ba2469f︡{"html":"<h2>LaTeX: Motivation</h2>\n\n<ul>\n<li><p>LaTeX is a free, open source program for creating publication quality PDF&#8217;s, with incredibly good support for mathematics.</p></li>\n<li><p>LaTeX is used by all the professional book/journal mathematics publishers.  It&#8217;s pro.</p></li>\n<li><p>LaTeX is very structural &#8211; you worry mainlyabout content, not look.</p></li>\n<li><p>The results of LaTeX usually look <strong>vastly better</strong> than what anybody can possibly produce using Microsoft Word, Google Docs, Libre Office, Pages, etc.   Not only is the formula layout superior, but the test spacing and justification algorithms are better.  Plus LaTeX is free.</p></li>\n<li><p>As with Python, there is an enormous number of LaTeX packages that add key functionality (e.g., for nicely typesetting music).</p></li>\n<li><p>A drawback is that LaTeX has a significant learning curve, and you often <em>have</em> to look up how to do things on line.  Also, the error messages can be incomprehensible and frustrating, and the workflow typically involves two different ways of viewing your document, which is annoying.</p></li>\n</ul>\n"}︡
︠4fc69880-274f-4edd-a3b5-bf3ef4cbf7e8i︠

%hide
%md
## Using ${\rm\LaTeX}$

Here are some ways to use ${\rm\LaTeX}$:

 - Install it on your computer.  For example, on OS X, download from <http://www.tug.org/mactex/downloading.html>   Note tht this is  2.1GB downlod (!), which mkes Sage look small in comparison.

 - If you type "latex online editor" into Google, you'll find a bunch of purely Web-based LaTeX editors.

 - You can also edit LaTeX documents in <https://cloud.sagemath.com>, which is what I'll show you now.

 - LaTeX *formulas* can be embedded in web pages using <http://www.mathjax.org/>; I will explain this on Monday.

︡1f4c0e5c-1215-4077-8511-85360405f711︡{"html":"<h2>Using ${\\rm\\LaTeX}$</h2>\n\n<p>Here are some ways to use ${\\rm\\LaTeX}$:</p>\n\n<ul>\n<li><p>Install it on your computer.  For example, on OS X, download from <a href=\"http://www.tug.org/mactex/downloading.html\">http://www.tug.org/mactex/downloading.html</a>   Note tht this is  2.1GB downlod (!), which mkes Sage look small in comparison.</p></li>\n<li><p>If you type &#8220;latex online editor&#8221; into Google, you&#8217;ll find a bunch of purely Web-based LaTeX editors.</p></li>\n<li><p>You can also edit LaTeX documents in <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a>, which is what I&#8217;ll show you now.</p></li>\n<li><p>LaTeX <em>formulas</em> can be embedded in web pages using <a href=\"http://www.mathjax.org/\">http://www.mathjax.org/</a>; I will explain this on Monday.</p></li>\n</ul>\n"}︡
︠068a9f36-fa74-4602-a86a-f80ff52f51e3i︠
%hide
%md
## Using LaTeX in <https://cloud.sagemath.com>

 - Create a new file that ends in .tex, and you'll notice that there is an extra little button bar that lets you compile the code, view a preview, and downlod the high-quality PDF version.

 - The source file is syntax-highlighted so it is easy to read.

 - I plan to add much more functionality later, but this is already very powerful, since you can:

      - work with a whole directory of files

      - run anything from the command line terminal (e.g., git),

      - run Sage (and any other free math software)

      - use SageTex, which is pre-installed and works: <http://www.sagemath.org/doc/tutoria/sagetex.html>  SageTex lets you add results of computations computed via sage to your documents.
︡88cae45f-7408-45e0-967c-03c310927963︡{"html":"<h2>Using LaTeX in <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a></h2>\n\n<ul>\n<li><p>Create a new file that ends in .tex, and you&#8217;ll notice that there is an extra little button bar that lets you compile the code, view a preview, and downlod the high-quality PDF version.</p></li>\n<li><p>The source file is syntax-highlighted so it is easy to read.</p></li>\n<li><p>I plan to add much more functionality later, but this is already very powerful, since you can:</p>\n\n<ul>\n<li><p>work with a whole directory of files</p></li>\n<li><p>run anything from the command line terminal (e.g., git),</p></li>\n<li><p>run Sage (and any other free math software)</p></li>\n<li><p>use SageTex, which is pre-installed and works: <a href=\"http://www.sagemath.org/doc/tutoria/sagetex.html\">http://www.sagemath.org/doc/tutoria/sagetex.html</a>  SageTex lets you add results of computations computed via sage to your documents.</p></li>\n</ul></li>\n</ul>\n"}︡
︠daf0c4f7-3346-4fe1-9d41-ccab216ab537︠





















