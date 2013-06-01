︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%md

<div class="pull-right"><img src="http://sagemath.org/pix/sage_logo_new.png"></div>

## Lecture 26: 3d Graphics

#### May 31, 2013

0. Reminder: Final project presentations are all of next week (not recorded).  You will submit your final project
via [this form](https://docs.google.com/forms/d/1bm59TFXIQfEmxP1jOiwszPCG4pRcDvrZP9NLrPr04fE/viewform), and
there is a  [schedule for next week](https://github.com/williamstein/2013-480/blob/master/final_projects.md)

1. Remember to start G+ recorder

2. Note: cloud.sagemath update

3. Topic: 3d graphics using Sage

︡cbc68de9-364c-427c-ab36-640ba6bcd979︡{"html":"<div class=\"pull-right\"><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></div>\n\n<h2>Lecture 26: 3d Graphics</h2>\n\n<h4>May 31, 2013</h4>\n\n<ol>\n<li><p>Reminder: Final project presentations are all of next week (not recorded).  You will submit your final project\nvia <a href=\"https://docs.google.com/forms/d/1bm59TFXIQfEmxP1jOiwszPCG4pRcDvrZP9NLrPr04fE/viewform\">this form</a>, and\nthere is a  <a href=\"https://github.com/williamstein/2013-480/blob/master/final_projects.md\">schedule for next week</a></p></li>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Note: cloud.sagemath update</p></li>\n<li><p>Topic: 3d graphics using Sage</p></li>\n</ol>\n"}︡
︠4fb4d1eb-1707-46dd-b49c-45b76810ecdfi︠
%hide
%md

### What I did to <https://cloud.sagemath.com> yesterday...

   - **Sage**: upgraded sage to 5.10.rc1

   - **Snapshotting**: made major improvements to snapshotting:

        - the list of available snapshots is now consistent, since
available snapshots are
          all merged in the database

        - browsing and using snapshots should be "snappier", due to
more caching and me totally rewriting several key things.

        - snapshots are divided first by day, which makes them easier to browser


   - **Terminal bugfix**: in some cases the row height computation was
      off, which led to part of the bottom line being cut off.  This
was seriously bugging
      me, so I found a way around it, which should even work with
weird zoom levels, etc.

   - **More software**: installed Haskell and Racket (scheme dialect).

   - **Your Sage in a Worksheet**: You can now build your *own copy of
Sage* and use
      it in worksheets!  Do this in the terminal:

        1. build sage (as usual) -- this should take about 30 minutes.

        2. cd; mkdir -p bin; cd bin; ln -s /path/to/your/sage/install/sage .

        3. Click on the settings (wrench) for your project and click
the "Restart Project Server" button.

        4. If you modify your sage and want that in worksheets, click
"Restart Worksheet Server" and also restart the worksheet itself (this
may be flakie still).

   - **Graphics**: if you open a new worksheet and draw a plot (e.g.,
"plot(sin)" then shift-enter), it'll be *way* faster the first time
than before.   Worksheet sage processes fork off of one master
process, and I hadn't correctly pre-imported all plotting code.  Now
that I have, the first plot is much, much faster.  Similar remarks
about symbolic integration (or anything that uses Maxima).

   - **File type:** determined by case insensitive extension.

︡0d28848d-7443-4fee-aced-8fe5cb9487fd︡{"html":"<h3>What I did to <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a> yesterday&#8230;</h3>\n\n<ul>\n<li><p><strong>Sage</strong>: upgraded sage to 5.10.rc1</p></li>\n<li><p><strong>Snapshotting</strong>: made major improvements to snapshotting:</p>\n\n<pre><code>- the list of available snapshots is now consistent, since\n</code></pre>\n\n<p>available snapshots are\n      all merged in the database</p>\n\n<pre><code>- browsing and using snapshots should be \"snappier\", due to\n</code></pre>\n\n<p>more caching and me totally rewriting several key things.</p>\n\n<pre><code>- snapshots are divided first by day, which makes them easier to browser\n</code></pre></li>\n<li><p><strong>Terminal bugfix</strong>: in some cases the row height computation was\n  off, which led to part of the bottom line being cut off.  This\nwas seriously bugging\n  me, so I found a way around it, which should even work with\nweird zoom levels, etc.</p></li>\n<li><p><strong>More software</strong>: installed Haskell and Racket (scheme dialect).</p></li>\n<li><p><strong>Your Sage in a Worksheet</strong>: You can now build your <em>own copy of\nSage</em> and use\n  it in worksheets!  Do this in the terminal:</p>\n\n<pre><code>1. build sage (as usual) -- this should take about 30 minutes.\n\n2. cd; mkdir -p bin; cd bin; ln -s /path/to/your/sage/install/sage .\n\n3. Click on the settings (wrench) for your project and click\n</code></pre>\n\n<p>the &#8220;Restart Project Server&#8221; button.</p>\n\n<pre><code>4. If you modify your sage and want that in worksheets, click\n</code></pre>\n\n<p>&#8220;Restart Worksheet Server&#8221; and also restart the worksheet itself (this\nmay be flakie still).</p></li>\n<li><p><strong>Graphics</strong>: if you open a new worksheet and draw a plot (e.g.,\n&#8220;plot(sin)&#8221; then shift-enter), it&#8217;ll be <em>way</em> faster the first time\nthan before.   Worksheet sage processes fork off of one master\nprocess, and I hadn&#8217;t correctly pre-imported all plotting code.  Now\nthat I have, the first plot is much, much faster.  Similar remarks\nabout symbolic integration (or anything that uses Maxima).</p></li>\n<li><p><strong>File type:</strong> determined by case insensitive extension.</p></li>\n</ul>\n"}︡
︠4ae21875-deff-4645-ac9c-6ca0389cc5a1i︠
%md
## Topic: 3d Graphics Using Sage

- Interactive rotation of graphics and axis labels requires a Java applet, so doesn't work in cloud.sagemath
yet (and nowhere on my Java-free laptop).
Fixing this will be a goal of [Sage Days 48 at UW June 17-21](http://wiki.sagemath.org/days48).
There will be lots of coding sprints and snacks; let me know if you want to attend.

- Fortunately, everything else about 3d graphics is fairly well developed, and can be statically rendered using a ray tracer in cloud.

- This lecture:

    - give you a tour of available functionality

    - say something about the strategy going forward


︡d73e20f4-6711-404b-af01-943075467819︡{"html":"<h2>Topic: 3d Graphics Using Sage</h2>\n\n<ul>\n<li><p>Interactive rotation of graphics and axis labels requires a Java applet, so doesn&#8217;t work in cloud.sagemath\nyet (and nowhere on my Java-free laptop).\nFixing this will be a goal of <a href=\"http://wiki.sagemath.org/days48\">Sage Days 48 at UW June 17-21</a>. <br />\nThere will be lots of coding sprints and snacks; let me know if you want to attend.</p></li>\n<li><p>Fortunately, everything else about 3d graphics is fairly well developed, and can be statically rendered using a ray tracer in cloud.</p></li>\n<li><p>This lecture: </p>\n\n<ul>\n<li><p>give you a tour of available functionality</p></li>\n<li><p>say something about the strategy going forward</p></li>\n</ul></li>\n</ul>\n"}︡
︠d268155d-f8d8-462c-aca4-661814f2fcc1i︠
%md
### An Example

## Important WARNING
In <https://cloud.sagemath.com>, the only way to see a 3d plot g is to type `show(g)`.  In particular, `g.show()` won't work.
(This is because of my inability to monkey patch Cython code.)
︡8d6d1650-6841-484d-b81b-c7ef6c0a040f︡{"html":"<h3>An Example</h3>\n\n<h2>Important WARNING</h2>\n\n<p>In <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a>, the only way to see a 3d plot g is to type <code>show(g)</code>.  In particular, <code>g.show()</code> won&#8217;t work. <br />\n(This is because of my inability to monkey patch Cython code.)</p>\n"}︡
︠78b8d358-53df-4c16-a601-9ec0f2fe686b︠
c = sphere()
show(c)
# show this in class -- http://480.sagenb.org/home/William_Stein/80/
︡2b05ce39-b90b-4aba-8815-83a1ee07b888︡{"file":{"show":true,"uuid":"82bc7e33-919a-427b-b7b6-be51caa1053e","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_aQw8KH.png"}}︡
︠10d3450f-0f1a-426c-b010-fffa43fd6afai︠
%md

### Example: Plot a function of two variables
︡f55d9dc6-9fb7-44a1-a483-df9f3842b70b︡{"html":"<h3>Example: Plot a function of two variables</h3>\n"}︡
︠e1b31320-08d1-44eb-833b-afbeb79a5b81︠

var('x,y')
g = plot3d(4*x*exp(-x^2-y^2), (x,-2,2), (y,-2,2))
show(g)
︡5c0c0b12-bb0d-43b6-9882-01479b73e079︡{"stdout":"(x, y)\n"}︡{"file":{"show":true,"uuid":"6dbd240e-8101-4754-83f7-2346292c25e4","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_tSCq_W.png"}}︡
︠244dc534-ca7b-4cde-9f99-9f397afd1845︠
x,y = var('x,y')
P = plot3d(x+y+sin(x*y), (x,-10,10),(y,-10,10), opacity=0.87, color='blue')
Q = plot3d(x-2*y-cos(x*y),(x,-10,10),(y,-10,10),opacity=0.3,color='red')
show(P + Q)
︡ab6f53cb-32f8-4394-bbce-a9674a5594ce︡{"file":{"show":true,"uuid":"5be35e41-2f87-4c7b-8be1-dbce55c0942c","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_DYjWPH.png"}}︡
︠517b7ec5-885a-431c-97e0-53cd0639eea3︠
g = dodecahedron(opacity=.8)
print g
︡0d290b27-fa72-45d2-9dd8-0ac40dae5da4︡{"stdout":"Graphics3d Object\n"}︡
︠4ba0076b-5ef8-4dd7-b3fd-d0146540b827︠
show(g + g.translate((1,0,0)))
︡6a0bcf40-36ad-459c-883c-69d3500324e8︡{"file":{"show":true,"uuid":"5c5ab73f-85dc-4cc8-b0ac-2cfd748c3e3b","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_DMyYUr.png"}}︡
︠7b35508c-53c3-45ed-83ba-49d4a7270e96i︠
%md
## The 3d Plotting Commands

See <http://www.sagemath.org/doc/reference/plot3d>

### Solids

 - platonic solids -- tetrahedron, cube,  octahedron, dodecahedron, icosahedron
 - sphere
 - polygon3d

### 3d Plots
 - cylindrical_plot3d
 - implicit_plot3d
 - list_plot3d
 - parametric_plot3d
 - plot3d
 - revolution_plot3d
 - spherical_plot3d

### Points and lines in 3d

 - arrow3d
 - bezier3d
 - line3d
 - parametric_plot3d
 - plot_vector_field3d
 - point3d
 - text3d -- put text in a plot (doesn't work in tachyon hence in cloud.sagemath, yet)

### Other

 - if g is (almost) any 2d plot, then g.plot3d() will return its image embedded in 3d space.

︡a885d754-6175-48aa-a83f-2768ada4318d︡{"html":"<h2>The 3d Plotting Commands</h2>\n\n<p>See <a href=\"http://www.sagemath.org/doc/reference/plot3d\">http://www.sagemath.org/doc/reference/plot3d</a></p>\n\n<h3>Solids</h3>\n\n<ul>\n<li>platonic solids &#8211; tetrahedron, cube,  octahedron, dodecahedron, icosahedron</li>\n<li>sphere</li>\n<li>polygon3d</li>\n</ul>\n\n<h3>3d Plots</h3>\n\n<ul>\n<li>cylindrical_plot3d</li>\n<li>implicit_plot3d</li>\n<li>list_plot3d</li>\n<li>parametric_plot3d</li>\n<li>plot3d</li>\n<li>revolution_plot3d</li>\n<li>spherical_plot3d</li>\n</ul>\n\n<h3>Points and lines in 3d</h3>\n\n<ul>\n<li>arrow3d</li>\n<li>bezier3d</li>\n<li>line3d</li>\n<li>parametric_plot3d</li>\n<li>plot_vector_field3d</li>\n<li>point3d</li>\n<li>text3d &#8211; put text in a plot (doesn&#8217;t work in tachyon hence in cloud.sagemath, yet)</li>\n</ul>\n\n<h3>Other</h3>\n\n<ul>\n<li>if g is (almost) any 2d plot, then g.plot3d() will return its image embedded in 3d space.</li>\n</ul>\n"}︡
︠9b8c0f95-8475-47d9-aeb3-4c54e4cdf26f︠

for v in [tetrahedron(), cube(), octahedron(color='purple'),
          dodecahedron(color='red'), icosahedron()]:
    show(v,figsize=2)

︡db02fe00-0ec3-4edf-8939-68ee8ee4a87e︡{"file":{"show":true,"uuid":"dee9c4c1-7d9c-4ccf-b1bd-92f32b69f14b","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_6zewDq.png"}}︡{"file":{"show":true,"uuid":"5d15d2d0-91fc-4507-8832-02b0f5e2ca47","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_xGPyEF.png"}}︡{"file":{"show":true,"uuid":"e07153e6-c95b-4c14-a815-dc4061dd1f8d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_AD_Lql.png"}}︡{"file":{"show":true,"uuid":"d9dd5d9a-d504-4b66-beea-ebf490c06e39","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_R8pkYH.png"}}︡{"file":{"show":true,"uuid":"48a6baab-b72e-4ffd-b613-9361cab44c6b","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_Bz3Mjk.png"}}︡
︠722985bc-1a76-479b-ae80-a47cc51116e5︠
# Oragami?
v = [(randrange(-5,5), randrange(-5,5), randrange(-5, 5)) for _ in range(50)]
show(polygon3d(v, opacity=.7), frame=False)
︡ca2e63b4-8424-4f2f-8012-f0dfccb90d1a︡{"file":{"show":true,"uuid":"2d867005-edd5-423a-a124-f32f2ff6610d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_5kSsLL.png"}}︡
︠7fdb50a1-feb2-4f05-9041-7715d94c1d82i︠
%md
### Some Implicit Plots...

(from <http://www.sagemath.org/doc/reference/plot3d/sage/plot/plot3d/implicit_plot3d.html>)
︡8f575e97-88f9-4eb8-93d4-c782c3706df7︡{"html":"<h3>Some Implicit Plots&#8230;</h3>\n\n<p>(from <a href=\"http://www.sagemath.org/doc/reference/plot3d/sage/plot/plot3d/implicit_plot3d.html\">http://www.sagemath.org/doc/reference/plot3d/sage/plot/plot3d/implicit_plot3d.html</a>)</p>\n"}︡
︠67f9324b-58d4-4ad5-a6d5-88dad15955e7︠
var('x,y,z')
T = RDF(golden_ratio)
p = 2 - (cos(x + T*y) + cos(x - T*y) + cos(y + T*z) + cos(y - T*z) + cos(z - T*x) + cos(z + T*x))
r = 4.77
show(implicit_plot3d(p, (x, -r, r),
                     (y, -r, r), (z, -r, r)))
︡658a57b6-c76d-4c02-a91a-2f284158aefc︡{"stdout":"(x, y, z)\n"}︡{"file":{"show":true,"uuid":"d7206509-481b-4313-a072-8f8760cee9e2","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_jLFPkx.png"}}︡
︠0ed76a5c-587e-4e4b-b378-7f4e0b58875e︠
# Kleine bottle
var('x,y,z')
g = implicit_plot3d((x^2+y^2+z^2+2*y-1)*((x^2+y^2+z^2-2*y-1)^2-8*z^2)+16*x*z*(x^2+y^2+z^2-2*y-1),
                (x, -3, 3), (y, -3.1, 3.1), (z, -4, 4), opacity=.8, color='green')
show(g)
︡eaed0401-41f6-4fc2-a7dd-9e3fce0b8621︡{"stdout":"(x, y, z)\n"}︡{"file":{"show":true,"uuid":"d1187650-ae92-4743-82a7-473c4bdf9eda","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_c34SHi.png"}}︡
︠b9029dfe-e280-4f62-8997-7881c7ffbbfai︠
%md
### List plots for data people...
︡b701dac3-028c-44b3-95fb-d0e0c21940df︡{"html":"<h3>List plots for data people&#8230;</h3>\n"}︡
︠7f4d0a18-b668-4177-b08c-590aef367cae︠

pi = float(pi)
m = matrix(RDF, 6, [sin(i^2 + j^2) for i in [0,pi/5,..,pi] for j in [0,pi/5,..,pi]])
show(list_plot3d(m, texture='yellow', frame_aspect_ratio=[1,1,1/3]))
︡560a420e-4bc5-468e-a203-cfe5829b10a7︡{"file":{"show":true,"uuid":"2a77db62-ffcc-49e7-8f02-5bc1fbe155b8","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_i4_nUK.png"}}︡
︠4f144e60-4490-4624-9750-bd8f708bd402︠
g = list_plot3d(m, texture='yellow', interpolation_type='nn',frame_aspect_ratio=[1,1,1/3], num_points=30)
show(g)
︡c7d71f2f-c353-4e89-8df7-93b08378d8fd︡{"file":{"show":true,"uuid":"b1a500aa-d7f4-4679-8ba6-f3f62fe8d009","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_Pbp6OY.png"}}︡
︠05ca19b0-c4e2-46e3-ba54-15bfffdd5021︠
# Any Requests?

︠e5682588-945f-4de1-a116-a8be1ae77b85︠
var('x,y')
B = .1
show(plot3d(x^3-3*x*y^2, (x,-B,B), (y,-B,B)))


︡56334f46-f667-4864-a633-e8b65c06e080︡{"stdout":"(x, y)\n"}︡{"file":{"show":true,"uuid":"3477bbe3-bf53-419e-b733-c90db38b64f5","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/27853/tmp_RpzH_0.png"}}︡
︠8d240eb1-3530-4218-969f-7c5dac7774c8︠





︠f3d4f2e7-9e0c-473a-8171-25cca17aacfdi︠
%md
### History of 3d Graphics in Sage

- At first there was nothing.

- 2006? -- Matplotlib added some fake icky static 3d support.
    - I remember discussing this with John Hunter at Scipy at Caltech.
    - This has evolved over the years.  <http://matplotlib.org/examples/mplot3d>
    - Looking at code (in 2006 at least): a 3d image class derives from 2d image, which breaks "is a".

- 2006 -- Tom Boothby added the [Tachyon ray tracer](http://jedi.ks.uiuc.edu/~johns/raytracer/) to Sage,
and made many pretty plots... but it was often hard work in any particular case.

- 2006 -- Taunted by proprietary closed source Java applet(s) for rendering math objects (e.g., for Mathematica).
Couldn't use, since closed source.  We also tried "Java3d", etc., but it was incredibly, insanely, hard to install.

- 2007 -- Sage won the [Trophees du Libre](http://en.wikipedia.org/wiki/Les_Troph%C3%A9es_du_Libre#4th_edition_-_2007),
which yielded much publicity.  I was reading blog posts *about* Sage, and noticed a 3d rotateable molecule
in the blog itself... this was rendered using [JMOL](http://jmol.sourceforge.net/).

- Dec 2007 -- In prepartion for the Joint Mathematics Meetings trade show in San Diego, Robert Bradshaw and I implemented a full 3d graphics plotting
suite, and figured out how to hack JMOL into serving as a "mathematics objects" renderer.  We came to the meeting with red/blue 3d glasses and a big
TV, which made a good impression on participants.

- 2008-2009 -- 3d graphics rendering code got refined by Jason Grout, Robert Bradshaw, Robert Miller, Carl Witty, Bill Cauchois, Josh Kantor, me, and others (?).
The `fast_float` compiler made plotting some 3d functions a million times (literally!) faster (100 times speed over 3 dimensions).

- 2010 -- Bill Cauchois wrote a wireframe renderer using HTML5's new canvas functionality, as a sort of proof of concept.

- 2010-now -- almost nothing, as far as I can tell, except Jason Grout wrote a small proof-of-concept THREE.js renderer example.

- 2012 -- Java applets fell out of favor, big time.  An example from Apple: [this update disables the Java SE 6 applet plug-in](http://support.apple.com/kb/DL1572?viewlocale=en_US&locale=en_US).  And of course Java applets don't work on iPhones, iPads, Android phones and tablets (!).

- In a few weeks: hopefully new THREE.js based rendering, which will work on ipads, phones, and browsers without java applets.
︡bd8b4305-dfbf-4abb-a562-c722155d37e2︡{"html":"<h3>History of 3d Graphics in Sage</h3>\n\n<ul>\n<li><p>At first there was nothing.</p></li>\n<li><p>2006? &#8211; Matplotlib added some fake icky static 3d support.</p>\n\n<ul>\n<li>I remember discussing this with John Hunter at Scipy at Caltech.</li>\n<li>This has evolved over the years.  <a href=\"http://matplotlib.org/examples/mplot3d\">http://matplotlib.org/examples/mplot3d</a></li>\n<li>Looking at code (in 2006 at least): a 3d image class derives from 2d image, which breaks &#8220;is a&#8221;.</li>\n</ul></li>\n<li><p>2006 &#8211; Tom Boothby added the <a href=\"http://jedi.ks.uiuc.edu/~johns/raytracer/\">Tachyon ray tracer</a> to Sage,\nand made many pretty plots&#8230; but it was often hard work in any particular case.</p></li>\n<li><p>2006 &#8211; Taunted by proprietary closed source Java applet(s) for rendering math objects (e.g., for Mathematica).\nCouldn&#8217;t use, since closed source.  We also tried &#8220;Java3d&#8221;, etc., but it was incredibly, insanely, hard to install.</p></li>\n<li><p>2007 &#8211; Sage won the <a href=\"http://en.wikipedia.org/wiki/Les_Troph%C3%A9es_du_Libre#4th_edition_-_2007\">Trophees du Libre</a>,\nwhich yielded much publicity.  I was reading blog posts <em>about</em> Sage, and noticed a 3d rotateable molecule\nin the blog itself&#8230; this was rendered using <a href=\"http://jmol.sourceforge.net/\">JMOL</a>.</p></li>\n<li><p>Dec 2007 &#8211; In prepartion for the Joint Mathematics Meetings trade show in San Diego, Robert Bradshaw and I implemented a full 3d graphics plotting\nsuite, and figured out how to hack JMOL into serving as a &#8220;mathematics objects&#8221; renderer.  We came to the meeting with red/blue 3d glasses and a big\nTV, which made a good impression on participants.</p></li>\n<li><p>2008-2009 &#8211; 3d graphics rendering code got refined by Jason Grout, Robert Bradshaw, Robert Miller, Carl Witty, Bill Cauchois, Josh Kantor, me, and others (?).\nThe <code>fast_float</code> compiler made plotting some 3d functions a million times (literally!) faster (100 times speed over 3 dimensions).</p></li>\n<li><p>2010 &#8211; Bill Cauchois wrote a wireframe renderer using HTML5&#8217;s new canvas functionality, as a sort of proof of concept.</p></li>\n<li><p>2010-now &#8211; almost nothing, as far as I can tell, except Jason Grout wrote a small proof-of-concept THREE.js renderer example.</p></li>\n<li><p>2012 &#8211; Java applets fell out of favor, big time.  An example from Apple: <a href=\"http://support.apple.com/kb/DL1572?viewlocale=en_US&amp;locale=en_US\">this update disables the Java SE 6 applet plug-in</a>.  And of course Java applets don&#8217;t work on iPhones, iPads, Android phones and tablets (!).</p></li>\n<li><p>In a few weeks: hopefully new THREE.js based rendering, which will work on ipads, phones, and browsers without java applets.</p></li>\n</ul>\n"}︡
︠1c25b368-fdad-4278-8bc9-4df8c52878dci︠
%md
### The Source Code...

<https://github.com/sagemath/sage/tree/master/src/sage/plot/plot3d>
︡0ca8be29-414f-49e3-a1b7-f68f82ac615a︡{"html":"<h3>The Source Code&#8230;</h3>\n\n<p><a href=\"https://github.com/sagemath/sage/tree/master/src/sage/plot/plot3d\">https://github.com/sagemath/sage/tree/master/src/sage/plot/plot3d</a></p>\n"}︡
︠cd8b6c50-8822-46ca-adb8-4ecc49187e36︠


















