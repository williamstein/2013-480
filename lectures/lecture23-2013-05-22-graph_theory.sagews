︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%md

<div class="pull-right"><img src="http://sagemath.org/pix/sage_logo_new.png"></div>

## Lecture 23: Graph Theory in Sage

#### May 22, 2013

1. Remember to start G+ recorder

2. Questions?  Reminder: homework due tonight; new homework.  "Hey, how do you upload a PDF to github?!"

3. Topic: Graph Theory in Sage


︡67148d70-77fd-442e-b341-6f72575c8300︡{"html":"<div class=\"pull-right\"><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></div>\n\n<h2>Lecture 23: Graph Theory in Sage</h2>\n\n<h4>May 22, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Questions?  Reminder: homework due tonight; new homework.  &#8220;Hey, how do you upload a PDF to github?!&#8221;</p></li>\n<li><p>Topic: Graph Theory in Sage</p></li>\n</ol>\n"}︡
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
︡58109e2f-1872-4fc2-a162-d759f6c7b3f3︡{"stdout":"Graph on 0 vertices"}︡
︠7a2b8539-0053-43f4-a0eb-5114d83047e2︠
type(g)
︡e26fcd1f-3173-49bf-ab85-fca8308510bc︡{"stdout":"<class 'sage.graphs.graph.Graph'>\n"}︡
︠d1f5c748-7ffd-4ba0-a844-701c967c6cfb︠
g.
︠ac65cffa-ca6d-4453-8801-696d80f30494i︠
%md Add three vertices:
︡6a6960d3-e4d5-4212-b52c-19b324c8fc00︡{"html":"<p>Add three vertices:</p>\n"}︡
︠bd132123-d5e5-45b5-bc6a-6de8dd9a228d︠
g.add_vertex(0)
g.add_vertex(1)
g.add_vertex(2)
g
︡018dfb5a-3314-4bad-80db-56a99119dd0a︡{"stdout":"Graph on 3 vertices\n"}︡
︠c2441673-7a77-4eba-8815-a7c4d0a9e35f︠

︠c7256529-0f08-4b45-b92e-cf82fceab624i︠
%md Add an edge between the first two vertices:

