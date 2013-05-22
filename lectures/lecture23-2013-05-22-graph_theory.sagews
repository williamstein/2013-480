︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%md

<div class="pull-right"><img src="http://sagemath.org/pix/sage_logo_new.png"></div>

## Lecture 23: Graph Theory in Sage

#### May 22, 2013

1. Remember to start G+ recorder

2. Questions?  Reminder: homework due tonight; new homework.

3. Topic: Graph Theory in Sage


︡85eef684-fe03-4bd8-b3cb-63911daf4457︡{"html":"<div class=\"pull-right\"><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></div>\n\n<h2>Lecture 23: Graph Theory in Sage</h2>\n\n<h4>May 22, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Questions?  Reminder: homework due tonight; new homework.</p></li>\n<li><p>Topic: Graph Theory in Sage</p></li>\n</ol>\n"}︡
︠258cede7-5822-4d8c-ae51-ec4aa277d675i︠
%md
## Definition

A **graph** is a set of vertices connected by edges.

A **directed** graph is a set of vertices with directed edges.

### Let's do a demo with a boring graph...
︡d04d6a18-7755-45e7-8e73-e1de4baf9089︡{"html":"<h2>Definition</h2>\n\n<p>A <strong>graph</strong> is a set of vertices connected by edges.</p>\n\n<p>A <strong>directed</strong> graph is a set of vertices with directed edges.</p>\n\n<h3>Let&#8217;s do a demo with a boring graph&#8230;</h3>\n"}︡
︠1c78b031-7fe0-440f-b626-815fde51d6fbi︠
%md Start with the empty graph:
︡4674442e-8260-4249-aa17-220fd68ad2b0︡{"html":"<p>Start with the empty graph:</p>\n"}︡
︠ba673d16-2204-4cb6-a89b-af38da98a083︠
g = Graph(); g
︡270ea547-8367-490e-bfa1-02ec5b2265ca︡{"stdout":"Graph on 0 vertices"}︡
︠7a2b8539-0053-43f4-a0eb-5114d83047e2︠
type(g)
︡65eb161b-1524-4f6c-b1d6-424cebcb30dd︡{"stdout":"<class 'sage.graphs.graph.Graph'>\n"}︡
︠ac65cffa-ca6d-4453-8801-696d80f30494i︠
%md Add three vertices:
︡6a6960d3-e4d5-4212-b52c-19b324c8fc00︡{"html":"<p>Add three vertices:</p>\n"}︡
︠bd132123-d5e5-45b5-bc6a-6de8dd9a228d︠
g.add_vertex(0)
g.add_vertex(1)
g.add_vertex(2)
g
︡38c52451-bb47-433f-82b6-8457dc99056d︡{"stdout":"Graph on 3 vertices\n"}︡
︠c7256529-0f08-4b45-b92e-cf82fceab624i︠
%md Add an edge between the first two vertices:

