︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%md

<div class="pull-right"><img src="http://sagemath.org/pix/sage_logo_new.png"></div>

## Lecture 25: Things of Relevance for Student Projects

#### May 29, 2013

0. Last ever homework in here is due tonight at 11:59pm.  Final project presentations are all of next week (not recorded).  You will submit your final project via [this form](https://docs.google.com/forms/d/1bm59TFXIQfEmxP1jOiwszPCG4pRcDvrZP9NLrPr04fE/viewform).

1. Remember to start G+ recorder

2. Topic: [Presentation schedule for next week](https://github.com/williamstein/2013-480/blob/master/final_projects.md)

3. Topic: Developing Sage in cloud.sagemath; an update

4. Topic: @interact -- it works and is very useful for presentations.

5. Topic: %hide, %auto, %md (and latex), %html

6. Topic: Two way interaction in cloud.sagemath -- Javascript <--> Python

7. Topic: What else do you desparately need to know?  I can talk about this Friday.
︡634ad9b2-f154-46de-a2a0-ea9ce321393b︡{"html":"<div class=\"pull-right\"><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></div>\n\n<h2>Lecture 25: Things of Relevance for Student Projects</h2>\n\n<h4>May 29, 2013</h4>\n\n<ol>\n<li><p>Last ever homework in here is due tonight at 11:59pm.  Final project presentations are all of next week (not recorded).  You will submit your final project via <a href=\"https://docs.google.com/forms/d/1bm59TFXIQfEmxP1jOiwszPCG4pRcDvrZP9NLrPr04fE/viewform\">this form</a>.</p></li>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Topic: <a href=\"https://github.com/williamstein/2013-480/blob/master/final_projects.md\">Presentation schedule for next week</a></p></li>\n<li><p>Topic: Developing Sage in cloud.sagemath; an update</p></li>\n<li><p>Topic: @interact &#8211; it works and is very useful for presentations.</p></li>\n<li><p>Topic: %hide, %auto, %md (and latex), %html</p></li>\n<li><p>Topic: Two way interaction in cloud.sagemath &#8211; Javascript &lt;&#8211;> Python</p></li>\n<li><p>Topic: What else do you desparately need to know?  I can talk about this Friday.</p></li>\n</ol>\n"}︡
︠4fb4d1eb-1707-46dd-b49c-45b76810ecdfi︠
%hide
%md

### Some Updates Regarding <https://cloud.sagemath.com>

1. I've finally added the first snapshot feature.  Demo it. This could save your ass.

2. How to build Sage from source code:

        ~\$ wget http://boxen.math.washington.edu/home/sagemath/sage-mirror/src/sage-5.9.tar
        ~\$ tar xf sage-5.9.tar
        ~\$ cd sage-5.9/
        ~/sage-5.9\$ MAKE="make -j8" make > log  2>err         # wait about 1 hour.
        ~/sage-5.9\$ ./sage   # sage should start up fine.
        ...

3. Or, how to install Sage from a binary:

        ~\$ wget figure out url of file for ubuntu 12.04 at http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/index.html
        ~\$ tar xf name of file   # wait 3 minutes (?)
        ~\$ cd name of sage install
        ...

3. To make a patch, you'll need an $HOME/.hgrc file with this in it:

                [ui]
                    username = John Doe <john@example.com>

        ~\$ cd; nano .hgrc
︡0ec16593-85f9-4570-9eef-eacc686d5aa0︡{"html":"<h3>Some Updates Regarding <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a></h3>\n\n<ol>\n<li><p>I&#8217;ve finally added the first snapshot feature.  Demo it. This could save your ass.</p></li>\n<li><p>How to build Sage from source code:</p>\n\n<pre><code>~\\$ wget http://boxen.math.washington.edu/home/sagemath/sage-mirror/src/sage-5.9.tar\n~\\$ tar xf sage-5.9.tar\n~\\$ cd sage-5.9/\n~/sage-5.9\\$ MAKE=\"make -j8\" make &gt; log  2&gt;err         # wait about 1 hour.\n~/sage-5.9\\$ ./sage   # sage should start up fine.\n...\n</code></pre></li>\n<li><p>Or, how to install Sage from a binary:</p>\n\n<pre><code>~\\$ wget figure out url of file for ubuntu 12.04 at http://boxen.math.washington.edu/home/sagemath/sage-mirror/linux/64bit/index.html\n~\\$ tar xf name of file   # wait 3 minutes (?)\n~\\$ cd name of sage install\n...\n</code></pre></li>\n<li><p>To make a patch, you&#8217;ll need an $HOME/.hgrc file with this in it:</p>\n\n<pre><code>        [ui]\n            username = John Doe &lt;john@example.com&gt;\n\n~\\$ cd; nano .hgrc\n</code></pre></li>\n</ol>\n"}︡
︠1605472d-9d1f-4f5e-b675-4df23d3296f1i︠
%hide
%md
### @interact

Just a reminder, this works and is very, very useful for presentations!

#### Some examples are here

 - <http://interact.sagemath.org/top-rated-posts>
 - <http://wiki.sagemath.org/interact>
︡67ba8109-4fbf-44e5-b939-07111bfee5da︡{"html":"<h3>@interact</h3>\n\n<p>Just a reminder, this works and is very, very useful for presentations!</p>\n\n<h4>Some examples are here</h4>\n\n<ul>\n<li><a href=\"http://interact.sagemath.org/top-rated-posts\">http://interact.sagemath.org/top-rated-posts</a></li>\n<li><a href=\"http://wiki.sagemath.org/interact\">http://wiki.sagemath.org/interact</a></li>\n</ul>\n"}︡
︠ce9fe20f-75fa-47c5-8fbe-742976b6c244o︠
help(interact)
︡f1fcf1bc-e885-4fb7-839b-1803aaa93dfa︡{"stdout":"Help on Interact in module sage_salvus object:\n\nclass Interact(__builtin__.object)\n |  Use interact to create interactive worksheet cells with sliders,\n |  text boxes, radio buttons, check boxes, color selectors, and more.\n |  \n |  Put ``@interact`` on the line before a function definition in a\n |  cell by itself, and choose appropriate defaults for the variable\n |  names to determine the types of controls (see tables below).  You\n |  may also put ``@interact(layout=...)`` to control the layout of\n |  controls.    Within the function, you may explicitly set the value\n |  of the control corresponding to a variable foo to bar by typing\n |  interact.foo = bar.\n |  \n |  Type \"interact.controls.[tab]\" to get access to all of the controls.\n |  \n |  INPUT:\n |  \n |  - ``f`` -- function\n |  - ``width`` -- number, or string such as '80%', '300px', '20em'.\n |  - ``style`` -- CSS style string, which allows you to change the border,\n |    background color, etc., of the interact.\n |  - ``update_args`` -- (default: None); list of strings, so that\n |    only changing the corresponding controls causes the function to\n |    be re-evaluated; changing other controls will not cause an update.\n |  - ``auto_update`` -- (default: True); if False, a button labeled\n |    'Update' will appear which you can click on to re-evalute.\n |  - ``layout`` -- (default: one control per row) a list [row0,\n |    row1, ...] of lists of tuples row0 = [(var_name, width,\n |    label), ...], where the var_name's are strings, the widths\n |    must add up to at most 12, and the label is optional.  This\n |    will layout all of the controls and output using Twitter\n |    Bootstraps \"Fluid layout\", with spans corresponding\n |    to the widths.   Use var_name='' to specify where the output\n |    goes, if you don't want it to last.  You may specify entries for\n |    controls that you will create later using interact.var_name = foo.\n |  \n |  \n |  NOTES: The flicker and layout options above are only in SALVUS.\n |      For backwards compatibility with the Sage notebook, if layout\n |      is a dictionary (with keys 'top', 'bottom', 'left', 'right'),\n |      then the appropriate layout will be rendered as it used to be\n |      in the Sage notebook.\n |  \n |  OUTPUT:\n |  \n |  - creates an interactive control.\n |  \n |  \n |  AUTOMATIC CONTROL RULES\n |  -----------------------\n |  \n |  There are also some defaults that allow you to make controls\n |  automatically without having to explicitly specify them.  E.g.,\n |  you can make ``x`` a continuous slider of values between ``u`` and\n |  ``v`` by just writing ``x=(u,v)`` in the argument list.\n |  \n |  - ``u`` - blank input_box\n |  - ``u=elt`` - input_box with ``default=element``, unless other rule below\n |  - ``u=(umin,umax)`` - continuous slider (really `100` steps)\n |  - ``u=(umin,umax,du)`` - slider with step size ``du``\n |  - ``u=list`` - buttons if ``len(list)`` at most `5`; otherwise, drop down\n |  - ``u=generator`` - a slider (up to `10000` steps)\n |  - ``u=bool`` - a checkbox\n |  - ``u=Color('blue')`` - a color selector; returns ``Color`` object\n |  - ``u=matrix`` - an ``input_grid`` with ``to_value`` set to\n |    ``matrix.parent()`` and default values given by the matrix\n |  - ``u=(default, v)`` - ``v`` anything as above, with given ``default`` value\n |  - ``u=(label, v)`` - ``v`` anything as above, with given ``label`` (a string)\n |  \n |  EXAMPLES:\n |  \n |  \n |  The layout option::\n |  \n |      @interact(layout={'top': [['a', 'b']], 'left': [['c']],\n |                        'bottom': [['d']], 'right':[['e']]})\n |      def _(a=x^2, b=(0..20), c=100, d=x+1, e=sin(2)):\n |          print a+b+c+d+e\n |  \n |  We illustrate some features that are only in Salvus, not in the\n |  Sage cell server or Sage notebook.\n |  \n |  You can set the value of a control called foo to 100 using\n |  interact.foo=100. For example::\n |  \n |      @interact\n |      def f(n=20, twice=None):\n |          interact.twice = int(n)*2\n |  \n |  \n |  In this example, we create and delete multiple controls depending\n |  on properties of the input::\n |  \n |      @interact\n |      def f(n=20, **kwds):\n |          print kwds\n |          n = Integer(n)\n |          if n % 2 == 1:\n |              del interact.half\n |          else:\n |              interact.half = input_box(n/2, readonly=True)\n |          if n.is_prime():\n |              interact.is_prime = input_box('True', readonly=True)\n |          else:\n |              del interact.is_prime\n |  \n |  You can access the value of a control associated to a variable foo\n |  that you create using interact.foo, and check whether there is a\n |  control associated to a given variable name using hasattr::\n |  \n |      @interact\n |      def f():\n |          if not hasattr(interact, 'foo'):\n |              interact.foo = 'hello'\n |          else:\n |              print interact.foo\n |  \n |  An indecisive interact::\n |  \n |      @interact\n |      def f(n=selector(['yes', 'no'])):\n |          for i in range(5):\n |              interact.n = i%2\n |              sleep(.2)\n |  \n |  We use the style option to make a holiday interact::\n |  \n |      @interact(width=25,\n |                style=\"background-color:lightgreen; border:5px dashed red;\")\n |      def f(x=button('Merry ...',width=20)):\n |          pass\n |  \n |  We make a little box that can be dragged around, resized, and is\n |  updated via a computation (in this case, counting primes)::\n |  \n |      @interact(width=30,\n |          style=\"background-color:lightorange; position:absolute; z-index:1000; box-shadow : 8px 8px 4px #888;\")\n |      def f(prime=text_control(label=\"Counting primes: \")):\n |          salvus.javascript(\"cell.element.closest('.salvus-cell-output-interact').draggable().resizable()\")\n |          p = 2\n |          c = 1\n |          while True:\n |              interact.prime = '%s, %.2f'%(p, float(c)/p)\n |              p = next_prime(p)\n |              c += 1\n |              sleep(.25)\n |  \n |  Methods defined here:\n |  \n |  __call__(self, f=None, layout=None, width=None, style=None, update_args=None, auto_update=True, flicker=False, output=True)\n |  \n |  __delattr__(self, arg)\n |  \n |  __getattr__(self, arg)\n |  \n |  __setattr__(self, arg, value)\n |  \n |  changed(self)\n |      Return the variables that changed since last evaluation of the interact function\n |      body.  [SALVUS only]\n |      \n |      For example::\n |      \n |          @interact\n |          def f(n=True, m=False, xyz=[1,2,3]):\n |              print n, m, xyz, interact.changed()\n |  \n |  ----------------------------------------------------------------------\n |  Data descriptors defined here:\n |  \n |  __dict__\n |      dictionary for instance variables (if defined)\n |  \n |  __weakref__\n |      list of weak references to the object (if defined)\n |  \n |  ----------------------------------------------------------------------\n |  Data and other attributes defined here:\n |  \n |  controls = <sage_salvus.Controls instance>\n"}︡
︠34a081f0-0500-45d0-a6d0-c54d89c83ee1i︠
%hide
%md

### Some Useful Cell decorators

 - %hide -- hides the input that produces some output (you can also click a button at the top to do this)

 - %auto -- put at top of a cell so that the code in the cell is executed when that worksheet is first loaded, started or restarted.

 - %md -- put markdown in a cell.  You may put math in $'s, $$'s, or in \[ and \]'s (which currently works better in some cases).

 - %html -- a way to put any HTML (hence Javascript, CSS, etc. too!) in a worksheet

 You can also use these as normal functions, e.g., md(string) and html(string).  Thus any way of making nice HTML (say) output display in html will work.
︡a05ebf89-a609-41fc-aa9b-a731fd59f5c5︡{"html":"<h3>Some Useful Cell decorators</h3>\n\n<ul>\n<li><p>%hide &#8211; hides the input that produces some output (you can also click a button at the top to do this)</p></li>\n<li><p>%auto &#8211; put at top of a cell so that the code in the cell is executed when that worksheet is first loaded, started or restarted.</p></li>\n<li><p>%md &#8211; put markdown in a cell.  You may put math in $'s, $$&#8217;s, or in [ and ]&#8217;s (which currently works better in some cases).</p></li>\n<li><p>%html &#8211; a way to put any HTML (hence Javascript, CSS, etc. too!) in a worksheet</p>\n\n<p>You can also use these as normal functions, e.g., md(string) and html(string).  Thus any way of making nice HTML (say) output display in html will work.</p></li>\n</ul>\n"}︡
︠1df45139-53c9-46d7-a26d-67591afc1261i︠
%hide
%md

### Two way interaction in cloud.sagemath – Javascript <–> Python

This is a feature that students always asked for with <http://sagenb.org> for final presentations, but it doesn't have.

Fortunately, it is possible in <https:// cloud.sagemath.org>, though still slightly funny (this will improve!)

### Control the browser from Python using either of these functions.

  - javascript
  - coffeescript

### Execute code in Python from the browser using this from javascript

(The extra worksheet will work, but won't be necessary soon...)

  - `worksheet.worksheet.execute_code`


Examples to illustrate this:
︡ef3bbaea-a82b-41c8-9edb-be590988de2a︡{"html":"<h3>Two way interaction in cloud.sagemath – Javascript &lt;–&gt; Python</h3>\n\n<p>This is a feature that students always asked for with <a href=\"http://sagenb.org\">http://sagenb.org</a> for final presentations, but it doesn&#8217;t have.</p>\n\n<p>Fortunately, it is possible in <https:// cloud.sagemath.org>, though still slightly funny (this will improve!)</p>\n\n<h3>Control the browser from Python using either of these functions.</h3>\n\n<ul>\n<li>javascript</li>\n<li>coffeescript</li>\n</ul>\n\n<h3>Execute code in Python from the browser using this from javascript</h3>\n\n<p>(The extra worksheet will work, but won&#8217;t be necessary soon&#8230;)</p>\n\n<ul>\n<li><code>worksheet.worksheet.execute_code</code></li>\n</ul>\n\n<p>Examples to illustrate this:</p>\n"}︡
︠a19c5bbd-59bc-42ae-89ec-75647769cdae︠
javascript("console.log('hi')")  # look in javascript debugger

# message at top of screen for 1 second:
javascript("alert_message({message:'hello there', timeout:1})")
︡ee6b7933-c6fa-44d5-9ad3-d121f6feb158︡{"obj":"{}","javascript":{"coffeescript":false,"code":"console.log('hi')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"alert_message({message:'hello there', timeout:1})"},"once":true}︡
︠4319b023-893a-4529-8a3c-d7224ecce012︠
%html
Answer: <span id="foobar">great</span>.
︡437bffd9-b57e-4c1a-bca0-05ed7259ac42︡{"html":"Answer: <span id=\"foobar\">great</span>."}︡
︠63d8f92f-8311-4427-8e79-08b7bc211d00︠
for i in range(5):
    javascript("$('#foobar').html('<b>number %s</b>')"%i)
    sleep(1)
︡6ca8d69f-b6eb-4699-914a-84a16dc35e7a︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$('#foobar').html('<b>number 0</b>')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$('#foobar').html('<b>number 1</b>')"},"once":true}︡{"stdout":"\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$('#foobar').html('<b>number 2</b>')"},"once":true}︡{"stdout":"\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$('#foobar').html('<b>number 3</b>')"},"once":true}︡{"stdout":"\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$('#foobar').html('<b>number 4</b>')"},"once":true}︡{"stdout":"\n"}︡
︠cf2f84eb-a1c8-4909-b333-54c11bf1f704︠
# Finally, run Python code from Javascript
a = 10
a
︡a5247893-dae7-44fe-ba51-32377559e9d0︡{"stdout":"10\n"}︡
︠d1137184-d45d-4ed4-9045-6984eac49fc8︠
%javascript

function cb() {
    alert_message({message:"code execution"});
}

worksheet.worksheet.execute_code({code:"a = 20", cb:cb})

︡27aa97ff-d930-4194-8b30-d2d0b97783dd︡{"obj":"{}","javascript":{"coffeescript":false,"code":"\nfunction cb() {\n    alert_message({message:\"code execution\"});\n}\n\nworksheet.worksheet.execute_code({code:\"a = 20\", cb:cb})"},"once":true}︡
︠1be599a8-685b-49d3-8e21-edb624344800︠
a
︡7fdd6538-a92c-432e-8b10-51d2ddefe868︡{"stdout":"20\n"}︡
︠ac91355b-8fae-4253-8d2c-c7b98241b035︠
html('<div class="my-button btn">click me</div>')
javascript("""
  $('.my-button').click(
      function() {
          worksheet.worksheet.execute_code({code:'a=a*a'});
      }
  )
""")
︡5255dfaa-4a24-4f12-bc51-1908287e39ab︡{"html":"<div class=\"my-button btn\">click me</div>"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"\n  $('.my-button').click(\n      function() { \n          worksheet.worksheet.execute_code({code:'a=a*a'});\n      }\n  )\n"},"once":true}︡
︠92b71657-d999-4c32-80c6-a49c3c00e810︠
a
︡61a2ac53-fa21-408f-8e56-6afc53fbc599︡{"stdout":"20\n"}︡
︠777fd5e4-e9e6-4da0-b7c4-189ef90ad058︠
a
︡e9c059cc-2e68-4ce7-8101-5cb94f7823cd︡{"stdout":"400\n"}︡
︠f038db14-d1da-4c73-98ed-442d9f95ec96︠


















