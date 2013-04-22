︠9d32a05f-bb89-4f74-873e-936354bd18cai︠
%md
# Lecture 10: Cython Crash Course (part 2)

## Reminders

- to me: start the Google+ Hangout

- Office Hours Tuesday 12:30 - 2 in Padelford C423

- Homework 3 due on Wednesday at midnight.  You will *have* to learn things (e.g., by reading tutorials, etc.) outside of my lectures in order to succeed in this class.
︡0b0857de-f5d0-4867-8ff2-d9fdbd82d4a0︡{"html":"<h1>Lecture 10: Cython Crash Course (part 2)</h1>\n\n<h2>Reminders</h2>\n\n<ul>\n<li><p>to me: start the Google+ Hangout</p></li>\n<li><p>Office Hours Tuesday 12:30 - 2 in Padelford C423</p></li>\n<li><p>Homework 3 due on Wednesday at midnight.  You will <em>have</em> to learn things (e.g., by reading tutorials, etc.) outside of my lectures in order to succeed in this class.</p></li>\n</ul>\n"}︡
︠109ce95b-b035-4dc6-a40d-865e5fb3dc1a︠
%md

## Today's Topics

1. Example cdef class for fast 2x2 matrices mod $p$.  Illustrates making a fast type for arithmetic (but not the coercion model).

2. Cython code in the Sage library
︡1d781cfa-a389-4043-b7b7-b5f56dfa4bac︡{"html":"<h2>Today&#8217;s Topics</h2>\n\n<ol>\n<li><p>Example cdef class for fast 2x2 matrices mod $p$.  Illustrates making a fast type for arithmetic (but not the coercion model).</p></li>\n<li><p>Cython code in the Sage library</p></li>\n</ol>\n"}︡
︠0970f0b3-31a7-48f7-b9bf-8cea939034cdi︠
%md
### Example: 2x2 matrices mod $p$, where $p$ is a *small* prime

︡26b68730-d99f-4aa3-9972-9b9d63e92fbb︡{"html":"<h3>Example: 2x2 matrices mod $p$, where $p$ is a <em>small</em> prime</h3>\n"}︡
︠40f35473-36ba-4cf2-b96f-29eae3637702︠
%md
### Step 1: write it in Python!

If there is any possible way to write something in Python first, do that.  It is way easier.  Python is easy; instead you focus on your ignorance and confusion about algorithms and what you actually want to do.

- You will figure out exactly what you want to make fast

︡188c29b1-68f8-4089-a951-fa8c1602fa8b︡{"html":"<h3>Step 1: write it in Python!</h3>\n\n<p>If there is any possible way to write something in Python first, do that.  It is way easier.  Python is easy; instead you focus on your ignorance and confusion about algorithms and what you actually want to do.</p>\n\n<ul>\n<li>You will figure out exactly what you want to make fast</li>\n</ul>\n"}︡
︠542261f9-725a-4416-9dc9-67e123619c53︠
# What is built into Sage -- same answers; good.
a0 = matrix(GF(37),2,[1..4])
b0 = matrix(GF(37),2,[5..8])
a0 + b0
a0 * b0
a0.det()
︡134b1a45-88a5-45db-96e9-26c823724993︡{"stdout":"[ 6  8]\n[10 12]"}︡{"stdout":"\n"}︡{"stdout":"[19 22]\n[ 6 13]"}︡{"stdout":"\n"}︡{"stdout":"35"}︡{"stdout":"\n"}︡

︠b38abed1-d77d-4813-a0e3-021816733ffa︠
# Our first implementation using Python
class Mat2:
    def __init__(self, a,b,c,d, p):
        (self.a, self.b, self.c, self.d) = (int(a%p), int(b%p), int(c%p), int(d%p))
        self.p = int(p)
    def __repr__(self):
        return "[%s,%s; %s,%s] mod %s"%(self.a, self.b, self.c, self.d, self.p)
    def __add__(self, right):  # we should worry that right is a Mat2, but don't.
        return Mat2(self.a + right.a, self.b + right.b,
                    self.c + right.c, self.d + right.d, self.p)
    def __mul__(self, right):
        return Mat2(self.a*right.a + self.b*right.c,
                    self.a*right.b + self.b*right.d,
                    self.c*right.a + self.d*right.c,
                    self.c*right.b + self.d*right.d, self.p)
    def det(self):
        return (self.a*self.d - self.b*self.c)%self.p