︡45247dd6-d934-4946-ac40-218299bedcf9︡{"html":"<p>Add an edge between the first two vertices:</p>\n"}︡
︠21f7b6c7-9f10-4ec1-a6f8-7bc112483356︠
g.add_edge(0,1)
g
︡6c4d957c-5a78-4db0-a1e8-17c10968c58c︡{"stdout":"Graph on 3 vertices\n"}︡
︠d223ab2c-34d0-4517-b3dc-52d9238d0625︠
%md
Plot the graph $g$.  There are *numerous* options to `g.plot(...)`.
However, I hope we will write something better for graph visualization
using [the d3 library](http://d3js.org/) this summer.
︡653850c4-7c86-4980-95b2-47b727eeb5c2︡{"html":"<p>Plot the graph $g$.  There are <em>numerous</em> options to <code>g.plot(...)</code>.\nHowever, I hope we will write something better for graph visualization\nusing <a href=\"http://d3js.org/\">the d3 library</a> this summer.</p>\n"}︡
︠c029eb19-4705-40f6-93b7-cac0cff6c486i︠
md("Here's what D3 looks like...")
html.iframe(url="http://bl.ocks.org/mbostock/4062045")
︡b6438400-1e04-458f-aac9-3ee756ffa4e7︡{"html":"<p>Here&#8217;s what D3 looks like&#8230;</p>\n"}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://bl.ocks.org/mbostock/4062045\"></iframe>"}︡
︠aba8c3c9-1740-4582-a9fb-783adf147d67︠
g.plot().show(figsize=3)
︡94b59e79-9c25-4f8a-9b68-3e3b6a35010b︡{"file":{"show":true,"uuid":"d6421285-34ba-4361-b088-13085af013ff","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/31200/tmp_sutBca.png"}}︡
︠4d5a3bee-2912-4d0e-bade-58d1cdcd59ef︠
g.automorphism_group()
︡8f07b05e-39f8-4edd-8679-3e8f53603b48︡{"stdout":"Permutation Group with generators [(0,1)]\n"}︡
︠ecaedb47-c6c9-4914-9cc9-a466c3c1b82a︠
g.connected_components()
︡01a653c8-adf0-4a8a-b258-9bef0c37934a︡{"stdout":"[[0, 1], [2]]\n"}︡
︠474189c7-a9bb-4bd5-af96-a709fcb64690︠
g.chromatic_number()
︡7084b42e-50a5-4a5f-b364-c589ce68184c︡{"stdout":"2\n"}︡
︠686895b5-9b71-4ec8-9a7d-9abcb2068a72︠
g.adjacency_matrix()
︡8af88816-008a-466e-87eb-44c8401781f0︡{"stdout":"[0 1 0]\n[1 0 0]\n[0 0 0]\n"}︡
︠7200f13d-d46a-4e3e-a3d9-ec5df12168c6︠
g.graph6_string()
︡ea5552da-ff9f-4d74-b35e-e4e02f5b3b70︡{"stdout":"'B_'\n"}︡
︠115a083f-a2b7-42a5-bf4f-d6e0e41670ba︠
g.is_planar()
︡12d1dd37-a806-4860-98c5-3f3ba5f98f53︡{"stdout":"True\n"}︡
︠5a45f819-8fdd-47df-9c16-79ef349dc1b5i︠
%md
## A More Complicated Example...
︡55976f27-8684-4cca-9cd3-b8aa78b1cf84︡{"html":"<h2>A More Complicated Example&#8230;</h2>\n"}︡
︠2970b8e8-8fe4-46fa-8b21-f15adcbb277d︠
graphs.   # [press tab key]
︠73b6e282-70f1-46bf-9af9-11fb576dcb08︠
g = graphs.IcosahedralGraph()
g
︡04f06cb0-594e-428f-9dd6-9ebb8e0ca259︡{"stdout":"Icosahedron: Graph on 12 vertices\n"}︡
︠f48d9a74-abd1-4c53-89f7-a57bf8645c7c︠
g.show(svg=True)
︡435c57c7-f5a0-40a8-bd49-782a3cba326e︡{"file":{"show":true,"uuid":"2b1874a7-7159-4ca2-8059-f20a516f6b33","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_glVIJd.svg"}}︡
︠dac430bd-35ef-45f9-90f2-eacc82955baa︠
G = g.automorphism_group(); G
︡3caa6977-3062-4650-9d5b-2cda8e5bd32f︡{"stdout":"Permutation Group with generators [(1,5)(2,4)(8,11)(9,10), (1,8)(4,10)(5,7)(6,9), (0,1,2,3,10,11)(4,7,5,8,6,9)]\n"}︡
︠72d51d1c-01f0-40c6-9f67-d64eee265158︠
# Bug with cloud.sagemath.com worksheets and GAP not working -- will get fixed soon. (Use command line.)
G.order()
︡95090499-144d-4744-8809-6557242247e6︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup.py\", line 1518, in order\n    if not self.gens() or self.gens() == [self(1)]:\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup.py\", line 651, in __call__\n    return self.identity()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/groups/perm_gps/permgroup.py\", line 907, in identity\n    return self._element_class()([], self, check=True)\n  File \"permgroup_element.pyx\", line 453, in sage.groups.perm_gps.permgroup_element.PermutationGroupElement.__init__ (sage/groups/perm_gps/permgroup_element.c:4611)\n  File \"sage_object.pyx\", line 474, in sage.structure.sage_object.SageObject._gap_ (sage/structure/sage_object.c:4682)\n  File \"sage_object.pyx\", line 450, in sage.structure.sage_object.SageObject._interface_ (sage/structure/sage_object.c:4274)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/interface.py\", line 199, in __call__\n    return cls(self, x, name=name)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/expect.py\", line 1291, in __init__\n    self._name = parent._create(value, name=name)\n"}︡{"stderr":"  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/interface.py\", line 389, in _create\n    self.set(name, value)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/gap.py\", line 1314, in set\n    out = self._eval_line(cmd, allow_use_file=True)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/gap.py\", line 730, in _eval_line\n    self._start()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/interfaces/gap.py\", line 1180, in _start\n    expect.failed_to_start.remove(self.name())\nTypeError: list.remove(x): x not in list\n"}︡
︠1474e4b1-3b38-461f-8600-206fa2da01e8︠
%md
### In a terminal (for now)

    $ sage
    ...
    sage: G = PermutationGroup(['(1,5)(2,4)(8,11)(9,10)', '(1,8)(4,10)(5,7)(6,9)', '(0,1,2,3,10,11)(4,7,5,8,6,9)'], domain=[0..11])
    sage: G.order()
    120