︡45247dd6-d934-4946-ac40-218299bedcf9︡{"html":"<p>Add an edge between the first two vertices:</p>\n"}︡
︠21f7b6c7-9f10-4ec1-a6f8-7bc112483356︠
g.add_edge(0,1)
g
︡439ccfc2-d3cb-4ed7-a270-9ef1b875032a︡{"stdout":"Graph on 3 vertices\n"}︡
︠e1dbe395-8a67-41a8-bfb6-bc5aa237d728︠
g.edges()
︡9c5e6aee-b06a-4eaa-90f3-c1b1da12ee83︡{"stdout":"[(0, 1, None)]\n"}︡
︠d223ab2c-34d0-4517-b3dc-52d9238d0625i︠
%md
Plot the graph $g$.  There are *numerous* options to `g.plot(...)`.
However, I hope we will write something better for graph visualization
using [the d3 library](http://d3js.org/) this summer.
︡653850c4-7c86-4980-95b2-47b727eeb5c2︡{"html":"<p>Plot the graph $g$.  There are <em>numerous</em> options to <code>g.plot(...)</code>.\nHowever, I hope we will write something better for graph visualization\nusing <a href=\"http://d3js.org/\">the d3 library</a> this summer.</p>\n"}︡
︠c029eb19-4705-40f6-93b7-cac0cff6c486︠
md("Here's what D3 looks like...")
html.iframe(url="http://bl.ocks.org/mbostock/4062045")
︡b6438400-1e04-458f-aac9-3ee756ffa4e7︡{"html":"<p>Here&#8217;s what D3 looks like&#8230;</p>\n"}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://bl.ocks.org/mbostock/4062045\"></iframe>"}︡
︠aba8c3c9-1740-4582-a9fb-783adf147d67︠
g.plot().show(figsize=3, svg=True)
︡a97d4d62-4ce5-436f-ae47-d64b611fee52︡{"file":{"show":true,"uuid":"f245e577-bfc1-4fb6-a7b4-b14db4fbddee","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_3bgHkS.svg"}}︡
︠4d5a3bee-2912-4d0e-bade-58d1cdcd59ef︠
g.automorphism_group()
︡815824c9-8cbf-4d58-a7a3-785670ef3f78︡{"stdout":"Permutation Group with generators [(0,1)]\n"}︡
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
︠28065de1-d0fa-4d95-b564-d72874875e5a︠
Graph("B_").plot().show(figsize=3)
︡be7b0ead-a483-450e-8a04-39f721da6f86︡{"file":{"show":true,"uuid":"cf7c467f-e7d7-4a07-9920-ee3df8845e17","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_VQxHLH.png"}}︡
︠115a083f-a2b7-42a5-bf4f-d6e0e41670ba︠
g.is_planar()
︡2cbf1917-7d3c-4a42-ae3c-fadb0794273e︡{"stdout":"True\n"}︡
︠5a45f819-8fdd-47df-9c16-79ef349dc1b5i︠
%md
## A More Complicated Example...
︡55976f27-8684-4cca-9cd3-b8aa78b1cf84︡{"html":"<h2>A More Complicated Example&#8230;</h2>\n"}︡
︠2970b8e8-8fe4-46fa-8b21-f15adcbb277d︠
graphs.HerschelGraph(   # [press tab key]
︠73b6e282-70f1-46bf-9af9-11fb576dcb08︠
g = graphs.IcosahedralGraph()
g
︡a754dc0c-1e54-4df0-b003-448e3803f1ba︡{"stdout":"Icosahedron: Graph on 12 vertices\n"}︡
︠f48d9a74-abd1-4c53-89f7-a57bf8645c7c︠
g.show(svg=True)
︡a6e1203d-ff42-4188-a678-4d2aaded7f59︡{"file":{"show":true,"uuid":"2b1874a7-7159-4ca2-8059-f20a516f6b33","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_b0n2xs.svg"}}︡
︠dac430bd-35ef-45f9-90f2-eacc82955baa︠
G = g.automorphism_group(); G
︡60c6e599-1d0f-4ecf-a9d5-bc1590fc6364︡{"stdout":"Permutation Group with generators [(1,5)(2,4)(8,11)(9,10), (1,8)(4,10)(5,7)(6,9), (0,1,2,3,10,11)(4,7,5,8,6,9)]\n"}︡
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
︡032cd83f-de0c-41f5-868d-f5447dd0a0ad︡{"stdout":"5\n"}︡
︠9ffa409f-2893-4392-99c0-eb7b382eb254︠
g.coloring()
︡befcf150-0fca-4c32-952b-a2d6abb89a4c︡{"stdout":"[[5, 2, 10], [8, 3, 11], [0, 6, 9], [1, 4, 7]]\n"}︡
︠f9d5cf89-f7da-4035-a8fd-ff1cbfc96419︠
g.is_planar()
︡3fb010b3-7311-4a28-be0b-e1c9dbcf50d3︡{"stdout":"True\n"}︡
︠77f89960-f0b4-4d49-a05c-633674b61e75︠
g.is_planar(set_pos=True)
g.plot().show(svg=True)
︡96fe11f0-5578-4198-b3fd-715667350333︡{"stdout":"True\n"}︡{"file":{"show":true,"uuid":"d8a5621c-feb2-48d9-8d73-2708c1590000","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_3dZR53.svg"}}︡
︠7d89bc7f-5f2a-4051-a4be-aee5ecef5c07︠
%javascript

console.log("hi")
︡67957f8e-fbd4-43c3-abd3-2fffb0b20e5e︡{"obj":"{}","javascript":{"coffeescript":false,"code":"\nconsole.log(\"hi\")"},"once":true}︡
︠28f19997-55d6-433e-9f51-1884d9538df7︠
%coffeescript
for i in [0...4]
    console.log i
︡9b924839-6aa8-417a-a5d8-774f8dc41aa9︡{"obj":"{}","javascript":{"coffeescript":true,"code":"for i in [0...4]\n    console.log i"},"once":true}︡
︠7cc957d9-1dbf-494b-b850-0051473a7ab1i︠
%hide
%html



<h1> Hi </h1>
<ul>
    <li>hi there</li>
</ul>
︡b35ffb89-7177-4281-b3bc-5c349ac331c6︡{"html":"\n\n\n<h1> Hi </h1>\n<ul>\n    <li>hi there</li>        \n</ul>"}︡
︠13874383-b9e7-432f-8456-c92de13616a9i︠
%md
## The Graph Database

 - all graphs with at most 7 vertices

 - you really *must* look at [the documentation](http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html) in order to use this.
︡42e785c0-ad65-4395-8fe1-f2e6f7a7ba8f︡{"html":"<h2>The Graph Database</h2>\n\n<ul>\n<li><p>all graphs with at most 7 vertices</p></li>\n<li><p>you really <em>must</em> look at <a href=\"http://www.sagemath.org/doc/reference/graphs/sage/graphs/graph_database.html\">the documentation</a> in order to use this.</p></li>\n</ul>\n"}︡
︠c0539699-efd6-4aa8-aed9-c903d988bec8︠
Q = GraphQuery(display_cols=['graph6','num_vertices','degree_sequence'],num_vertices=['<=',5],min_degree=2)
︡8fd98f13-7090-44c1-9c31-4ad2f206ca60︡
︠f7030ca6-a61e-45f0-b1d7-0c50fce10bb3︠
Q.number_of()
︡a3f3eee2-d61a-4f35-a96d-ada739153f79︡{"stdout":"11\n"}︡
︠18f637e8-5dc2-42d1-9fd8-f0d4e664547d︠
Q.show()
︡0620e88b-72ed-44af-9f08-f26459de3eb5︡{"stdout":"Graph6               Num Vertices         Degree Sequence     \n------------------------------------------------------------\nBw                   3                    [2, 2, 2]           \nC]                   4                    [2, 2, 2, 2]        \nC^                   4                    [2, 2, 3, 3]        \nDFw                  5                    [2, 2, 2, 3, 3]     \nDF{                  5                    [2, 2, 2, 4, 4]     \nDK{                  5                    [2, 2, 2, 2, 4]     \nDLo                  5                    [2, 2, 2, 2, 2]     \nDL{                  5                    [2, 2, 3, 3, 4]     \nDNw                  5                    [2, 3, 3, 3, 3]     \nDN{                  5                    [2, 3, 3, 4, 4]     \nDbk                  5                    [2, 2, 2, 3, 3]     \n"}︡
︠c1cdbcfe-6f52-4c3e-94c7-1c26a1e090b4︠
for g in Q.get_graphs_list():
    plot(g).show(figsize=2, svg=True)
︡a9d26728-6d93-4cc6-bcdd-2c460e8ecfe6︡{"file":{"show":true,"uuid":"fdd5cd6c-a473-4e4a-8d4a-a345bc42153d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_GDdIWO.svg"}}︡{"file":{"show":true,"uuid":"eabf7970-4484-4ea1-a2d8-bb740a55f830","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_BY79qo.svg"}}︡{"file":{"show":true,"uuid":"b333ede2-084f-49b9-99dc-68db03ec94a4","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_aWL4Cx.svg"}}︡{"file":{"show":true,"uuid":"f89c0597-640b-4a1c-82f3-2aa174978e26","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_3b5qsY.svg"}}︡{"file":{"show":true,"uuid":"9e5ed57b-9314-4ff0-b023-b6be94bb0a3e","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_fJo6Ii.svg"}}︡{"file":{"show":true,"uuid":"504c815e-675c-4697-9d7e-a4d0001ba25d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_0VDPqw.svg"}}︡{"file":{"show":true,"uuid":"18c6c58f-1fd5-4747-b638-c9759c4f3430","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp__MLzHU.svg"}}︡{"file":{"show":true,"uuid":"5c77fa97-0ac5-42d5-a22a-94bbdc380c33","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_ZG1sN_.svg"}}︡{"file":{"show":true,"uuid":"6c016d8d-e472-4a2c-a85e-cd8d893eb579","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_nfV_hg.svg"}}︡{"file":{"show":true,"uuid":"83870b8b-2697-42a0-a647-ec008e3a58ac","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_mC4phq.svg"}}︡{"file":{"show":true,"uuid":"86f9bb43-f4a4-40cd-aad7-8822eb07ccbc","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_O_8LA5.svg"}}︡
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
︠770b8f40-0832-4915-850e-2db0c15b0d06︠

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
︡277b53b6-6375-4015-98d8-91395cd19402︡{"file":{"show":true,"uuid":"66279134-7ce2-458c-aa9a-121158415f68","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_XPQ5hy.png"}}︡
︠8d352c53-32e5-4907-b029-118c9432b7a6︠
g = sage.categories.category.category_graph()
g.set_latex_options(format="dot2tex")
view(g, pdflatex=True, tightpage = True)
︡9312a369-0ea7-408a-a40c-0076ef198132︡{"stderr":"Error in lines 3-3\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 2117, in view\n    s = _latex_file_(objects, title=title, sep=sep, tiny=tiny, debug=debug, **latex_options)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 1780, in _latex_file_\n    L = latex(x)\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/misc/latex.py\", line 936, in __call__\n    return LatexExpr(x._latex_())\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/generic_graph.py\", line 630, in _latex_\n    return self.latex_options().latex()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/graph_latex.py\", line 1313, in latex\n    return self.dot2tex_picture()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/graph_latex.py\", line 1345, in dot2tex_picture\n    assert_have_dot2tex()\n  File \"/usr/local/sage/sage-5.10.beta3/local/lib/python2.7/site-packages/sage/graphs/dot2tex_utils.py\", line 62, in assert_have_dot2tex\n    raise RuntimeError(missing_error_string)\nRuntimeError: \ndot2tex not available.\n\nPlease see :meth:`sage.graphs.generic_graph.GenericGraph.layout_graphviz`\nfor installation instructions.\n\n"}︡
︠79b4dc6d-9e75-4f6c-a872-bccef9af5944︠
g = graphs.WorldMap()
g.plot()
︡f6a61627-18bc-4f87-99f8-99e2b94e6d86︡{"file":{"show":true,"uuid":"40c463c6-2de0-4ba1-945d-184b5f19bcf8","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/11111/tmp_olAKhh.png"}}︡
︠97510f30-f010-447d-a85b-7172038db21e︠
v = g.vertices()
︡345d4b03-f007-4103-adb0-792efa8ad0df︡
︠90a421f1-9152-416e-87e0-8b1ab46359f5︠
v[:5]
︡a60ffd6a-38f8-4d94-a664-cddfcee7b165︡{"stdout":"['Afghanistan', 'Akrotiri', 'Albania', 'Algeria', 'Andorra']\n"}︡
︠75bfa541-4cd5-4840-9720-81a54a3b9bbf︠
g.shortest_path(v[0], v[4])
︡5c520581-9cfd-422e-a272-6987f2c85c96︡{"stdout":"['Afghanistan', 'China', 'Russia', 'Poland', 'Germany', 'France', 'Andorra']\n"}︡
︠db27657a-a4f5-4194-ba54-4e5614967b76︠
v[0], v[4]
︡627ded4a-3d61-46bc-b87f-69ee7be4bd08︡{"stdout":"('Afghanistan', 'Andorra')\n"}︡
︠54d36944-928f-43f1-b59c-3fa775a6a273︠
type(v[0])
︡227879f9-96e6-466d-a130-17e22969ff0c︡{"stdout":"<type 'str'>\n"}︡
︠badf023a-e7e6-480f-b061-9cbe4bd36bca︠
[x for x in v if 'United' in x]
︡e19c5c72-f376-455f-850a-a1ea187e2b27︡{"stdout":"['United Arab Emirates', 'United Kingdom', 'United States']\n"}︡
︠2cba241c-b0ac-4e27-a76d-d6763c389181︠
g.shortest_path('United States', 'China')
︡60df759a-1100-46a3-bdb3-4ca984235a76︡{"stdout":"['United States', 'Mexico', 'Guatemala', 'Honduras', 'Nicaragua', 'Costa Rica', 'Panama', 'Colombia', 'Brazil', 'France', 'Germany', 'Poland', 'Russia', 'China']\n"}︡
︠4d0aa73e-8050-4316-a77c-52313ae2acd9︠

︠d0825369-6053-4b3b-a5ef-58b072a8b034︠

︠5a8aacb9-19eb-4626-9e98-347909180942︠
