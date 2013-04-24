# FAQ: Questions about the course

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