︡25e720b8-60da-4e02-bedb-f3e8a428ae13︡{"html":"<h3>In a terminal (for now)</h3>\n\n<pre><code>$ sage\n...\nsage: G = PermutationGroup(['(1,5)(2,4)(8,11)(9,10)', '(1,8)(4,10)(5,7)(6,9)', '(0,1,2,3,10,11)(4,7,5,8,6,9)'], domain=[0..11])\nsage: G.order()\n120\n</code></pre>\n"}︡
︠ab11285e-ea3e-4e80-a9ca-d0914caa7901︠
g.average_degree()
︡907eb3c5-9e1b-47d1-ae15-2cedf997b0a4︡{"stdout":"5\n"}︡
︠9ffa409f-2893-4392-99c0-eb7b382eb254︠
g.coloring()
︡5e2d62c3-e53a-436a-b1ed-e1e29b6d2aa7︡{"stdout":"[[5, 2, 10], [8, 3, 11], [0, 6, 9], [1, 4, 7]]\n"}︡
︠f9d5cf89-f7da-4035-a8fd-ff1cbfc96419︠
g.is_planar()
︡7ebf48ab-812a-4995-9072-2b6ec5aadc84︡{"stdout":"True\n"}︡
︠77f89960-f0b4-4d49-a05c-633674b61e75︠
g.is_planar(set_pos=True)
g.plot(svg=True)
︡5f4eb6e8-976c-423f-8958-bf71be670e4f︡{"stdout":"True\n"}︡{"stderr":"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/generic_graph.py:14263: DeprecationWarning: You provided svg as an argument to a function which has always silently ignored its inputs. This method may soon be updated so that the method raises an exception instead of this warning, which will break your code : to be on the safe side, update it !\nSee http://trac.sagemath.org/13891 for details.\n  return GraphPlot(graph=self, options=options)\n"}︡{"file":{"show":true,"uuid":"27fda900-1ae1-4142-a4df-82cc245f772f","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_pD6QNa.png"}}︡
︠13874383-b9e7-432f-8456-c92de13616a9i︠
%md
## The Graph Database

 - all graphs with at most 7 vertices

 - you really *must* look at [the documentation](http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html) in order to use this.
︡42e785c0-ad65-4395-8fe1-f2e6f7a7ba8f︡{"html":"<h2>The Graph Database</h2>\n\n<ul>\n<li><p>all graphs with at most 7 vertices</p></li>\n<li><p>you really <em>must</em> look at <a href=\"http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html\">the documentation</a> in order to use this.</p></li>\n</ul>\n"}︡
︠c0539699-efd6-4aa8-aed9-c903d988bec8︠
Q = GraphQuery(display_cols=['graph6','num_vertices','degree_sequence'],num_vertices=['<=',5],min_degree=2)
︡ab5523bf-50e4-48a6-b83f-25423020d5f2︡
︠f7030ca6-a61e-45f0-b1d7-0c50fce10bb3︠
Q.number_of()
︡1bec1dfc-1155-4a0c-bf1a-bf4ead60448b︡{"stdout":"11\n"}︡
︠18f637e8-5dc2-42d1-9fd8-f0d4e664547d︠
Q.show()
︡0620e88b-72ed-44af-9f08-f26459de3eb5︡{"stdout":"Graph6               Num Vertices         Degree Sequence     \n------------------------------------------------------------\nBw                   3                    [2, 2, 2]           \nC]                   4                    [2, 2, 2, 2]        \nC^                   4                    [2, 2, 3, 3]        \nDFw                  5                    [2, 2, 2, 3, 3]     \nDF{                  5                    [2, 2, 2, 4, 4]     \nDK{                  5                    [2, 2, 2, 2, 4]     \nDLo                  5                    [2, 2, 2, 2, 2]     \nDL{                  5                    [2, 2, 3, 3, 4]     \nDNw                  5                    [2, 3, 3, 3, 3]     \nDN{                  5                    [2, 3, 3, 4, 4]     \nDbk                  5                    [2, 2, 2, 3, 3]     \n"}︡
︠c1cdbcfe-6f52-4c3e-94c7-1c26a1e090b4︠
for g in Q.get_graphs_list():
    plot(g).show(figsize=2, svg=True)
