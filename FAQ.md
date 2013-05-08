# FAQ: Questions about the course

### How can I use cloud.sagemath.com to modify a file and post the modification to github?

(Answer: See Lecture 17.)

### How do I submit a histogram as part of my homework solution.

Since it is not easy (or even possible?) to upload a new file to github,
many of you don't know how to use git yet, and I haven't finished implementing
sharing at <https://cloud.sagemath.com> yet, you can simply describe what
your histogram looks like in words for now.

### How do you reduce a rational number modulo n!?

If b is an integer coprime to n then by the extended euclidean algorithm,
there is a unique integer b' modulo n such that `b*b' = 1 (mod n)`.
If a/b is a fraction in lowest terms (with b coprime to n),
then the reduction of a/b modulo n is `a*b'`.  In Sage, you can just write

    Mod(a/b, n)

and the above definition is used.

### How do I draw a histogram in Sage?

One way is to use the TimeSeries object:

     stats.TimeSeries([random() for _ in range(100)]).plot_histogram()


### My README.md looks like crap when I view it after saving.

A file that ends in ".md" is a "markdown" file.  It's a special format of file, like HTML.  Learn all about Markdown at [http://daringfireball.net/projects/markdown/syntax](http://daringfireball.net/projects/markdown/syntax).


### Cython doesn't work!?

Send me a question that has code or a link to code or something precise.  Just telling me that nothing works without telling me what you're running and where isn't so useful.

### I want to use a Sage function like "timeit" or "factor" in Cython, but it doesn't work!?

When using %cython, nothing from the Sage library is imported by default.  You have to explicitly put a line like this in your file

    %cython
    from sage.all import timeit, factor   # import stuff from sage library



### I want to cimport numpy.matrix in Cython but it doesn't work.  Why?

Running this in sage notebook gives an error, why is that?

    %cython
    cimport numpy as np
    def mult(np.matrix a,  np.matrix b):
        return a*b

What are you trying to do?  Just don't declare any types and the above would compile.  There is no fast c "matrix" type supported by Cython.   Anyway, this works:

    %cython
    def mult(a,b):
        return a*b

Then in another cell:

    import numpy as np
    a = np.matrix([[1,2], [3,4]])
    mult(a,a)

Of course, using Cython above provides no speed up.

The main reason to declare any types in the context of numpy is for fast access to the underlying *array*.  This was the example I gave in class of this:

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


### I'm finishing up the homework, and I'm am looking to compile and run it on your website.

What exactly do you mean by "on your website"?

In class, I'm using [cloud](https://cloud.sagemath.org) -- in particular, I make a new project, click new, then select "worksheet", then enter code and press "shift-enter".

Regarding %timeit, if you use [480.sagenb.org](http://480.sagenb.org) (instead of [https://cloud.sagemath.org](https://cloud.sagemath.org)), then you have to instead do

    timeit('some code')

i.e., no % and put the code in quotes.

### %timeit doesn't work.  What the heck?

In [SageCloud](https://cloud.sagemath.org), I've improved the timeit command so you can use it in a whole cell (by writing "%timeit" at the top) or at the beginning of a line.  The old sage notebook (*.sagenb.org) doesn't have this new feature.  For that, do, e.g.,

    timeit("2+2")

i.e., put the code in one line in quotes.


### Regarding the 4x4 determinant problem, I was wondering if we can do this problem by writing out the addition and multiplication needed to find the determinant without any loops since the problem only asks for a 4x4 and not nxn matrix.

Yes, you can do it that way if you want.   You could even use Sage (or another program) to get the formula:

    R = PolynomialRing(QQ,16,'x')
    a = matrix(R,4,4,R.gens())
    a.det()


### I noticed this weird behavior with lists

    ratio =[[]]*3; ratio[0].append(1); ratio

returns [[1] ,[1] ,[1]] instead of[[1] ,[0] ,[0]]

This is the gotcha with Python I mentioned on the first day of the crash course.

    sage: v =[[]]*3
    sage: v[0] is v[1]
    True

You've made a list with two identical entries (they are the same object).

Do this instead:

    sage: v =[[] for _ in range(3)]
    sage: v[0] is v[1]
    False
