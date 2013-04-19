︠9e2f73fb-86f7-4db8-86f3-ae6182e5558f︠
md("""

# Lecture 9: Cython -- crash course

Reminder to me: Start Google+ Hangout.

Monday and Wednesday *motivated* you to be interested in Cython.  Now we will do a systematic *crash course* of how to use Cython.

**Remarks:**

1. There is a homework assignment due April 24 (see the website).

2. If you install Sage on your own computer, Cython can't possibly work if you don't also have the command line GCC compiler installed (so the command "gcc" on the bash command line works).  This is trivial to install on Linux, and a pain in the ass on OS X (but possible; it used to be easy).  Cython should work fine on https://cloud.sagemath.org and http://480.sagenb.org.  (The issue with sagenb.org and disk space is cleared up.)

""")
︡811feb34-0b0b-490b-9849-aaaf7133c4a4︡{}︡{"html":"<h1>Lecture 9: Cython -- crash course</h1>\n\n<p>Reminder to me: Start Google+ Hangout.</p>\n\n<p>Monday and Wednesday <em>motivated</em> you to be interested in Cython.  Now we will do a systematic <em>crash course</em> of how to use Cython.</p>\n\n<p><strong>Remarks:</strong></p>\n\n<ol>\n<li><p>There is a homework assignment due April 24 (see the website).</p></li>\n<li><p>If you install Sage on your own computer, Cython can't possibly work if you don't also have the command line GCC compiler installed (so the command \"gcc\" on the bash command line works).  This is trivial to install on Linux, and a pain in the ass on OS X (but possible; it used to be easy).  Cython should work fine on https://cloud.sagemath.org and http://480.sagenb.org.  (The issue with sagenb.org and disk space is cleared up.)</p></li>\n</ol>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠50dda182-5139-4766-a012-cede8d4ca1cb︠
md(r"""
# Here is what Cython lets you do:

1. Add C-like type declaration in order to *turn slow code into very fast code*, as illustrated in the previous lectures.  (cdef, cpdef, cdef class)

2. *Use existing C/C++ code* and libraries directly with no overhead. (cdef extern from)

3. Specialized language-level enhancements for fast manipulation of Numpy arrays.

<br><br>
**From <a href="http://cython.org">Cython.org</a>:**

- "Cython [is] the ideal language for wrapping external C libraries, embedding CPython into existing applications, and for fast modules that speed up the execution of Python code."

- "I'm honestly never going back to writing C again. Cython gives me all the expressiveness of Python combined with all the performance and close-to-the-metal-godlike-powers of C."


<br><br>and here is how to do it...
""")
︡62103f0b-be1c-464d-893e-d76d78fcbfc1︡{}︡{"html":"<h1>Here is what Cython lets you do:</h1>\n\n<ol>\n<li><p>Add C-like type declaration in order to <em>turn slow code into very fast code</em>, as illustrated in the previous lectures.  (cdef, cpdef, cdef class)</p></li>\n<li><p><em>Use existing C/C++ code</em> and libraries directly with no overhead. (cdef extern from)</p></li>\n<li><p>Specialized language-level enhancements for fast manipulation of Numpy arrays.</p></li>\n</ol>\n\n<p><br><br>\n<strong>From <a href=\"http://cython.org\">Cython.org</a>:</strong></p>\n\n<ul>\n<li><p>\"Cython [is] the ideal language for wrapping external C libraries, embedding CPython into existing applications, and for fast modules that speed up the execution of Python code.\"</p></li>\n<li><p>\"I'm honestly never going back to writing C again. Cython gives me all the expressiveness of Python combined with all the performance and close-to-the-metal-godlike-powers of C.\"</p></li>\n</ul>\n\n<p><br><br>and here is how to do it...</p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠b775818c-d85a-404d-9df7-3aa975898615︠

md(r"""
# cdef'd functions

These get converted directly to C code.  You typically declare the type of the output and all inputs.  The function call overhead is the same as in C (basically nothing). <br><br>

    cdef [return type] name_of_function([type0] varname0, [type1] varname1, ...):
         body of functions


<br><br>You *can't* call cdef's functions from Python.

""")


︡2922d23a-f2fa-4f3d-b2e9-bcd808d15324︡{}︡{"html":"<h1>cdef'd functions</h1>\n\n<p>These get converted directly to C code.  You typically declare the type of the output and all inputs.  The function call overhead is the same as in C (basically nothing). <br><br></p>\n\n<pre><code>cdef [return type] name_of_function([type0] varname0, [type1] varname1, ...):\n     body of functions\n</code></pre>\n\n<p><br><br>You <em>can't</em> call cdef's functions from Python.      </p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠f14df37b-2569-46f9-a58b-c422148adae8︠
%cython

cdef int add_them(int a, int b):
    """This is a cdef'f function."""
    return a+b

def usable_from_python(a, b):
    return add_them(a,b)
︡0bbf9c81-ef73-4341-9a10-7ee11611d9eb︡{}︡{"file":{"show":false,"uuid":"4c67f97a-80d5-43a9-ad91-d8725cf96563","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_9R_sUJ_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_9R_sUJ_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_9R_sUJ_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_9R_sUJ_a_pyx_0.html?uuid=4c67f97a-80d5-43a9-ad91-d8725cf96563' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠527eae12-d1cc-4099-a240-2559acb857bd︠
add_them(2,3) # should NOT work
︡939d0e94-3f70-4e8f-b50a-a08807ac34a2︡{}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"NameError: name 'add_them' is not defined\n"}︡
︠f035c956-8550-4a73-b4ce-f6be294f25d2︠
usable_from_python(2,3)
︡f9a72009-587c-49a9-8a74-846fc430a7fa︡{}︡{"stdout":"5"}︡{"stdout":"\n"}︡
︠ba0398b2-57b5-4a54-91d4-5d48b4712649︠
%timeit usable_from_python(2r,3r)
︡958477d6-376f-481f-9cb7-795e49ed5739︡{}︡{"stdout":"625 loops, best of 3: 261 ns per loop"}︡{"stdout":"\n"}︡
︠7be551b7-f845-46e3-b64b-2cd3edb569a1︠
md(r"""
# cpdef'd functions

These are like cdef'd functions, but slightly slower.  You can call them from Python.
""")
︡80950152-7a07-4a26-84f3-6d64cfec6667︡{}︡{"html":"<h1>cpdef'd functions</h1>\n\n<p>These are like cdef'd functions, but slightly slower.  You can call them from Python.</p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠156bf305-dd4e-4587-988d-830b5d588ae1︠
%cython
cpdef int add_them2(int a, int b):
    return a+b
︡4fd10040-6e1b-4956-b660-901c385fcd8e︡{}︡{"file":{"show":false,"uuid":"7f5e8da4-b01f-4f43-a2dd-3233a0e91733","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir__GvRiK_a_pyx/_home_wstein__sage_temp_localhost_11599_dir__GvRiK_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir__GvRiK_a_pyx/_home_wstein__sage_temp_localhost_11599_dir__GvRiK_a_pyx_0.html?uuid=7f5e8da4-b01f-4f43-a2dd-3233a0e91733' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠e31ae65d-fa36-47a1-baea-297c361c03ac︠
add_them2(2r,3r)
︡47b02ba5-71e8-4f5f-ad56-b5c5a78caa49︡{}︡{"stdout":"5"}︡{"stdout":"\n"}︡
︠864c7a29-9ab7-4b1e-9cde-d21dacbcbb5e︠
%timeit add_them2(2r,3r)
︡a0070e2d-9781-49ed-8273-53c086f63e6c︡{}︡{"stdout":"625 loops, best of 3: 162 ns per loop"}︡{"stdout":"\n"}︡
︠1dc16af6-7ffe-4cf3-846e-a09f29724f23︠







︠c71d8c66-4b0c-4508-99d3-57702bbc6ad3︠
md(r"""
# cdef'd classes
""")



︡38c8f7b5-c8a5-4195-8e37-516484c85b0d︡{}︡{"html":"<h1>cdef'd classes</h1>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠4e51d089-6227-4b5b-8c05-18859b9c383f︠
%cython
cdef class Summer:
    cdef int n
    cdef public int n2  # to illustrate public keyword

    def __init__(self, int n):
        self.n = n
        self.n2 = n

    def __repr__(self):
        return "1 + 2 + ... + %s"%self.n

    def value(self):
        cdef long s=0
        cdef int i
        for i in range(self.n):
            s += self.n
        return s

    cdef int square_n(self):  # call-able at C speed
        return self.n*self.n
︡8e168b8e-72e7-45fb-8b1a-fd051ca45503︡{}︡{"file":{"show":false,"uuid":"d74d9af1-f812-4559-9fc5-87e8b00abdbe","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_5brGzG_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_5brGzG_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_5brGzG_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_5brGzG_a_pyx_0.html?uuid=d74d9af1-f812-4559-9fc5-87e8b00abdbe' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠d73426fb-05e4-4e42-b35e-252e83b95a2c︠
Summer
︡65778af7-2e6d-4f34-be2f-a2bb38742723︡{}︡{"stdout":"<type '_home_wstein__sage_temp_localhost_13502_dir_4RkNk4_a_pyx_0.Summer'>"}︡{"stdout":"\n"}︡
︠639862fd-ae69-4f27-9bd5-8e5c4b207630︠
s = Summer(5050); s
︡ce564ae9-e9d3-42b3-87d3-67ee8939ff60︡{}︡{"stdout":"1 + 2 + ... + 5050"}︡{"stdout":"\n"}︡
︠7e43cb07-9323-4275-8761-3f7f05aa1fbb︠
type(s)
︡469a461e-0c92-428c-a537-60bcf5421262︡{}︡{"stdout":"<type '_home_wstein__sage_temp_localhost_13502_dir_M23Jvg_a_pyx_0.Summer'>"}︡{"stdout":"\n"}︡
︠f5f0fde2-0e59-40f4-b750-9b61837ba6ce︠
# Note that s is a "type", not a "class".  It is
# implemented using a C struct...
html.iframe("http://docs.python.org/2/extending/newtypes.html", height=400)
︡e0c5b2b5-92f2-4e6b-b010-d18ac47f7fda︡{}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://docs.python.org/2/extending/newtypes.html\"></iframe>"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠b034370c-187a-4e8a-8ae9-1cc6ebf03ec5︠
s.n2
︡328a146d-5e65-4edb-869a-2f23409c3d46︡{}︡{"stdout":"5050"}︡{"stdout":"\n"}︡
︠d6a8d58a-d813-43c3-8918-77caa9ac66af︠
s.n   # true(-er) privacy! -- should not work
︡e8216de3-adc8-4bf4-ace6-6e3dac18160f︡{}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"AttributeError: '_home_wstein__sage_temp_localhost_13502_dir_4RkNk4' object has no attribute 'n'\n"}︡
︠99fabeb9-3dc3-4b06-b0f4-f313127b6ca2︠
s.value()
︡fe39115a-b601-4265-8f5c-46796ad60e12︡{}︡{"stdout":"25502500"}︡{"stdout":"\n"}︡
︠57e9a200-d200-4d29-b349-481f7159b0c6︠
# I never start writing Cython for sage from scratch; I search for something similar
# in Sage, and copy then modify it.
# EXAMPLE: implementation of the Integer type in Sage
html.iframe("http://hg.sagemath.org/sage-main/file/4381a8e9f0c8/sage/rings/integer.pyx")
︡ccb806c4-2b7c-4bd5-a468-e49422395375︡{}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://hg.sagemath.org/sage-main/file/4381a8e9f0c8/sage/rings/integer.pyx\"></iframe>"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠42befb9c-2399-4a1d-9f8c-74265ae1a798︠




︠63292181-a70c-444a-80f4-1f860e4b07aa︠
md(r"""
# Calling external C/C++ code

Notice in the example above all the `mpz_stuff`.  These are calls into the MPIR C library.
""")

html.iframe("http://mpir.org/")




︡7f990499-b781-4da1-8d94-2a14fd003892︡{}︡{"html":"<h1>Calling external C/C++ code</h1>\n\n<p>Notice in the example above all the <code>mpz_stuff</code>.  These are calls into the MPIR C library.</p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://mpir.org/\"></iframe>"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠746d64e9-7571-4450-8bba-d378c9bbc7e6︠
# Basic example: calling functions in the standard C math library.
%cython

from math import cos, exp

def sin_exp_sum0(int n):
    cdef double s = 0
    cdef int i
    for i in range(n):
        s += exp(cos(i))
    return s
︡f589fac4-f20d-43d2-a2ee-c2fa6c644c23︡{}︡{"file":{"show":false,"uuid":"4bf57840-cea5-4eeb-824d-79a8989d3d31","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_EVIBp1_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_EVIBp1_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_EVIBp1_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_EVIBp1_a_pyx_0.html?uuid=4bf57840-cea5-4eeb-824d-79a8989d3d31' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠b9b750ee-8629-4171-8345-6c263d34dc40︠
%timeit sin_exp_sum0(5050)
︡4ff00ecc-26fa-45e3-814b-3cb5a93c43f7︡{}︡{"stdout":"125 loops, best of 3: 2.69 ms per loop"}︡{"stdout":"\n"}︡
︠16434bd1-365c-4f31-8a40-3b331fab1cc9︠
# Basic example: calling functions in the standard C math library.
%cython

cdef extern from "math.h":
    cdef double cos(double)
    cdef double exp(double)

def sin_exp_sum1(int n):
    cdef double s = 0
    cdef int i
    for i in range(n):
        s += exp(cos(i))
    return s
︡e578839d-adb1-4948-8f53-ad468c81fba2︡{}︡{"file":{"show":false,"uuid":"b6c57b68-b74e-46b6-b77c-be099b5e3de8","filename":"/home/wstein/.sage/temp/localhost/9861/spyx/_home_wstein__sage_temp_localhost_9861_dir_Vrt_u1_a_pyx/_home_wstein__sage_temp_localhost_9861_dir_Vrt_u1_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/9861/spyx/_home_wstein__sage_temp_localhost_9861_dir_Vrt_u1_a_pyx/_home_wstein__sage_temp_localhost_9861_dir_Vrt_u1_a_pyx_0.html?uuid=b6c57b68-b74e-46b6-b77c-be099b5e3de8' target='_new' class='btn btn-small '>Show auto-generated code <i class='icon-external-link'></i></a>"}︡
︠d9cde254-ca8e-425c-a1d6-193063831e68︠
%timeit sin_exp_sum1(5050)
︡25ea9af7-e049-42d4-8c5a-38c5fc8c97e0︡{}︡{"stdout":"625 loops, best of 3: 392 µs per loop"}︡{"stdout":"\n"}︡
︠804f8dc8-c987-420a-b146-d65166164b1c︠

︡f0c69d44-f96c-436d-bac9-5dae8f1e9f87︡{}︡{"file":{"show":false,"uuid":"e2787342-0c15-45bf-8454-436f32cecf41","filename":"/home/wstein/.sage/temp/localhost/13502/spyx/_home_wstein_Dropbox_edu_2012_2013_spring_2013_2013_480_lectures_a_pyx/setup.py"}}︡
︠2ae4da4e-7e44-41ec-8b90-473ed818d614︠

︡5ff51131-0f4c-4172-a85f-d9fdd93cb887︡
︠c0cea430-3058-455c-9afe-46d75fa1a32a︠

md(r"""
# Working with Numpy arrays

Here is a simple example in which we re-implement computation of the
variance of the entries in a 1-dimensional numpy array.

<br>
**Recall:** The *variance* of a list $x\_i$ of $n$ real numbers with mean $\mu$ is $\sigma =\frac{1}{n}\cdot \sum(x\_i -\mu)^2$.   The standard deviation is the square root of this.  (Sometimes one divides instead by $n-1$.)
""")


︡473071a1-8f5d-4a27-8ed0-e41dbff88d1b︡{}︡{"html":"<h1>Working with Numpy arrays</h1>\n\n<p>Here is a simple example in which we re-implement computation of the\nvariance of the entries in a 1-dimensional numpy array.</p>\n\n<p><br>\n<strong>Recall:</strong> The <em>variance</em> of a list $x_i$ of $n$ real numbers with mean $\\mu$ is $\\sigma =\\frac{1}{n}\\cdot \\sum(x_i -\\mu)^2$.   The standard deviation is the square root of this.  (Sometimes one divides instead by $n-1$.)</p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠8a9807a1-b3ac-411a-b3d5-b279355eef76︠
import numpy
a = numpy.array(range(10000), dtype=numpy.float64)
a.var()
%timeit a.var()   # not fast enough for you?
︡55b390b9-59dc-49b4-8205-4c96100aaed7︡{}︡{"stdout":"8333333.25"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 66.4 µs per loop"}︡{"stdout":"\n"}︡
︠f16bb6ef-a5db-46c5-ba77-45288c037e6b︠
b = stats.TimeSeries(range(10000))
%timeit b.variance(bias=True)   # definitely not fast enough for me!
︡74454bda-d01d-42fb-b874-ed747fa9e7b3︡{}︡{"stdout":"625 loops, best of 3: 23.7 µs per loop"}︡{"stdout":"\n"}︡
︠7c372b73-539d-46a4-b374-c8d2640b42f4︠
# First attempt -- fail.
%cython
def var1(a):
    cdef double mean = a.mean()
    cdef int n = len(a)
    return sum((x-mean)**2 for x in a)/n
︡40e223f6-6f0d-42a4-8ad5-b2e15d9183b0︡{}︡{"file":{"show":false,"uuid":"102c0a0b-7574-40d3-9231-73fdd5b210ee","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_usgVPT_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_usgVPT_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_usgVPT_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_usgVPT_a_pyx_0.html?uuid=102c0a0b-7574-40d3-9231-73fdd5b210ee' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠de2ab7c9-6f85-45c7-9a1d-0082057460c2︠
var1(a)
%timeit var1(a)   # massively slower
︡b77dc75f-fea5-4bd6-b755-ac174121b9bd︡{}︡{"stdout":"8333333.25"}︡{"stdout":"\n"}︡{"stdout":"25 loops, best of 3: 24 ms per loop"}︡{"stdout":"\n"}︡
︠9da1afec-b61a-4a5f-b400-169d790600d9︠
# Second attempt -- fail.
%cython
def var2(a):
    cdef double mean = a.mean()
    cdef int n = len(a)
    cdef int i
    cdef double s = 0, t
    for i in range(n):
        t = a[i] - mean
        s += t*t
    return s/n
︡152d629c-0670-4f74-8b87-c4a521ae41e0︡{}︡{"file":{"show":false,"uuid":"8e988fba-7ea6-46cf-81fb-7a7613635ca1","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_5UTCia_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_5UTCia_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_5UTCia_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_5UTCia_a_pyx_0.html?uuid=8e988fba-7ea6-46cf-81fb-7a7613635ca1' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠beb98478-9798-40f9-8dc4-fd5cf13e5cb5︠
var2(a)
%timeit var2(a)   # massively slower still. :-(
# WHY slow -- look at auto-generated code.  We need fast access to a[i]!
︡a258d89b-1385-48ed-a97b-1d05166056f5︡{}︡{"stdout":"8333333.25"}︡{"stdout":"\n"}︡{"stdout":"25 loops, best of 3: 9.91 ms per loop"}︡{"stdout":"\n"}︡
︠eb63d636-48f4-4e60-8d45-f91aa7753ff4︠
%cython
cimport numpy as numpy
ctypedef numpy.float64_t DTYPE_t

def var3(numpy.ndarray[DTYPE_t, ndim=1] a):
    cdef double mean = a.mean()
    cdef int n = len(a)
    cdef int i
    cdef double s = 0, t
    for i in range(n):
        t = a[i] - mean
        s += t*t
    return s/n
︡32963155-9b86-4dc6-83a0-9110bff12981︡{}︡{"file":{"show":false,"uuid":"4c3b236f-b5a9-41ae-afd2-b9f9f4c2a03a","filename":"/home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_HRBmp7_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_HRBmp7_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/11599/spyx/_home_wstein__sage_temp_localhost_11599_dir_HRBmp7_a_pyx/_home_wstein__sage_temp_localhost_11599_dir_HRBmp7_a_pyx_0.html?uuid=4c3b236f-b5a9-41ae-afd2-b9f9f4c2a03a' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠080793b0-fb91-409b-b15d-f58a2f82a785︠
var3(a)
%timeit var3(a)
︡e87b89c9-fe5b-4da8-ae1f-66a7eeb777a6︡{}︡{"stdout":"8333333.25"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 33.9 µs per loop"}︡{"stdout":"\n"}︡
︠6f6ecf7c-677b-41f2-9994-b43be72bf2b4︠








︠d4affc27-7b50-4fbb-8ecb-e92a3ecf32d9︠
%html.iframe http://zeustoves.deviantart.com/art/Cython-version-02-341327505
︡eea8fc2b-d35b-4309-826e-f91545e6549b︡{}︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://zeustoves.deviantart.com/art/Cython-version-02-341327505\"></iframe>"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠b710b685-1694-4a46-9987-257287521319︠