︡9f50cefc-f87c-4cca-bd28-38f0f8701d81︡{"file":{"show":true,"uuid":"ff7740ec-82cd-4cc0-8879-03505f8f7a60","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_QQIKP4.svg"}}︡{"file":{"show":true,"uuid":"8fd4392c-e760-4131-8ca0-3e6ae0641964","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_K0XFLV.svg"}}︡{"file":{"show":true,"uuid":"66bc72dd-98fe-439f-822e-767b0951ad04","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_6BqmXS.svg"}}︡{"file":{"show":true,"uuid":"98eb8889-588d-417d-890b-f27d4aa6ef97","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_RWfomg.svg"}}︡{"file":{"show":true,"uuid":"4268a3f0-9f38-49db-9d7d-c377a83084b7","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_6wZLba.svg"}}︡{"file":{"show":true,"uuid":"f77f7aae-be63-495b-82a3-56837a126bc1","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_gJph6w.svg"}}︡{"file":{"show":true,"uuid":"2d0d2b9c-a1a1-4fac-a9d6-fde406f7777f","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_upwcEg.svg"}}︡{"file":{"show":true,"uuid":"7892f62f-0d18-4d0f-89b4-336c56aa0b5b","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_0hyXTh.svg"}}︡{"file":{"show":true,"uuid":"23417f8d-68f4-4748-adf4-acde97fd091c","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_Lq_sjm.svg"}}︡{"file":{"show":true,"uuid":"c342c7ba-a5d6-4577-958e-6c3af98443c5","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_GMlGag.svg"}}︡{"file":{"show":true,"uuid":"8c06be53-fc44-444b-9aa4-1e8f9a6d1f3c","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_COEfDK.svg"}}︡
︠3506cc9f-9108-4b20-916f-c55ffc3aee89i︠
%md

## Graphs in Sage: some history and people

- First few years, developed mainly by Emily Kirkman (UW undergrad) and Robert Miller (UW grad student).  They started by [surveying](http://wiki.sagemath.org/graph_survey) every open/closed source graph theory program they could find at the time, and chose to build mainly  on [NetworkX](http://networkx.github.io/).

- They wrote a lot of new code to integrate with Sage, and make use of Jason Grout's database of graphs (which was part of Grout's Ph.D. thesis work at the time).

- Robert Miller wrote a highly optimized (for certain apps) Cython graph representation, which was much faster than NetworkX's Python dicts, for certain things.

