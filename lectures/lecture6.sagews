︠093af95a-5e21-4fed-91c8-a048668ef973r︠
# Note -- Jason Grout: "You can make an empty tuple with ()"
()
︡d8149447-8228-43f7-94c5-8272988583c7︡{}︡{"stdout":"()"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠64eecbb1-3c1e-4360-8f99-5d5d3b63d1dfr︠
%md
# Lecture 6 (Math 480): Mainly Cython today
### William Stein
### Reminder: start screen recording (I forgot last time)!!!!




Note -- Jason Grout: "You can make an empty tuple with ()"

︡056a7a6e-9f4f-4e3b-a89a-f255062ba081︡{"done":false,"event":"output"}︡{"html":"<h1>Lecture 6 (Math 480):</h1>\n\n<h2>Mainly Cython today</h2>\n\n<h3>William Stein</h3>\n\n<h3>Reminder: start screen recording (I forgot last time)!!!!</h3>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠a9721715-b930-4fc0-8e73-afbc0c9e492br︠
md("""
# Tours of some ways to use Sage

1. Quick tour/tutorial about [sagenb](http://sagenb.org) (and [480 sagenb](http://480.sagenb.org/)) -- this doesn't work well.

1. [sagecell](https://sagecell.sagemath.org/) (and see the embedded examples here: [beezer](http://buzzard.ups.edu/))

1. [cloud.sagemath.org](https://cloud.sagemath.org)
""")





︡6a0e7967-fbcd-4e0c-9e58-af0cf8cccaee︡{"done":false,"event":"output"}︡{"html":"<h1>Tours of some ways to use Sage</h1>\n\n<ol>\n<li><p>Quick tour/tutorial about <a href=\"http://sagenb.org\">sagenb</a> (and <a href=\"http://480.sagenb.org/\">480 sagenb</a>)</p></li>\n<li><p><a href=\"https://sagecell.sagemath.org/\">sagecell</a> (and see the embedded examples here: <a href=\"http://buzzard.ups.edu/\">beezer</a>)</p></li>\n<li><p><a href=\"https://cloud.sagemath.org\">cloud.sagemath.org</a></p></li>\n</ol>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠04b02789-5792-469e-ab96-1f4da57b8da7r︠
%md



# Lecture 7 (2013-04-15) starts here
︡dc832d87-2319-46ef-beb8-8241d8b78c9d︡{}︡{"html":"<h1>Lecture 7 (2013-04-15) starts here</h1>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"stdout":"","done":true}︡
︠80ed9bfa-d726-4f36-9845-b2676818764er︠
type(3)
︡e02f30b2-944f-4a51-864f-1408142b4f84︡{}︡{"stdout":"<type 'sage.rings.integer.Integer'>"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠ffa55359-61e5-4c67-b8ef-543b328e4113r︠
def f(n):
    if not isinstance(n, (int,long, Integer)):    # $$ not free $$
        #raise TypeError("n (=%s) must be an int"%n)
        raise TypeError("n must be an int")
    return n*n
︡f735e621-3973-4107-8beb-dcef7598f5a8︡{}︡{"stdout":"","done":true}︡
︠6da79a6f-daae-45de-961f-9919ad3a4e8ar︠
f(10)
︡d44fbe11-fe82-48fb-aaaf-174d1a5e9749︡{}︡{"stdout":"100"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠d155310d-436b-4144-9771-250141d6bddbr︠
f('20')
︡47d4a3e5-ff5d-4d8a-8954-484fe7d2b94e︡{}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"\", line 3, in f\n"}︡{"stderr":"TypeError: n (=20) must be an int\n"}︡{"stdout":"","done":true}︡
︠871d2765-8178-4909-b000-e6da4ef18e88r︠
def f(int n):
    return n*n
︡d17e1865-9a78-4bf8-821d-941afdb722e7︡{}︡{"stderr":"Error in lines 1-2\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"<string>\", line 1\n"}︡{"stderr":"    def f(int n):\n"}︡{"stderr":"              ^\n"}︡{"stderr":"SyntaxError: invalid syntax\n"}︡{"stdout":"","done":true}︡
︠d05cde98-8f28-436a-9fc1-e845c5cc673er︠
%cython

def f(unsigned int n):
    return n*n

︡2a3d0fd2-5ed0-438b-8819-436fe9dd16b2︡{}︡{"file":{"show":false,"uuid":"b3694cd1-1b3b-414a-8376-10fc61f15c8d","filename":"/home/wstein/.sage/temp/localhost/13551/spyx/_home_wstein__sage_temp_localhost_13551_dir_5fMX1U_a_pyx/_home_wstein__sage_temp_localhost_13551_dir_5fMX1U_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/13551/spyx/_home_wstein__sage_temp_localhost_13551_dir_5fMX1U_a_pyx/_home_wstein__sage_temp_localhost_13551_dir_5fMX1U_a_pyx_0.html?uuid=b3694cd1-1b3b-414a-8376-10fc61f15c8d' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠f0d2f2cf-ab5a-4285-bf62-bc2fe259bdb7r︠
f(39808290)
︡21740bc5-652c-4b0e-9c31-762c50872974︡{}︡{"stdout":"3049388164L"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠6a2b68c5-6f28-4f2f-8869-92ec357f8c92r︠
(39808290*39808290)%(2^32)
︡18c92e18-32e4-4509-9b3a-a7950627cc77︡{}︡{"stdout":"3049388164"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠6de9fb92-b4c8-411d-8eaf-74e3b703d330r︠
%md

# Show command line standalone Python version:

[http://docs.cython.org/src/quickstart/build.html](http://docs.cython.org/src/quickstart/build.html)
︡7956ce7d-fbe6-4877-b3ad-07c1190f2c0f︡{}︡{"html":"<h1>Show command line standalone Python version:</h1>\n\n<p><a href=\"http://docs.cython.org/src/quickstart/build.html\">http://docs.cython.org/src/quickstart/build.html</a></p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"stdout":"","done":true}︡
︠038aa6eb-c2b2-44d9-b580-4ef0e357d29ar︠



︡c9c3e3f5-2595-426a-b3a2-865f01470b18︡{"done":true}︡
︠70c6f581-d95a-44a6-8741-50f64877f30d︠

︠d9e995d9-6c95-46b0-a45e-d9230ef1ca4cr︠

md("""
# Some [Cython](http://www.cython.org/) & Sage History

* 1 -- I found out about [Pyrex](http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/) when I was evaluating using Python as the language for Sage.  I read the [Python/C API reference manual](http://docs.python.org/2/c-api/) on a flight back from Europe and on the plane I started designing something like Pyrex... and was very excited to find it when I got home to Cambridge, MA (in 2004).

* 2 -- I wrote basic fast arithmetic types (e.g., integers/rationals/etc.) and some basic functions for continued fractions (really, "modular symbols") using Pyrex + Python, and was seriously impressed.  I was able to get the same performance as in C with something that was fully usable from the Python interpreter.  Very cool.    This was *absolutely essential* if Sage was to have any chance to compete with Magma, since Magma is mostly written in C, and C usually solidly wins against all other languages speedwise.

* 3 -- [The computer language benchmark game](http://benchmarksgame.alioth.debian.org/).   In this game, a factor of 2-5 slowdown all over is simply not acceptable: people often work *very* hard to make an implementation of some basic math algorithm 2-3 times faster; if the language choice slows things down by a factor of 2-5, such people will be very, very annoyed.  Thus, e.g., even Ocaml, Haskell, and Lisp were not an option as the core language of Sage -- though fast, they are too slow.

""")

︡d0dba4ac-0639-4f26-82b8-83e8c0ed26a9︡{"done":false,"event":"output"}︡{"html":"<h1>Some <a href=\"http://www.cython.org/\">Cython</a> &amp; Sage History</h1>\n\n<ul>\n<li><p>1 -- I found out about <a href=\"http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/\">Pyrex</a> when I was evaluating using Python as the language for Sage.  I read the <a href=\"http://docs.python.org/2/c-api/\">Python/C API reference manual</a> on a flight back from Europe and on the plane I started designing something like Pyrex... and was very excited to find it when I got home to Cambridge, MA (in 2004).</p></li>\n<li><p>2 -- I wrote basic fast arithmetic types (e.g., integers/rationals/etc.) and some basic functions for continued fractions (really, \"modular symbols\") using Pyrex + Python, and was seriously impressed.  I was able to get the same performance as in C with something that was fully usable from the Python interpreter.  Very cool.    This was <em>absolutely essential</em> if Sage was to have any chance to compete with Magma, since Magma is mostly written in C, and C usually solidly wins against all other languages speedwise.</p></li>\n<li><p>3 -- <a href=\"http://benchmarksgame.alioth.debian.org/\">The computer language benchmark game</a>.   In this game, a factor of 2-5 slowdown all over is simply not acceptable: people often work <em>very</em> hard to make an implementation of some basic math algorithm 2-3 times faster; if the language choice slows things down by a factor of 2-5, such people will be very, very annoyed.  Thus, e.g., even Ocaml, Haskell, and Lisp were not an option as the core language of Sage -- though fast, they are too slow.</p></li>\n</ul>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠24d5b057-3498-423a-a214-ad497c28860er︠






md(r"""

* 4 -- I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language "SageX".  It was only available as part of Sage.  The name kind of sucked.

* 5 -- A year later, I read the awesome book <a href="http://producingoss.com/">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name "Cython" (**C** extensions to P**ython**), which was only in use by a British Punk Rocker.    I **made** the main contributors to SageX and Pyrex the lead developers of Cython.

* 6 -- Cython is fairly popular now, especially in the "Scientific Computing using Python" crowd, where it is critical.

<div class="pull-right"><img class="img-rounded" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJckLwkvkncOZE5HK1hkRC3vMfxRbW6BCbFCvDCsl0GHbNR0iU">=<br>One of these blokes is named "Cython"</div>

""")





︡a59d6305-506d-48cf-aeab-46d1ddf99638︡{"done":false,"event":"output"}︡{"html":"<ul>\n<li><p>4 -- I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language \"SageX\".  It was only available as part of Sage.  The name kind of sucked.</p></li>\n<li><p>5 -- A year later, I read the awesome book <a href=\"http://producingoss.com/\">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name \"Cython\" (<strong>C</strong> extensions to P<strong>ython</strong>), which was only in use by a British Punk Rocker.    I <strong>made</strong> the main contributors to SageX and Pyrex the lead developers of Cython.</p></li>\n<li><p>6 -- Cython is fairly popular now, especially in the \"Scientific Computing using Python\" crowd, where it is critical.</p></li>\n</ul>\n\n<div class=\"pull-right\"><img class=\"img-rounded\" src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJckLwkvkncOZE5HK1hkRC3vMfxRbW6BCbFCvDCsl0GHbNR0iU\">=<br>One of these blokes is named \"Cython\"</div>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠18953cec-85e7-4de9-bb63-bd6d2665fda2r︠

%md
# The Rest of this lecture: some very simple Cython examples...






︡0b352188-d3d6-4ebb-bca5-0580846ade59︡{"done":false,"event":"output"}︡{"html":"<h1>The Rest of this lecture: some very simple Cython examples...</h1>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠cda616a5-73fe-421c-81b0-9d6ac151bd5br︠

# A Python Example

def f1(n):
    s = 0
    for i in range(n):
        s += i
    return s

f1(5050)
︡58941052-7591-4053-98ec-f5de8a0b19cb︡{}︡{"stdout":"12748725"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠7bfc1294-37dc-4c8e-9c59-53381aef7355r︠
%timeit f1(5050)
︡463f82bf-623d-4698-a57c-4692dfff969e︡{}︡{"stdout":"25 loops, best of 3: 12.5 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠1efc3ce9-5801-47a4-aacd-191a8f1bfa0er︠
# Same thing, in Cython
%cython

def f2(n):
    s = 0
    for i in range(n):
        s += i
    return s

print f2(5050)
︡bd799821-ae6b-4c1d-984f-2cc8033b77cd︡{}︡{"stdout":"12748725"}︡{"stdout":"\n"}︡{"file":{"show":false,"uuid":"6b227a31-b623-4785-8438-90a120e5fc56","filename":"/home/wstein/.sage/temp/u/6179/spyx/_home_wstein__sage_temp_u_6179_dir_VXz2eZ_a_pyx/_home_wstein__sage_temp_u_6179_dir_VXz2eZ_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/u/6179/spyx/_home_wstein__sage_temp_u_6179_dir_VXz2eZ_a_pyx/_home_wstein__sage_temp_u_6179_dir_VXz2eZ_a_pyx_0.html?uuid=6b227a31-b623-4785-8438-90a120e5fc56' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠3e7d0c3a-c363-4484-be66-a7120979684ar︠
%timeit f2(5050)
︡2d7241af-790d-41b4-9d20-308e7fc66ad6︡{"done":false,"event":"output"}︡{"stdout":"625 loops, best of 3: 167 µs per loop","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠c1d43c00-566f-40de-b981-2c077ed25cd5r︠
# It's 74 times faster
12.5/.167
︡92c539d0-dfbc-4ec5-b2a2-496b14366042︡{}︡{"stdout":"74.8502994011976"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠69b450cc-fa43-4e99-b06a-2a4c188487cbr︠
# Why?
# The Sage preparser---which makes all integers use MPIR---slows
# things down *hugely* for small ints!
# Forcing Python ints instead gives us a big speedup.
# We don't see this with Cython, since Cython doesn't use the preparser.

def f3(n):
    s = int(0)
    for i in range(n):
        s += i
    return s

f3(5050)
%timeit f3(5050)
︡0811a98f-8f08-4b2f-ace7-6163942b31b3︡{}︡{"stdout":"12748725"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 331 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠d87a33af-9c1d-4ab3-9a0d-edff829338d4r︠
# So really, here, Cython is only giving a speedup of a factor
# of 2.   This is typical if you don't do any extra work.
331/167.0
︡ebb80982-ab71-4470-8136-691d2cb66652︡{}︡{"stdout":"1.98203592814371"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠9ddfc09a-ee41-4402-8e92-6a497f68da49r︠
# Cython let's us declare data types, like in the C language (or in Java).
# ENTER: True speed & terrifying danger!
%cython
def f4(int n):
    cdef int i, s = 0
    for i in range(n):
        s += i
    return s

print f4(5050)

︡ab75bcbf-e796-4d80-85d0-d6bcb889cf61︡{}︡{"stdout":"12748725"}︡{"stdout":"\n"}︡{"file":{"show":false,"uuid":"ef868710-03dc-42d6-b152-a9c2ae23837f","filename":"/home/wstein/.sage/temp/u/6179/spyx/_home_wstein__sage_temp_u_6179_dir_fUdcev_a_pyx/_home_wstein__sage_temp_u_6179_dir_fUdcev_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/u/6179/spyx/_home_wstein__sage_temp_u_6179_dir_fUdcev_a_pyx/_home_wstein__sage_temp_u_6179_dir_fUdcev_a_pyx_0.html?uuid=ef868710-03dc-42d6-b152-a9c2ae23837f' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠d826cd0b-1237-4255-b656-49ffd0348e04r︠
%timeit f4(5050)
︡eebc2206-4e3c-4ec0-8b9d-be3706db0652︡{}︡{"stdout":"625 loops, best of 3: 3.41 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠8adb0cb6-47ea-494e-95de-b97efc9bd48ar︠
print "Compared with original Sage implementation: ", 12.5 / .00341
print "Compared with using Python ints", 331/3.41
print "Compared with Cython with no type declarations", 167/3.41
︡726d6e6c-a54b-47f6-a836-bf2380197e14︡{}︡{"stdout":"Compared with original Sage implementation: "}︡{"stdout":" "}︡{"stdout":"3665.68914956012"}︡{"stdout":"\n"}︡{"stdout":"Compared with using Python ints"}︡{"stdout":" "}︡{"stdout":"97.0674486803519"}︡{"stdout":"\n"}︡{"stdout":"Compared with Cython with no type declarations"}︡{"stdout":" "}︡{"stdout":"48.9736070381232"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠f00402d0-1dbf-40c4-9757-31f04bdf0c97r︠
# A slightly bigger test to make sure that the C compiler is not optimizing
# out the loop (it will on some systems).
%timeit f1(50500)
%timeit f2(50500)
%timeit f3(50500)
%timeit f4(50500)
︡ca02c03f-019b-411f-835d-a63c8b0fc0b9︡{}︡{"stdout":"5 loops, best of 3: 127 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"125 loops, best of 3: 1.67 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"125 loops, best of 3: 3.4 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 35.7 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠2a13b61a-f3f5-4648-ae35-ba0e37cd7d2cr︠
# WHAT?    -- silent integer overflow.  Explain.
f4(10000000)
︡85760c40-1d84-4b40-9bae-f74134563378︡{}︡{"stdout":"-2014260032"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠8656cca7-aed5-4499-b97c-0626c995eabe︠
%md

## Cython from the command line (if time permits).












