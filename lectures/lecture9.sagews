︠9e2f73fb-86f7-4db8-86f3-ae6182e5558f︠
md("""

# Lecture 9: Cython -- crash course

Monday and Wednesday *motivated* you to be interested in Cython.  Now we will do a systematic *crash course* of how to use Cython.

**Remarks:**

1. There is a homework assignment due April 24 (see the website).

2. If you install Sage on your own computer, Cython can't possibly work if you don't also have the command line GCC compiler installed (so the command "gcc" on the bash command line works).  This is trivial to install on Linux, and a pain in the ass on OS X (but possible; it used to be easy).  Cython should work fine on https://cloud.sagemath.org and http://480.sagenb.org.  (The issue with sagenb.org and disk space is cleared up.)

""")
︡8da35575-bc2d-40a0-b30a-eb7ec8933f14︡{}︡{"html":"<h1>Lecture 9: Cython -- crash course</h1>\n\n<p>Monday and Wednesday <em>motivated</em> you to be interested in Cython.  Now we will do a systematic <em>crash course</em> of how to use Cython.</p>\n\n<p><strong>Remarks:</strong></p>\n\n<ol>\n<li><p>There is a homework assignment due April 24 (see the website).</p></li>\n<li><p>If you install Sage on your own computer, Cython can't possibly work if you don't also have the command line GCC compiler installed (so the command \"gcc\" on the bash command line works).  This is trivial to install on Linux, and a pain in the ass on OS X (but possible; it used to be easy).  Cython should work fine on https://cloud.sagemath.org and http://480.sagenb.org.  (The issue with sagenb.org and disk space is cleared up.)</p></li>\n</ol>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠50dda182-5139-4766-a012-cede8d4ca1cb︠
md(r"""
# Here is what Cython lets you do:

1. Add C-like type declaration in order to *turn slow code into very fast code*, as illustrated in the previous lectures.  (cdef, cpdef, cdef class)

2. *Use existing C/C++ code* and libraries directly with no overhead. (cdef extern from)

3. Specialized language-level enhancements for fast manipulation of Numpy arrays.

<br><br>
<span style="color:darkblue;">From Cython.org: "Cython [is] the ideal language for wrapping external C libraries, embedding CPython into existing applications, and for fast modules that speed up the execution of Python code."
</span>

""")
︡147faa86-25b1-4b65-98bc-38d77e75dac6︡{}︡{"html":"<h1>Here is what Cython lets you do:</h1>\n\n<ol>\n<li><p>Add C-like type declaration in order to <em>turn slow code into very fast code</em>, as illustrated in the previous lectures.  (cdef, cpdef, cdef class)</p></li>\n<li><p><em>Use existing C/C++ code</em> and libraries directly with no overhead. (cdef extern from)</p></li>\n<li><p>Specialized language-level enhancements for fast manipulation of Numpy arrays.</p></li>\n</ol>\n\n<p><br><br>\n<span style=\"color:darkblue;\">From Cython.org: \"Cython [is] the ideal language for wrapping external C libraries, embedding CPython into existing applications, and for fast modules that speed up the execution of Python code.\"\n</span></p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡
︠b775818c-d85a-404d-9df7-3aa975898615︠






