︡b28f0740-d35f-4763-9654-8c04c3a07876︡
︠14b90019-7a87-4423-b3bd-a81d45c98d70︠
# Test it
a1 = Mat2(1,2,3,4,37); a1
b1 = Mat2(5,6,7,8,37); b1
print "a + b = ", a1 + b1
print "a * b = ", a1 * b1
print "det a = ", a1.det()
︡c07c85ec-408c-457b-ac32-7d84ecfe14d0︡{"stdout":"[1,2; 3,4] mod 37"}︡{"stdout":"\n"}︡{"stdout":"[5,6; 7,8] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a + b = "}︡{"stdout":" "}︡{"stdout":"[6,8; 10,12] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a * b = "}︡{"stdout":" "}︡{"stdout":"[19,22; 6,13] mod 37"}︡{"stdout":"\n"}︡{"stdout":"det a = "}︡{"stdout":" "}︡{"stdout":"35"}︡{"stdout":"\n"}︡
︠4f4bfeb8-0b9f-465e-9bf9-014bba6a056f︠
# At this point, in real life, I would write something to generate
# random test data and run it...
︠f2c71668-b9b0-4cd6-8f7f-2fa0e6eb54eb︠
# Benchmark:
%timeit a0 + b0
%timeit a1 + b1
︡08b42000-d412-4f5c-8ded-70756f48321e︡{"stdout":"625 loops, best of 3: 4.4 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 3.58 µs per loop"}︡{"stdout":"\n"}︡
︠65a3a56d-104d-4d3c-9dd6-693b7ac6a9de︠
# Wow, we already compare well to what is in Sage (overhead, type checking, parents)
%timeit a0 * b0
%timeit a1 * b1
︡666c12ea-219e-474c-9130-b3a1159d1331︡{"stdout":"625 loops, best of 3: 10.6 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 4.13 µs per loop"}︡{"stdout":"\n"}︡
︠e0119f28-a499-402d-b974-2a9c357f810a︠
# Now for the real fun; cythonize!
%cython
class CMat2:
    def __init__(self, a,b,c,d, p):
        (self.a, self.b, self.c, self.d) = (int(a%p), int(b%p), int(c%p), int(d%p))
        self.p = int(p)
    def __repr__(self):
        return "[%s,%s; %s,%s] mod %s"%(self.a, self.b, self.c, self.d, self.p)
    def __add__(self, right):  # we should worry that right is a Mat2, but don't.
        return CMat2(self.a + right.a, self.b + right.b,
                    self.c + right.c, self.d + right.d, self.p)
    def __mul__(self, right):
        return CMat2(self.a*right.a + self.b*right.c,
                    self.a*right.b + self.b*right.d,
                    self.c*right.a + self.d*right.c,
                    self.c*right.b + self.d*right.d, self.p)
    def det(self):
        return (self.a*self.d - self.b*self.c)%self.p