- Robert Miller implemented the [NAUTY](http://cs.anu.edu.au/people/bdm/nauty/) "canonically labeling" algorithm from scratch, since there was no *non-discrimantory* program for doing graph isomorphism and automorphism group testing. "Permission is hereby given for use and/or distribution with the exception of sale for profit or application with nontrivial military significance."  You can see the [author of NAUTY on TV saying that "Bible Codes are Bullshit"](http://www.youtube.com/watch?v=Y1JPjqDc6Qs).


- Rado Kirov wrote a nice graph editor that (sometimes) works in some versions of Sage (see below).

- Robert Bradshaw also helped, e.g., with graph layout code.

- Rado Kirov and Robert Bradshaw both work fulltime at Google, and don't work on graph theory stuff in Sage anymore; Robert Miller works fulltime at [Quid](http://quid.com/), so doesn't work on Sage graph theory.  And Emily is an actuary at Milliman.

- More recently, Nathan Cohen has been doing work on Sage's graph theory.  NetworkX is [being constantly improved](https://github.com/networkx/networkx/commits/master).

︡7c6f8117-7a15-436f-b19c-dc510b896080︡{"html":"<h2>Graphs in Sage: some history and people</h2>\n\n<ul>\n<li><p>First few years, developed mainly by Emily Kirkman (UW undergrad) and Robert Miller (UW grad student).  They started by <a href=\"http://wiki.sagemath.org/graph_survey\">surveying</a> every open/closed source graph theory program they could find at the time, and chose to build mainly  on <a href=\"http://networkx.github.io/\">NetworkX</a>.</p></li>\n<li><p>They wrote a lot of new code to integrate with Sage, and make use of Jason Grout&#8217;s database of graphs (which was part of Grout&#8217;s Ph.D. thesis work at the time).</p></li>\n<li><p>Robert Miller wrote a highly optimized (for certain apps) Cython graph representation, which was much faster than NetworkX&#8217;s Python dicts, for certain things.</p></li>\n<li><p>Robert Miller implemented the <a href=\"http://cs.anu.edu.au/people/bdm/nauty/\">NAUTY</a> &#8220;canonically labeling&#8221; algorithm from scratch, since there was no <em>non-discrimantory</em> program for doing graph isomorphism and automorphism group testing. &#8220;Permission is hereby given for use and/or distribution with the exception of sale for profit or application with nontrivial military significance.&#8221;  You can see the <a href=\"http://www.youtube.com/watch?v=Y1JPjqDc6Qs\">author of NAUTY on TV saying that \"Bible Codes are Bullshit\"</a>.</p></li>\n<li><p>Rado Kirov wrote a nice graph editor that (sometimes) works in some versions of Sage (see below).</p></li>\n<li><p>Robert Bradshaw also helped, e.g., with graph layout code.</p></li>\n<li><p>Rado Kirov and Robert Bradshaw both work fulltime at Google, and don&#8217;t work on graph theory stuff in Sage anymore; Robert Miller works fulltime at <a href=\"http://quid.com/\">Quid</a>, so doesn&#8217;t work on Sage graph theory.  And Emily is an actuary at Milliman.</p></li>\n<li><p>More recently, Nathan Cohen has been doing work on Sage&#8217;s graph theory.  NetworkX is <a href=\"https://github.com/networkx/networkx/commits/master\">being constantly improved</a>.</p></li>\n</ul>\n"}︡
︠46977035-9fc1-41f0-a9f1-77b0866e3d14i︠
%md
## Sage-Combinat

Also, the Sage-combinat project -- to make Sage by far the most powerful system for algebraic combinatorics -- uses and improves graphs in various ways a lot.

For examples, see <http://wiki.sagemath.org/combinat/CoolPictures>

︡202b21b7-23cf-416b-bf68-7c27f43cb9e5︡{"html":"<h2>Sage-Combinat</h2>\n\n<p>Also, the Sage-combinat project &#8211; to make Sage by far the most powerful system for algebraic combinatorics &#8211; uses and improves graphs in various ways a lot.  </p>\n\n<p>For examples, see <a href=\"http://wiki.sagemath.org/combinat/CoolPictures\">http://wiki.sagemath.org/combinat/CoolPictures</a></p>\n"}︡
︠80720adf-9c82-46eb-a126-31558ed46f53︠
W = WeylGroup(['A',2],prefix='s')
G = W.quantum_bruhat_graph()
G.show()
︡ccab5fd4-d78f-47e4-a7dc-3fdb83512081︡{"file":{"show":true,"uuid":"4271db7c-037b-4c60-8e24-00d4f41c22dc","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/5605/tmp_M9JHmc.png"}}︡
︠8d352c53-32e5-4907-b029-118c9432b7a6︠
g = sage.categories.category.category_graph()
g.set_latex_options(format="dot2tex")
view(g, pdflatex=True, tightpage = True)
︡9312a369-0ea7-408a-a40c-0076ef198132︡{"stderr":"Error in lines 3-3\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 2117, in view\n    s = _latex_file_(objects, title=title, sep=sep, tiny=tiny, debug=debug, **latex_options)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 1780, in _latex_file_\n    L = latex(x)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 936, in __call__\n    return LatexExpr(x._latex_())\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/generic_graph.py\", line 630, in _latex_\n    return self.latex_options().latex()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/graph_latex.py\", line 1313, in latex\n    return self.dot2tex_picture()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/graph_latex.py\", line 1345, in dot2tex_picture\n    assert_have_dot2tex()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/dot2tex_utils.py\", line 62, in assert_have_dot2tex\n    raise RuntimeError(missing_error_string)\nRuntimeError: \ndot2tex not available.\n\nPlease see :meth:`sage.graphs.generic_graph.GenericGraph.layout_graphviz`\nfor installation instructions.\n\n"}︡
︠75bfa541-4cd5-4840-9720-81a54a3b9bbf︠

