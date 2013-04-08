
︠a2f091d1-699f-473e-8a6a-8b0fa7fe2778r︠md("""
# Today's Goals:
## 1. More about Python Functions
## 2. Start Python Classes -- defining your own type of objects


* Coming up: exception handling (try/except/finally); modules (putting your code in files); packing your code up to distribute.

* After that: **Cython**

(Remind me to start the **screencast**!)

""")




︡1b0d1002-144e-4da2-9583-e1c43193a320︡{"done":false,"event":"output"}︡{"html":"<h1>Today's Goals:</h1>\n\n<h2>1. More about Python Functions</h2>\n\n<h2>2. Start Python Classes -- defining your own type of objects</h2>\n\n<ul>\n<li><p>Coming up: modules (putting your code in files); packing your code up to distribute.</p></li>\n<li><p>After that: <strong>Cython</strong></p></li>\n</ul>\n\n<p>(Remind me to start the <strong>screencast</strong>!)</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠5910d639-455d-4cdc-a6f5-a1e82a946d11r︠







md("""

# Variable number of arguments: *args and **kwds

* Python is very dynamic language, so it is useful to be able to create functions that can take any number of arguments
* ... and also it is useful to call functions with any numbers of positional and keyword arguments.

Python has a fairly straightforward way to do this.  When this function is called all the positional arguments after x,y get assigned to the tuple "args", and all keywoard arguments get put in the dictionary "kwds".
    def f(x, y, *args, **kwds):

Similarly, for this one, the keywoard arguments after foo get put in "kwds".
    def f(x, y, foo='bar', **kwds):

If args is a tuple and kwds a dictionary, and you write
    f(1, 7, *args, **kwds)

then f will get called with positional inputs 1,7, each of the entries in args as additional position inputs, then the entries in kwds as keyword arguments.
""")










︡f10c2f84-735d-4a27-9055-c4623da1b59b︡{"done":false,"event":"output"}︡{"html":"<h1>Variable number of arguments: <em>args and *</em>kwds</h1>\n\n<ul>\n<li>Python is very dynamic language, so it is useful to be able to create functions that can take any number of arguments</li>\n<li>... and also it is useful to call functions with any numbers of positional and keyword arguments.</li>\n</ul>\n\n<p>Python has a fairly straightforward way to do this.  When this function is called all the positional arguments after x,y get assigned to the tuple \"args\", and all keywoard arguments get put in the dictionary \"kwds\".\n    def f(x, y, <em>args, *</em>kwds):</p>\n\n<p>Similarly, for this one, the keywoard arguments after foo get put in \"kwds\".\n    def f(x, y, foo='bar', **kwds):</p>\n\n<p>If args is a tuple and kwds a dictionary, and you write\n    f(1, 7, <em>args, *</em>kwds)    </p>\n\n<p>then f will get called with positional inputs 1,7, each of the entries in args as additional position inputs, then the entries in kwds as keyword arguments.</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠6b7fd8d4-f32f-4826-81a9-533b8564b80dr︠def f(x, y, *args, **kwds):
    print locals()

f(2,3, 5, abc=12)
︡abb9f59e-8090-41d9-bc0f-d9f10d7f6f51︡{"done":false,"event":"output"}︡{"stdout":"{'y': 3, 'x': 2, 'args': (5,), 'kwds': {'abc': 12}}","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠8702e82d-6525-4f37-8d02-04d6e3614afer︠
f('hello', 'y', a=5, bc=17)
︡64785f46-c745-40b9-a4d0-ac80c18573bb︡{"done":false,"event":"output"}︡{"stdout":"{'y': 'y', 'x': 'hello', 'args': (), 'kwds': {'a': 5, 'bc': 17}}","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠ff36e3fd-748e-41e2-949e-0be1eab62680r︠
args = (1,2);  kwds={'stuff':123}
f(*args, **kwds)
︡8050f3ad-78a1-49f0-bb72-64b6c431982e︡{"done":false,"event":"output"}︡{"stdout":"{'y': 2, 'x': 1, 'args': (), 'kwds': {'stuff': 123}}","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠46efc1b6-436d-496c-a9fd-d5fdce0fe50cr︠
%md

## DANGER: Keywords are strings! They *must* be valid identifiers

A potentially annoying limitation is that the kwds must be strings and must be valid identifiers.  This comes up in Sage where we use keyword arguments for substitution, since it is a very natural syntax.  However, it does not necessarily behave the way one wants.



︡14f31aee-0e85-4282-8428-755bf83f42a4︡{"done":false,"event":"output"}︡{"html":"<h2>DANGER: Keywords are strings! They <em>must</em> be valid identifiers</h2>\n\n<p>A potentially annoying limitation is that the kwds must be strings and must be valid identifiers.  This comes up in Sage where we use keyword arguments for substitution, since it is a very natural syntax.  However, it does not necessarily behave the way one wants.</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠59ac4c7a-ae5f-44be-8957-88d26c8145dar︠
# The R.<...> notation is not valid Python -- it is Sage specific.  It defines x y as generators of the ring.

R.<x,y> = PolynomialRing(GF(7));  R
︡c1cc2fe5-0f83-4634-ae50-6db3f9acc8ae︡{"done":false,"event":"output"}︡{"stdout":"Multivariate Polynomial Ring in x, y over Finite Field of size 7","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠f739fc52-7903-4357-aaf5-6f21f62dd10ar︠
f = (x+y)^5; show(f)
︡cfde5965-a045-4f30-912f-95847611d64a︡{"done":false,"event":"output"}︡{"tex":{"tex":"x^{5} + 5 x^{4} y + 3 x^{3} y^{2} + 3 x^{2} y^{3} + 5 x y^{4} + y^{5}","display":true},"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠59547149-01f4-47ef-8611-27af5325d06fr︠
f(x=3, y=5)
︡44a81558-0d56-454e-94cb-e33afa95c40e︡{"done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠e039b955-93a1-4d24-b9a3-4a227e0f1dcdr︠
R = PolynomialRing(GF(7), 'x,x'); R
︡8b914bf7-90db-4864-b76d-ab1d121eb49c︡{"done":false,"event":"output"}︡{"stdout":"Multivariate Polynomial Ring in x, x over Finite Field of size 7","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠884a4110-dce2-4f55-8e6b-9dd0ef985977r︠
f = R.0 + 2*R.1; f
︡3c80e249-debb-4627-ac8a-7339c84508f9︡{"done":false,"event":"output"}︡{"stdout":"x + 2*x","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡

︠fe4eaa94-b2ab-4753-bca4-ccbe267d79f6r︠x = R.0; x
︡f7ccc76c-a5a1-4fbb-8666-1fdea613867a︡{"done":false,"event":"output"}︡{"stdout":"x","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠4c7724bf-bea6-44a6-85d2-69d8c6709422r︠
f(x=3)  # which x?  "writing x=3" doesn't in any way involve the x we just defined in the previous line!
︡0adea591-c4d3-4123-9085-8f19714bc673︡{"done":false,"event":"output"}︡{"stdout":"x - 1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠08b28552-bc55-44e0-b1d2-7892761c4e9er︠
f.subs({R.1:3})   # the second x, evidently....
︡2f38d1df-d015-4df8-ae17-3b798191515︡{"done":false,"event":"output"}︡{"stdout":"x - 1","done":false,"event":"output"}︡{"stdout":"\n",{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠5aa5724f-e9c9-4dec-a082-712f303415b1r︠









%md
# Docstrings
### Functions have optional documentation given by placing a string right after the "def" line.
- Usually docstrings are more than one line, so we use triple quotes.
- Make sure to put r before three quotes if you are going to use latex!
- The format is technically arbitrary, but there are conventions -- see [PEP 257](http://www.python.org/dev/peps/pep-0257/) and [PEP 287](http://www.python.org/dev/peps/pep-0287/).  In Sage, we have a format based on these, which is described in the Sage Developer's guide.




︡727dc4de-431d-4b52-bf31-64cb371eff06︡{"done":false,"event":"output"}︡{"html":"<h1>Docstrings</h1>\n\n<h3>Functions have optional documentation given by placing a string right after the \"def\" line.</h3>\n\n<ul>\n<li>Usually docstrings are more than one line, so we use triple quotes.</li>\n<li>Make sure to put r before three quotes if you are going to use latex!</li>\n<li>The format is technically arbitrary, but there are conventions -- see <a href=\"http://www.python.org/dev/peps/pep-0257/\">PEP 257</a> and <a href=\"http://www.python.org/dev/peps/pep-0287/\">PEP 287</a>.  In Sage, we have a format based on these, which is described in the Sage Developer's guide.</li>\n</ul>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠f6d0b0b2-6f75-47be-8dce-6aa555116c4dr︠def f(a,b,c, really=True):
    r"""
    This function takes three things, a,b and c, and returns the sum $\sum a_i = a^2 + b^2 + c^2$ of their squares.

    AUTHOR: William Stein
    """
    return a^2+b^2+c^2

︡27bc201b-9abc-4668-bdb8-60fe1250ec7e︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠4d844e4e-c2d0-4899-92c4-c17ba52b7cd4r︠# The docstring is something we can access (or even change!) at runtime.
print f.__doc__
︡fef3d284-bf4e-481c-832c-3e223931ef7f︡{"done":false,"event":"output"}︡{"stdout":"\n    This function takes three things, a,b and c, and returns the sum $\\sum a_i = a^2 + b^2 + c^2$ of their squares.\n\n    AUTHOR: William Stein\n    ","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠aeba8ee5-f095-4180-b3cb-fb60449ff287r︠f.__doc__ += ' (April 8, 2013)'
print f.__doc__

︡24958769-5286-4d6e-8950-b32c42da5153︡{"done":false,"event":"output"}︡{"stdout":"\n    This function takes three things, a,b and c, and returns the sum $\\sum a_i = a^2 + b^2 + c^2$ of their squares.\n\n    AUTHOR: William Stein\n     (April 8, 2013)","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠707c7d2f-f14f-4d48-b70c-a4e38f102febr︠











%md
# Introspection -- finding out about a function from within Python

It is possible to get information about a function from within Python *at runtime*.



︡5ef53187-3058-4513-a47f-c1a0506ddca3︡{"done":false,"event":"output"}︡{"html":"<h1>Introspection -- finding out about a function from within Python</h1>\n\n<p>It is possible to get information about a function from within Python <em>at runtime</em>.</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠2b4ccc5d-46c1-4b89-a445-1a66e06efb75r︠
import inspect
inspect.getargspec(f)
︡c9d289b4-81c5-4692-8d89-f5637c97f09d︡{"done":false,"event":"output"}︡{"stdout":"ArgSpec(args=['a', 'b', 'c', 'really'], varargs=None, keywords=None, defaults=(True,))","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠66065c82-51bc-4a10-aaf5-3c62d49cc585r︠















%md
# Python Classes -- Python is object-oriented from the ground up!

- multiple inheritence
- operator overloading


︡b67a3040-8082-475b-969a-79da5fc164f7︡{"done":false,"event":"output"}︡{"html":"<h1>Python Classes -- Python is object-oriented from the ground up!</h1>\n\n<ul>\n<li>multiple inheritence</li>\n<li>operator overloading</li>\n</ul>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠5c173d58-ae94-4ef3-b236-9d9e283a43bdr︠# Here's how to define a new class:
class MathList(list):  # comma separted list of classes it derives from in parens
     def __init__(self, x):
         """This function is called when you create the object."""
         list.__init__(self, x)
     def __repr__(self):
         return "<" + list.__repr__(self)[1:-1] + ">"
     def __add__(self, right):
         """Addition is component-wise."""
         return MathList([self[i] + right[i] for i in range(len(self))])
     # There are dozens of other dunder methods,
     #    [underscore][underscore]mul[underscore][underscore]
     # for overloading operators....
︡a191736e-68ac-48a0-9007-ff6508961f7a︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠ba478c16-0610-4b16-893d-eac2149be332r︠# There is no "new" keyword like in some languages
v = MathList([1,2,3]); v
︡6cdb7aee-f431-4685-a5ce-49025a0b9211︡{"done":false,"event":"output"}︡{"stdout":"<1, 2, 3>","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠e638b43d-7217-436e-bb7e-7c067edf3d89r︠w = MathList([3,e,pi]); w
︡0bc5a36a-2026-4c22-b686-3c4716696022︡{"done":false,"event":"output"}︡{"stdout":"<3, e, pi>","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠2d49cbb7-f33e-4e7c-a0a9-44339d151f23r︠v + w
︡91514805-04c9-4b5c-8172-e170245b50b8︡{"done":false,"event":"output"}︡{"stdout":"<4, e + 2, pi + 3>","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠9c2de0fd-8c78-4eb5-864e-9a4e685a0390r︠class Summable:
    def sum(self):
        s = 0
        for i in self:
            s += 0
        return s

class MySummableList(MathList, Summable):  # Multiple Inheritence
    pass

v = MySummableList([1..100]); v
︡65b4f34e-87d0-4cd4-b56d-243b3c02ecf9︡{"done":false,"event":"output"}︡{"stdout":"<1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100>","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠551b7564-356c-42c5-b62d-cc77cc13aab5r︠v.sum()
︡8f2542ff-50f3-4795-9089-db23d25c48a0︡{"done":false,"event":"output"}︡{"stdout":"5050","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠e3caefb8-bfb3-42d7-9985-a021450ccfdcr︠







md("""
# Python Conventions

- class names are CamelCase
- function/method names are lower case with underscores

""")



︡faea1f4e-fdaa-4a40-b67a-81de5d8b4f90︡{"done":false,"event":"output"}︡{"html":"<h1>Python Conventions</h1>\n\n<ul>\n<li>class names are CamelCase</li>\n<li>function/method names are lower case with underscores</li>\n</ul>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠5600ccf0-37f2-437a-b7c7-e6e02088461dr︠
︡a955427a-5c75-4648-99db-32be01f33924︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠9bda363d-6bf8-4961-9546-adaecbcc3f37r︠
︡93cc4044-ec77-4ec1-a53b-c4206902585d︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠1920d335-1224-44d6-9cad-4520818a4bfc︠