︡04c0e154-eec5-48e9-9f29-66238cd4984d︡{"file":{"show":false,"uuid":"f82fd60a-67c2-4630-97ca-85830a6f22dd","filename":"/home/wstein/.sage/temp/localhost/25758/spyx/_home_wstein__sage_temp_localhost_25758_dir_QaJCAs_a_pyx/_home_wstein__sage_temp_localhost_25758_dir_QaJCAs_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/25758/spyx/_home_wstein__sage_temp_localhost_25758_dir_QaJCAs_a_pyx/_home_wstein__sage_temp_localhost_25758_dir_QaJCAs_a_pyx_0.html?uuid=f82fd60a-67c2-4630-97ca-85830a6f22dd' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠2b1412fa-818f-48d1-8b8b-e2814d46c580︠
# Test it
a2 = CMat2(1,2,3,4,37); a2
b2 = CMat2(5,6,7,8,37); b2
print "a + b = ", a2 + b2
print "a * b = ", a2 * b2
print "det a = ", a2.det()
︡3b6ba0fd-c09c-4eb3-a7f4-d3e128a37194︡{"stdout":"[1,2; 3,4] mod 37"}︡{"stdout":"\n"}︡{"stdout":"[5,6; 7,8] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a + b = "}︡{"stdout":" "}︡{"stdout":"[6,8; 10,12] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a * b = "}︡{"stdout":" "}︡{"stdout":"[19,22; 6,13] mod 37"}︡{"stdout":"\n"}︡{"stdout":"det a = "}︡{"stdout":" "}︡{"stdout":"35"}︡{"stdout":"\n"}︡
︠93640861-3bf9-4a38-9fa9-350a80acb841︠
%timeit a0 + b0
%timeit a1 + b1
%timeit a2 + b2
︡2ebdb1e5-9f71-43f4-9d75-4cc128973b7c︡{"stdout":"625 loops, best of 3: 4.37 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 5.03 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 2.75 µs per loop"}︡{"stdout":"\n"}︡
︠10349abc-55fe-43fe-8afd-f1873343ed03︠
%timeit a0 * b0
%timeit a1 * b1
%timeit a2 * b2
︡0b88d41e-4571-486a-a31a-f4586555b128︡{"stdout":"625 loops, best of 3: 11.3 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 4.23 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 2.96 µs per loop"}︡{"stdout":"\n"}︡
︠3fcd3993-4c5e-4f32-8b73-837e8280743d︠
# We already compare well to (or beat) what is built in.
# Let's try making a,b,c,d int's (so assuming p small).

%cython
cdef class CMat2int:
    cdef int a,b,c,d,p
    def __init__(self, int a, int b, int c, int d, int p):
        (self.a, self.b, self.c, self.d) = (a%p, b%p, c%p, d%p)
        self.p = int(p)
    def __repr__(self):
        return "[%s,%s; %s,%s] mod %s"%(self.a, self.b, self.c, self.d, self.p)
    def __add__(CMat2int self, CMat2int right):  # we should worry that right is a Mat2, but don't.
        return CMat2int(self.a + right.a, self.b + right.b,
                    self.c + right.c, self.d + right.d, self.p)
    def __mul__(CMat2int self, CMat2int right):
        return CMat2int(self.a*right.a + self.b*right.c,
                    self.a*right.b + self.b*right.d,
                    self.c*right.a + self.d*right.c,
                    self.c*right.b + self.d*right.d, self.p)
    def det(self):
        return (self.a*self.d - self.b*self.c)%self.p
︡c1549fe9-50e7-4379-97e9-5d7496b9516a︡{"file":{"show":false,"uuid":"3fcdb5ee-174c-4894-9f69-62d2f314b018","filename":"/home/wstein/.sage/temp/localhost/25758/spyx/_home_wstein__sage_temp_localhost_25758_dir_OYLWbG_a_pyx/_home_wstein__sage_temp_localhost_25758_dir_OYLWbG_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/25758/spyx/_home_wstein__sage_temp_localhost_25758_dir_OYLWbG_a_pyx/_home_wstein__sage_temp_localhost_25758_dir_OYLWbG_a_pyx_0.html?uuid=3fcdb5ee-174c-4894-9f69-62d2f314b018' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠233413b1-78ed-4597-9da9-3e24d9c06af8︠
# Test it
a3 = CMat2int(1,2,3,4,37); a3
b3 = CMat2int(5,6,7,8,37); b3
print "a + b = ", a3 + b3
print "a * b = ", a3 * b3
print "det a = ", a3.det()
︡48c6265a-d135-43c3-b7af-8c837eda9eed︡{"stdout":"[1,2; 3,4] mod 37"}︡{"stdout":"\n"}︡{"stdout":"[5,6; 7,8] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a + b = "}︡{"stdout":" "}︡{"stdout":"[6,8; 10,12] mod 37"}︡{"stdout":"\n"}︡{"stdout":"a * b = "}︡{"stdout":" "}︡{"stdout":"[19,22; 6,13] mod 37"}︡{"stdout":"\n"}︡{"stdout":"det a = "}︡{"stdout":" "}︡{"stdout":"35"}︡{"stdout":"\n"}︡
︠f132d497-0059-4e4e-acf3-263146e76dca︠
%timeit a0 + b0
%timeit a1 + b1
%timeit a2 + b2
%timeit a3 + b3
︡40af3825-a6f9-4478-87a2-18e0ec9846c4︡{"stdout":"625 loops, best of 3: 8.13 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 3.62 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 2.55 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 190 ns per loop"}︡{"stdout":"\n"}︡
︠add925db-790a-42e5-8200-b437f2a3f3b9︠
%timeit a0 * b0
%timeit a1 * b1
%timeit a2 * b2
%timeit a3 * b3
︡d7327b91-3fce-45aa-b3d5-47632c9c010f︡{"stdout":"625 loops, best of 3: 10 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 4.13 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 2.99 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 185 ns per loop"}︡{"stdout":"\n"}︡
︠8b85b406-42e7-4c5d-bc48-e8249255872a︠
10/.185
︡5608a0f7-12fc-4ebf-a081-a54e6d95cd35︡{"stdout":"54.0540540540541"}︡{"stdout":"\n"}︡
︠c6ec23e2-995c-4833-8c22-f399f7b64b5d︠
type(a0)
︡6d9df3db-8b17-441d-baf8-abb0bf70f1f2︡{"stdout":"<type 'sage.matrix.matrix_modn_dense_float.Matrix_modn_dense_float'>"}︡{"stdout":"\n"}︡
︠94f6df51-5205-42cc-b038-7f6ee6d78b7a︠
type(a3)
︡5b7805e6-8636-4e7f-a4a1-882063bc1640︡{"stdout":"<type '_home_wstein__sage_temp_localhost_25758_dir_OYLWbG_a_pyx_0.CMat2int'>"}︡{"stdout":"\n"}︡
︠24fae6f2-c900-4a6f-86d2-a6407cc1afc2i︠
%md
#### Discussion Questions: Why is some little straightforward implementation of "what I want" over 50 times faster than what is in Sage?

 - We find similar issues with basic things in Numpy, R, etc.

 - Our code has no error checking at all. (but that makes little difference here...)


︡36c91f6f-a644-49d0-a773-8f52a715f7d2︡{"html":"<h4>Discussion Questions: Why is some little straightforward implementation of &#8220;what I want&#8221; over 50 times faster than what is in Sage?</h4>\n\n<ul>\n<li><p>We find similar issues with basic things in Numpy, R, etc.</p></li>\n<li><p>Our code has no error checking at all. (but that makes little difference here&#8230;)</p></li>\n</ul>\n"}︡
︠7adfb4d8-d6eb-4af0-8d39-e701a2b193b4︠
a0.parent()
︡38808455-622d-4ab8-86c6-a70e0e42bed4︡{"stdout":"Full MatrixSpace of 2 by 2 dense matrices over Finite Field of size 37"}︡{"stdout":"\n"}︡
︠ff9b4f2d-160d-4064-a8b7-d9249ca1d737︠
a0.  # tab -- there is a lot that is supported




︠c810ce5b-ba1e-4dc3-8249-913c687bab01i︠

%md
# Next -- look at some of Sage's source code that uses Cython (there is a *lot*)

#### Let's browser at (https://github.com/sagemath/sage/)[https://github.com/sagemath/sage/] since it is a lot nicer than some options...

- `module_list.py`

- `fast_arith.pyx`

- TimeSeries: `double*`

- Matrices

- Hidden Markov Models


︡6ba2db98-16c8-4fcb-9ad9-4eb7130d6bcb︡{"html":"<h1>Next &#8211; look at some of Sage&#8217;s source code that uses Cython (there is a <em>lot</em>)</h1>\n\n<h4>Let&#8217;s browser at (https://github.com/sagemath/sage/)[https://github.com/sagemath/sage/] since it is a lot nicer than some options&#8230;</h4>\n\n<ul>\n<li><p><code>module_list.py</code></p></li>\n<li><p><code>fast_arith.pyx</code></p></li>\n<li><p>TimeSeries: <code>double*</code></p></li>\n<li><p>Matrices</p></li>\n<li><p>Hidden Markov Models</p></li>\n</ul>\n"}︡
︠ca004d33-78bf-477f-83b4-bfbe680cc6ec︠




















