
︠64eecbb1-3c1e-4360-8f99-5d5d3b63d1dfr︠
%md
# Lecture 6 (Math 480):
## Mainly Cython today
### William Stein
### Reminder: start screen recording (I forgot last time)!!!!
︡d6b04e70-1daa-4e01-bd4c-7915d9927ccd︡{"done":false,"event":"output"}︡{"html":"<h1>Lecture 6 (Math 480):</h1>\n\n<h2>Mainly Cython today</h2>\n\n<h3>William Stein</h3>\n\n<h3>Reminder: start screen recording (I forgot last time)!!!!</h3>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠a9721715-b930-4fc0-8e73-afbc0c9e492br︠
md("""
# Tours of some ways to use Sage

1. Quick tour/tutorial about [sagenb](http://sagenb.org) (and [480 sagenb](http://480.sagenb.org/))

1. [sagecell](https://sagecell.sagemath.org/) (and see the embedded examples here: [beezer](http://buzzard.ups.edu/))

1. [cloud.sagemath.org](https://cloud.sagemath.org)
""")
︡6a0e7967-fbcd-4e0c-9e58-af0cf8cccaee︡{"done":false,"event":"output"}︡{"html":"<h1>Tours of some ways to use Sage</h1>\n\n<ol>\n<li><p>Quick tour/tutorial about <a href=\"http://sagenb.org\">sagenb</a> (and <a href=\"http://480.sagenb.org/\">480 sagenb</a>)</p></li>\n<li><p><a href=\"https://sagecell.sagemath.org/\">sagecell</a> (and see the embedded examples here: <a href=\"http://buzzard.ups.edu/\">beezer</a>)</p></li>\n<li><p><a href=\"https://cloud.sagemath.org\">cloud.sagemath.org</a></p></li>\n</ol>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠d9e995d9-6c95-46b0-a45e-d9230ef1ca4cr︠

md("""
# History of [cython](http://www.cython.org/)

1. I found out about [Pyrex](http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/) when I was evaluating using Python as the language for Sage.  I read the [Python/C API reference manual](http://docs.python.org/2/c-api/) on a flight back from Europe and on the plane I started designing something like Pyrex... and was very excited to find it when I got home to Cambridge, MA (in 2004).

2. I wrote basic fast arithmetic types (e.g., integers/rationals/etc.) and some basic functions for continued fractions (really, "modular symbols") using Pyrex + Python, and was seriously impressed.  I was able to get the same performance as in C with something that was fully usable from the Python interpreter.  Very cool.    This was *absolutely essential* if Sage was to have any chance to compete with Magma, since Magma is mostly written in C, and C usually solidly wins against all other languages speedwise.

3. [The computer language benchmark game](http://benchmarksgame.alioth.debian.org/).   In this game, a factor of 2-5 slowdown all over is simply not acceptable: people often work *very* hard to make an implementation of some basic math algorithm 2-3 times faster; if the language choice slows things down by a factor of 2-5, such people will be very, very annoyed.  Thus, e.g., even Ocaml, Haskell, and Lisp were not an option as the core language of Sage -- though fast, they are too slow.

4. I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language \"SageX\".  It was only available as part of Sage.  The name kind of sucked.

5. A year later, I read the awesome book <a href=\"http://producingoss.com/\">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name \"Cython\" (<strong>C</strong> extensions to P<strong>ython</strong>), which was only in use by a British Punk Rocker.    I <strong>made</strong> the main contributors to SageX and Pyrex the lead developers of Cython.</p></li>\n<li><p>Cython is fairly popular now, especially in the \"Scientific Computing using Python\" crowd, where it is critical.

<div class=\"pull-right\">\n<img class=\"img-rounded\" src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJckLwkvkncOZE5HK1hkRC3vMfxRbW6BCbFCvDCsl0GHbNR0iU\"><br>\nOne of these blokes is named \"Cython\"\n</div>

""")
︡92c57bb8-2d14-4a95-807b-837c66f8b3b6︡{"done":false,"event":"output"}︡{"html":"<h1>History of <a href=\"http://www.cython.org/\">cython</a></h1>\n\n<ol>\n<li><p>I found out about <a href=\"http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/\">Pyrex</a> when I was evaluating using Python as the language for Sage.  I read the <a href=\"http://docs.python.org/2/c-api/\">Python/C API reference manual</a> on a flight back from Europe and on the plane I started designing something like Pyrex... and was very excited to find it when I got home to Cambridge, MA (in 2004).</p></li>\n<li><p>I wrote basic fast arithmetic types (e.g., integers/rationals/etc.) and some basic functions for continued fractions (really, \"modular symbols\") using Pyrex + Python, and was seriously impressed.  I was able to get the same performance as in C with something that was fully usable from the Python interpreter.  Very cool.    This was <em>absolutely essential</em> if Sage was to have any chance to compete with Magma, since Magma is mostly written in C, and C usually solidly wins against all other languages speedwise.</p></li>\n<li><p><a href=\"http://benchmarksgame.alioth.debian.org/\">The computer language benchmark game</a>.   In this game, a factor of 2-5 slowdown all over is simply not acceptable: people often work <em>very</em> hard to make an implementation of some basic math algorithm 2-3 times faster; if the language choice slows things down by a factor of 2-5, such people will be very, very annoyed.  Thus, e.g., even Ocaml, Haskell, and Lisp were not an option as the core language of Sage -- though fast, they are too slow.</p></li>\n<li><p>I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language \"SageX\".  It was only available as part of Sage.  The name kind of sucked.</p></li>\n<li><p>A year later, I read the awesome book <a href=\"http://producingoss.com/\">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name \"Cython\" (<strong>C</strong> extensions to P<strong>ython</strong>), which was only in use by a British Punk Rocker.    I <strong>made</strong> the main contributors to SageX and Pyrex the lead developers of Cython.</p></li>\n<li><p>Cython is fairly popular now, especially in the \"Scientific Computing using Python\" crowd, where it is critical.</p></li>\n</ol>\n\n<div class=\"pull-right\">\n<img class=\"img-rounded\" src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJckLwkvkncOZE5HK1hkRC3vMfxRbW6BCbFCvDCsl0GHbNR0iU\"><br>\nOne of these blokes is named \"Cython\"\n</div>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠24d5b057-3498-423a-a214-ad497c28860er︠
md(r"""

* 4. I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language \"SageX\".  It was only available as part of Sage.  The name kind of sucked.

* 5. A year later, I read the awesome book <a href=\"http://producingoss.com/\">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name \"Cython\" (<strong>C</strong> extensions to P<strong>ython</strong>), which was only in use by a British Punk Rocker.    I <strong>made</strong> the main contributors to SageX and Pyrex the lead developers of Cython.

* 6. Cython is fairly popular now, especially in the \"Scientific Computing using Python\" crowd, where it is critical.


""")





︡707f0a30-06e6-47a2-ab76-5b18af3f8f8f︡{"done":false,"event":"output"}︡{"html":"<ol>\n<li><p>I started writing a LOT of code in Pyrex, and running into serious issues with it, which upstream didn't agree with.  Soon, I think Sage became (and is still now) the biggest project using this language.  So I forked it, and we called the forked language \\\"SageX\\\".  It was only available as part of Sage.  The name kind of sucked.</p></li>\n<li><p>A year later, I read the awesome book <a href=\\\"http://producingoss.com/\\\">http://producingoss.com/</a>, which I highly recommend, and it made me rethink SageX.  I came up with the name \\\"Cython\\\" (<strong>C</strong> extensions to P<strong>ython</strong>), which was only in use by a British Punk Rocker.    I <strong>made</strong> the main contributors to SageX and Pyrex the lead developers of Cython.</p></li>\n<li><p>Cython is fairly popular now, especially in the \\\"Scientific Computing using Python\\\" crowd, where it is critical.</p></li>\n</ol>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠18953cec-85e7-4de9-bb63-bd6d2665fda2︠