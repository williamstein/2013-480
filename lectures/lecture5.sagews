︠f81acc83-2547-4364-8d25-50e000182ecfr︠
︠0b6ff52c-4a8a-40f7-88a8-16cac35d6527r︠
%md
# Lecture 5: Python Classes (finish), Exception Handling, etc.
(finish doing the basic class example from lecture4...)
︡336c1bde-b6ca-4a9b-a1ee-e79913bcb830︡{"done":false,"event":"output"}︡{"html":"<h1>Lecture 5: Python Classes (finish), Exception Handling, etc.</h1>\n\n<p>(finish doing the basic class example from lecture4...)</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠76875617-91d1-4d16-bcec-ff4014932497r︠







︠9d007265-d5ec-47ac-890a-36fa8b4d96far︠
︡61b260d0-575c-47d0-aace-16c8b84ecec5︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠b3045c21-611d-4ff8-8d36-333a5aa058c9r︠
md("""
# Exception Handling: try/except/finally

In Javascript (say) one often writes *non-blocking asynchronous code* like this:

  foo(args, cb);

where "function cb(err, other args) {...}".  try/catch is often not useful at all (since the call to foo returns immediately), and you end up doing a lot of error checking by checking return values.   Similarly, in the new Go language by Google, they consider exception handling not useful and don't have it all, perhaps for similar reasons (?).

In Python, it is really hard to write non-blocking asynchronous code (see Twisted), but really easy to write *blocking synchronous single-threaded easy-to-reason-about code*.  It turns out that in mathematical computation (as opposed to network programming, gui programming, web apps, etc.), what Python is often *exactly* what you need (except for the small issue of Python being potentally really slow (!) -- see Cython).

In Python exception handling is incredibly useful and optimized.   You **will** use it, a lot.
""")
︡f10f48bb-ee5a-4f95-9813-6488e05a3a82︡{"done":false,"event":"output"}︡{"html":"<h1>Exception Handling: try/except/finally</h1>\n\n<p>In Javascript (say) one often writes <em>non-blocking asynchronous code</em> like this:</p>\n\n<p>foo(args, cb);</p>\n\n<p>where \"function cb(err, other args) {...}\".  try/catch is often not useful at all (since the call to foo returns immediately), and you end up doing a lot of error checking by checking return values.   Similarly, in the new Go language by Google, they consider exception handling not useful and don't have it all, perhaps for similar reasons (?).</p>\n\n<p>In Python, it is really hard to write non-blocking asynchronous code (see Twisted), but really easy to write <em>blocking synchronous single-threaded easy-to-reason-about code</em>.  It turns out that in mathematical computation (as opposed to network programming, gui programming, web apps, etc.), what Python is often <em>exactly</em> what you need (except for the small issue of Python being potentally really slow (!) -- see Cython).</p>\n\n<p>In Python exception handling is incredibly useful and optimized.   You <strong>will</strong> use it, a lot.</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡


# Here's how exception handling looks in Python:
    try:
        [block of code]
    except type_of_exception (or tuple of types), [variable]:
        [code to execute when any of these exception happen.]
    except more types...:
        [more code]
    except:  # catches anything not caught above
    [code]
    else:
        [code that is run if no exceptions happens]
    finally:
        [code that gets executed NO MATTER WHAT -- unless Python segfaults/crashes/runs out of memory, of course -- after any of the above]

ALSO:
    raise some_exception

# NOTE the keywords: try, except, finally, raise... instead of:
#    try, catch, throw....
︠4aaab498-cfdc-4300-a9fc-c1866eea4509r︠
# cause an exception
try:
    1/0
except:
    print "caught it!"

︡decd3625-0ddb-4260-92ca-d706fe23651c︡{"done":false,"event":"output"}︡{"stdout":"caught it!","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠c6deb240-b952-407d-bff7-bb05be3c303dr︠
for A in range(-5,5):
    for B in range(-5,5):
        try:
            E = EllipticCurve([A,B])
            print E.rank()
        except Exception, err:
            print err
︡6529d70e-fe29-46f5-b507-f9be38bec699︡{"done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"2","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"Invariants [0, 0, 0, -3, -2] define a singular curve.","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"Invariants [0, 0, 0, -3, 2] define a singular curve.","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"2","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"2","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"Invariants [0, 0, 0, 0, 0] define a singular curve.","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"2","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"2","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠ba64554c-e9e9-4c50-8afd-10e88a8bfc47︠

︠9243c7a2-3402-4ac1-8d9e-fdee9c0e4a87r︠
try:
    1/0
except ZeroDivisionError, err:
    print "err =", err
︡a58df4bd-12ca-4808-93be-08b085b10ada︡{"done":false,"event":"output"}︡{"stdout":"err =","done":false,"event":"output"}︡{"stdout":" ","done":false,"event":"output"}︡{"stdout":"Rational division by zero","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠03dd4894-9207-4505-be9d-930d25cec972r︠
# See http://docs.python.org/2/library/exceptions.html
# for a list of all builtin exceptions.  You can define your own too.
try:
    1/0
except ArithmeticError, err:  # there is a class hierarchy of exceptions
    print "err =", err
︡e4a377e1-5ac7-4647-8214-510545feeca9︡{"done":false,"event":"output"}︡{"stdout":"err =","done":false,"event":"output"}︡{"stdout":" ","done":false,"event":"output"}︡{"stdout":"Rational division by zero","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠149a6543-5016-4b75-974f-5b9b49dca960r︠
try:
    eval('2/')
except ArithmeticError:
    print "arith error"
︡b04829a4-73ac-440e-b40a-2937553ce012︡{"done":false,"event":"output"}︡{"done":false,"event":"output","stderr":"Error in lines 1-4\n"}︡{"done":false,"event":"output","stderr":"Traceback (most recent call last):\n"}︡{"done":false,"event":"output","stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"done":false,"event":"output","stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 2, in <module>\n"}︡{"done":false,"event":"output","stderr":"  File \"<string>\", line 1\n"}︡{"done":false,"event":"output","stderr":"    2/\n"}︡{"done":false,"event":"output","stderr":"     ^\n"}︡{"done":false,"event":"output","stderr":"SyntaxError: unexpected EOF while parsing\n"}︡{"stdout":"","done":true,"event":"output"}︡
︠2bd999b7-d8e5-4d01-91e3-68696393b1e8r︠
try:
    eval('2/')
except ArithmeticError:
    print "arith error"
except:
    # This is called a "naked exception" --
    #    it catches anything, and is frowned upon.
    print "some error"
︡e0572ff6-229f-4b4d-9426-a6059273a736︡{"done":false,"event":"output"}︡{"stdout":"some error","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠3d19f3de-4005-4d48-8245-0b7f32f74256r︠
def f(s):
    try:
        if not isinstance(s, str):
            raise TypeError("s must be a string")
        print eval(s)
        return 0
    except ArithmeticError:
        print "arith error"
    except Exception, err:  # Exception = base class for exceptions
        print "some other error --", err
        raise   # propagates last exceptions
    finally:
        print "I will be run no matter what!"
︡21805ea2-49b6-4ce5-a55b-264d39cd4131︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠d339f24b-94e5-4f0e-993b-3c423cb45bf0r︠
f('2+3')
︡0ccd0b78-800e-4f77-9f50-c5cdd93c41dc︡{"done":false,"event":"output"}︡{"stdout":"5","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"I will be run no matter what!","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"0","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠1338eb19-277d-40e2-8511-130cfb423363r︠
2+2
︡af9b35c7-1e9f-4a14-a9c4-c07a2aa10d3e︡{"done":false,"event":"output"}︡{"stdout":"4","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠21d5709f-7b50-411b-9099-31c34d068a4br︠
a
︡01e017f2-a54b-4d32-9d4c-ba6c963d0129︡{"done":false,"event":"output"}︡{"stdout":"5","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠103fe9f2-51b1-409e-a667-2a2176522e57r︠
f('2/0')
︡69d270a0-6f8b-4961-ad71-36af6eea5e02︡{"done":false,"event":"output"}︡{"stdout":"arith error","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"I will be run no matter what!","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠b7f496b8-890e-4b2a-969c-a8fb53942257r︠
f('1/')
︡eced29fd-c6a1-468b-8bd0-a2b421f38ff9︡{"done":false,"event":"output"}︡{"stdout":"some other error --","done":false,"event":"output"}︡{"stdout":" ","done":false,"event":"output"}︡{"stdout":"unexpected EOF while parsing (<string>, line 1)","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"I will be run no matter what!","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"done":false,"event":"output","stderr":"Error in lines 1-1\n"}︡{"done":false,"event":"output","stderr":"Traceback (most recent call last):\n"}︡{"done":false,"event":"output","stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"done":false,"event":"output","stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 1, in <module>\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 5, in f\n"}︡{"done":false,"event":"output","stderr":"  File \"<string>\", line 1\n"}︡{"done":false,"event":"output","stderr":"    1/\n"}︡{"done":false,"event":"output","stderr":"     ^\n"}︡{"done":false,"event":"output","stderr":"SyntaxError: unexpected EOF while parsing\n"}︡{"stdout":"","done":true,"event":"output"}︡
︠5c24d4f5-664f-48e7-94f5-6bb04731d55fr︠
f(2/3)
︡599e65d3-c7e0-46ea-93f3-91511cb91db9︡{"done":false,"event":"output"}︡{"stdout":"some other error --","done":false,"event":"output"}︡{"stdout":" ","done":false,"event":"output"}︡{"stdout":"s must be a string","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"I will be run no matter what!","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"done":false,"event":"output","stderr":"Error in lines 1-1\n"}︡{"done":false,"event":"output","stderr":"Traceback (most recent call last):\n"}︡{"done":false,"event":"output","stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"done":false,"event":"output","stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 1, in <module>\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 4, in f\n"}︡{"done":false,"event":"output","stderr":"TypeError: s must be a string\n"}︡{"stdout":"","done":true,"event":"output"}︡
︠c0657fbe-2b78-4081-b1c9-04c8bc55d0der︠













md("""
# My biggest mistake using exceptions

When you raise an exception in your code, if you're a friendly person, it is tempting to make your exceptions **too helpful**:
""")
︡b08e2239-f892-47e2-ae1a-679116a791d7︡{"done":false,"event":"output"}︡{"html":"<h1>My biggest mistake using exceptions</h1>\n\n<p>When you raise an exception in your code, if you're a friendly person, it is tempting to make your exceptions <strong>too helpful</strong>:</p>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠fc5c1e3d-0109-42b0-abb1-0d803598709cr︠
def invert_in_ZZ(z):
    if z == -1 or z == 1:
        return z
    else:
        raise ArithmeticError("integer z (=%s) is not invertible in the integers ZZ"%z)
︡d4ad5387-de71-431c-9182-f8a88b6b096a︡{"done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠ad3f4593-d0cf-4bd1-8a3e-73bb998d11c4r︠
invert_in_ZZ(-1)
︡3035a545-a9b4-4fd3-b3e9-132bdf32d38b︡{"done":false,"event":"output"}︡{"stdout":"-1","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠3814663a-1735-427e-b9a3-be087be17630r︠
# This is great, the exception even tells me which number it
# couldn't invert, which might help a lot when using/debugging code.
invert_in_ZZ(7)
︡54e7dee6-7a70-4dbb-ad9c-c48cb0c1f1b9︡{"done":false,"event":"output"}︡{"done":false,"event":"output","stderr":"Error in lines 1-1\n"}︡{"done":false,"event":"output","stderr":"Traceback (most recent call last):\n"}︡{"done":false,"event":"output","stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"done":false,"event":"output","stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 1, in <module>\n"}︡{"done":false,"event":"output","stderr":"  File \"\", line 5, in invert_in_ZZ\n"}︡{"done":false,"event":"output","stderr":"ArithmeticError: integer z (=7) is not invertible in the integers ZZ\n"}︡{"stdout":"","done":true,"event":"output"}︡
︠1d221fa2-34f0-4e84-9c7b-a5fb71156107r︠
a = 2^10000000

%time
# Don't do this -- note that it takes *1 second* (!!) to do something trivial.
# QUESTION: What is dominating the runtime here.
try:
    invert_in_ZZ(a)
except Exception, msg:
    print "couldn't invert..."
︡98e46296-77ff-40bb-af32-2372ed7cda72︡{"done":false,"event":"output"}︡{"stdout":"couldn't invert...","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"CPU time: 0.74 s, Wall time: 0.74 s","done":false,"event":"output"}︡{"stdout":"\n","done":false,"event":"output"}︡{"stdout":"","done":true,"event":"output"}︡
︠9bb3c80f-ac05-4f14-8b1c-c42898e115dbr︠
md("""
### This mistake was all over Sage in 2006...

I remember David Harveyfinding it after debugging why computing $\alpha f(x)$, for $\alpha$ a scalar and $f(x)$ a polynomial, was taking a huge amount of time.  It turned out that in the internal arithmetic code there was a try/except that determined which `__mul__` to use, and the runtime was dominated by computing the string representation of $f(x)$!

# DOH.
""")

︡694de999-1ebc-4756-a62f-a23d9c8eb7eb︡{"done":false,"event":"output"}︡{"html":"<h3>This mistake was all over Sage in 2006...</h3>\n\n<p>I remember David Harvey finding it after debugging why computing $\u0007lpha f(x)$, for $\u0007lpha$ a scalar and $f(x)$ a polynomial, was taking a huge amount of time.  It turned out that in the internal arithmetic code there was a try/except that determined which <code>__mul__</code> to use, and the runtime was dominated by computing the string representation of $f(x)$!</p>\n\n<h1>DOH.</h1>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠d051cda1-bf60-4e41-bc1e-ad46ecf79fd6r︠
%md
### Next, we will start Cython.   Brush up on your basic C programming, since it is relevant.
︡6b5a5831-ff7c-41cf-991f-0d030310db3a︡{"done":false,"event":"output"}︡{"html":"<h3>Next, we will start Cython.   Brush up on your basic C programming, since it is relevant.</h3>\n","done":false,"event":"output"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"done":false,"event":"output","once":true}︡{"stdout":"","done":true,"event":"output"}︡
︠c34b8c3d-f411-4207-8450-5620784222c1︠











