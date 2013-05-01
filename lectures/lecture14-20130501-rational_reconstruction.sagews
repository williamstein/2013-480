︠ca076d66-b8a3-459f-ac59-1b75ada25205i︠
%hide
%md

# Lecture 14: Rational Reconstruction

### Agenda:

1. Turn on screencast
2. Homework due tonight at midnight.
3. <https://cloud.sagemath.com> lives.  (After 15 minutes downtime yesterday to install 8TB of additional disk, and improve the rack cabling.)
4. General questions?
5. Today's lecture...
︡8f145f33-bed2-461e-8eb1-902825799459︡{"html":"<h1>Lecture 14: Rational Reconstruction</h1>\n\n<h3>Agenda:</h3>\n\n<ol>\n<li>Turn on screencast</li>\n<li>Homework due tonight at midnight.</li>\n<li><a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a> lives.  (After 15 minutes downtime yesterday to install 8TB of additional disk, and improve the rack cabling.)</li>\n<li>General questions?</li>\n<li>Today&#8217;s lecture&#8230;</li>\n</ol>\n"}︡
︠9feaba34-95de-4226-bc7b-da55d379c774i︠
%hide
%md
### A Reference

I published a book called *Modular Forms, a Computational Approach*, and Section 7.2 has a brief discussion of rational reconstruction, with some references.  This book is now freely available online at <http://wstein.org/books/modform>.
︡1b88ef8e-1fa5-4c3e-b8c8-c1765322073b︡{"html":"<h3>A Reference</h3>\n\n<p>I published a book called <em>Modular Forms, a Computational Approach</em>, and Section 7.2 has a brief discussion of rational reconstruction, with some references.  This book is now freely available online at <a href=\"http://wstein.org/books/modform\">http://wstein.org/books/modform</a>.</p>\n"}︡
︠c926caab-614d-4ca0-943b-3c28dcc65c1ci︠
%hide
%md
### Reducing Rational Numbers Modulo $m$

If $n/d$ is a rational number in lowest terms and $d$ is coprime to $m$, define
$n/d \mod{m}$ to be the unique $a\mod{m}$ such that $n\equiv ad\mod{m}$.
For example, $7/9 \equiv 223\pmod{1000}$ since $223\cdot 9 \equiv 7\pmod{1000}$:
︡62a25460-77fa-402a-bbb5-6c8aee2af6ce︡{"html":"<h3>Reducing Rational Numbers Modulo $m$</h3>\n\n<p>If $n/d$ is a rational number in lowest terms and $d$ is coprime to $m$, define\n$n/d \\mod{m}$ to be the unique $a\\mod{m}$ such that $n\\equiv ad\\mod{m}$.\nFor example, $7/9 \\equiv 223\\pmod{1000}$ since $223\\cdot 9 \\equiv 7\\pmod{1000}$:</p>\n"}︡
︠7f4b9a2d-2b7c-47e9-b50b-122028d0c1a4︠
(223*9)%1000
︡1f118c13-2aad-488f-8633-5fe680c41774︡{"stdout":"7"}︡{"stdout":"\n"}︡
︠f4428b33-b9b3-4bed-b32e-f43106b08893i︠
%hide
%md
### Question: Given $223\mod{1000}$ how can we "reconstruct" $\frac{7}{9}$?

This is "rational reconstruction".
︡827068f9-0e8f-49e1-813f-436fee436edf︡{"html":"<h3>Question: Given $223\\mod{1000}$ how can we &#8220;reconstruct&#8221; $\\frac{7}{9}$?</h3>\n\n<p>This is &#8220;rational reconstruction&#8221;.</p>\n"}︡
︠d292c406-920e-43e0-828f-23e214ec45e9i︠
%hide
%md
### An Observation

**Observation:** *Given an integer $a\geq 0$ and an integer $m\geq 3$, there is at most one rational number $n/d$ (in lowest terms) such that $|n|, d\leq \sqrt{m/2}$ and $n\equiv ad\pmod{m}$.*

In other words, $n/d \equiv a \pmod{m}$.

*Proof:*  If $n/d$ and $n'/d'$ are both congruent to $a$, then $n/d - n/'d' \equiv 0\pmod{m}$, so $nd'-n'd \equiv 0\pmod{m}$.  By the bound, $n'd\leq m/2$ and $nd'\leq m/2$, so if they are not equal and their difference is $0$, then $nd'=m/2$ and $n'd=-m/2$ (or conversely).  Again, because of the bound, this implies that $n=n'=|d|=|d'|=\sqrt{m/2}$, which contradicts that $n,d$ are coprime.

(Note: In my book I mistakenly only required $m>1$. Oops.  I think that is the first mathematical mistake found in my book.)
︡1368e01b-0c14-45b0-b964-9c6f8dd018f0︡{"html":"<h3>An Observation</h3>\n\n<p><strong>Observation:</strong> <em>Given an integer $a\\geq 0$ and an integer $m\\geq 3$, there is at most one rational number $n/d$ (in lowest terms) such that $|n|, d\\leq \\sqrt{m/2}$ and $n\\equiv ad\\pmod{m}$.</em></p>\n\n<p>In other words, $n/d \\equiv a \\pmod{m}$.</p>\n\n<p><em>Proof:</em>  If $n/d$ and $n&#8217;/d&#8217;$ are both congruent to $a$, then $n/d - n/&#8217;d&#8217; \\equiv 0\\pmod{m}$, so $nd&#8217;-n&#8217;d \\equiv 0\\pmod{m}$.  By the bound, $n&#8217;d\\leq m/2$ and $nd&#8217;\\leq m/2$, so if they are not equal and their difference is $0$, then $nd&#8217;=m/2$ and $n&#8217;d=-m/2$ (or conversely).  Again, because of the bound, this implies that $n=n&#8217;=|d|=|d&#8217;|=\\sqrt{m/2}$, which contradicts that $n,d$ are coprime.</p>\n\n<p>(Note: In my book I mistakenly only required $m>1$. Oops.  I think that is the first mathematical mistake found in my book.)</p>\n"}︡
︠0da52ad6-34a5-481e-a2ef-307aa36a964ai︠
%hide
%md
### Finding $n/d$: "rational reconstruction"

### Here is a little program to find $\frac{n}{d}$.

However, it is stupidly slow.
︡b8adab71-aeef-45f4-ad8b-d06fd1b08b44︡{"html":"<h3>Finding $n/d$: &#8220;rational reconstruction&#8221;</h3>\n\n<h3>Here is a little program to find $\\frac{n}{d}$.</h3>\n\n<p>However, it is stupidly slow.</p>\n"}︡
︠fa883fae-7ddb-44ed-a1b6-0f99339a39d3︠
def rr1(a, m):
    m = int(m); a = int(a)
    B = int(math.sqrt(m/2))
    for n in range(B+1):
        for d in range(-B, B+1):
            if d and (n - a*d)%m == 0:
                return ZZ(n)/d
    raise ValueError("no solution")
︡83b870de-92e6-4dcd-8c58-6c3083419b7a︡
︠357d54f1-2490-4435-9aeb-b22a4bcc13c3︠
Mod(7/9,1000)
︡d5ced501-902b-483b-b199-cd3807f9f684︡{"stdout":"223"}︡{"stdout":"\n"}︡
︠d181f168-982b-4d0e-a8b5-d98867e09bc0︠
rr1(223, 1000)
︡a5dfd2c1-859e-4436-bd72-03f556b7fbe8︡{"stdout":"7/9"}︡{"stdout":"\n"}︡
︠1ece3cd7-bb7a-4cda-89d2-3704c8799c5b︠
%timeit rr1(223,1000)
︡9ab93223-0ce1-4e84-ac7f-ed580e085057︡{"stdout":"625 loops, best of 3: 185 µs per loop"}︡{"stdout":"\n"}︡
︠f0370c0d-4b1c-4f6a-aed9-d688892f39dc︠
# Above time is "ok" (say), but this is depressing.
%time rr1(223,10^7)
︡604cb322-9136-4e4e-ae24-6a106c61a5c2︡{"stdout":"223"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.45 s, Wall time: 0.46 s"}︡{"stdout":"\n"}︡
︠4d97d3f7-7ba0-4370-b3ec-384d6d67b62c︠
# For fun, we can try Cython:
%cython
import math
from sage.all import ZZ
def rr1(long a, long m):
    cdef long n, d, B = int(math.sqrt(m//2))
    for n in range(B+1):
        for d in range(-B, B+1):
            if d and (n - a*d)%m == 0:
                return ZZ(n)/d
    raise ValueError("no solution")
︡0f98706f-eceb-4e25-9857-9e871ba06092︡{"file":{"show":false,"uuid":"950f6790-0f7b-42c1-890d-40731dd691f8","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/9281/spyx/_mnt_home_D6VXKxGo__sage_temp_compute1a_9281_dir_kO6cgd_a_pyx/_mnt_home_D6VXKxGo__sage_temp_compute1a_9281_dir_kO6cgd_a_pyx_0.html"}}︡{"html":"<a href='/blobs//mnt/home/D6VXKxGo/.sage/temp/compute1a/9281/spyx/_mnt_home_D6VXKxGo__sage_temp_compute1a_9281_dir_kO6cgd_a_pyx/_mnt_home_D6VXKxGo__sage_temp_compute1a_9281_dir_kO6cgd_a_pyx_0.html?uuid=950f6790-0f7b-42c1-890d-40731dd691f8' target='_new' class='btn btn-small '>Show auto-generated code &nbsp;<i class='icon-external-link'></i></a>"}︡
︠56e51ce3-142c-4d51-9686-b40defc4750e︠
# This is way faster...
%timeit rr1(223,10^7)
︡461a1518-b889-40a6-a4e2-019195d6e7f0︡{"stdout":"25 loops, best of 3: 11 ms per loop"}︡{"stdout":"\n"}︡
︠18ac6377-7e7c-480e-8322-6029c4cc2519i︠
%html
<h3>Motivating Application -- reduced row echelon form</h3>

I learned about rational reconstruction back in 1999 from Allan Steele, when he was explaining to me how he made <a href="http://magma.maths.usyd.edu.au/magma/">Magma's</a> linear algebra code dramatically faster than anything else available at the time.   I was suprised.  (Note: Steele didn't necessarily necessarily invent any of this stuff -- he explained a bit of it to me and was the first person to systematically implement everything together in one optimized package.)
<br><br>

<div class="row">
    <div class="span7">
        <b>Problem:</b> Compute the reduced row echelon form of a matrix $A$ over $\mathbb{Q}.$<br>
<br>
        <b>Major Issue:</b> Imagine doing Gauss elimination on a random $n\times n$ matrix.  The input may
        be small, but you'll have huge numbers in each intermediate step... until the end, when you clear the last column and get the identity matrix.
<br><br>
        <b>Solution:</b><br>

        <ol>
            <li> Reduce $A$ modulo *lots* of prime numbers $p\_i$, and compute the reduced row echelon form of each of these matrices.  The numbers never get big!</li><br>

            <li> Use the Chinese Remainder Theorem to combine all these matrices mod $p$ together into a single matrix modulo $m = \prod p_i$. </li><br>

            <li> Use rational reconstruction to lift the matrix from 2 to the echelon form of $A$.</li>
        </ol>
    <span class="lighten">(Note: There are some subtleties that involve detecting bad primes and in proving that the answer is right. These are explained in my book, where I came up with ways to do this myself from scratch.)
    </div>

    <div class="span3">
         <img src="http://magma.maths.usyd.edu.au/~allan/allan4.jpg" style="width:100%" class="pull-right">
    </div>
</div>
︡e307648a-4f47-4bcf-a04b-7e28c56dd98a︡{"html":"<h3>Motivating Application -- reduced row echelon form</h3>\n\nI learned about rational reconstruction back in 1999 from Allan Steele, when he was explaining to me how he made <a href=\"http://magma.maths.usyd.edu.au/magma/\">Magma's</a> linear algebra code dramatically faster than anything else available at the time.   I was suprised.  (Note: Steele didn't necessarily necessarily invent any of this stuff -- he explained a bit of it to me and was the first person to systematically implement everything together in one optimized package.)\n<br><br>\n\n<div class=\"row\">\n    <div class=\"span7\">\n        <b>Problem:</b> Compute the reduced row echelon form of a matrix $A$ over $\\mathbb{Q}.$<br>\n<br>\n        <b>Major Issue:</b> Imagine doing Gauss elimination on a random $n\\times n$ matrix.  The input may\n        be small, but you'll have huge numbers in each intermediate step... until the end, when you clear the last column and get the identity matrix.\n<br><br>\n        <b>Solution:</b><br>\n\n        <ol>\n            <li> Reduce $A$ modulo *lots* of prime numbers $p\\_i$, and compute the reduced row echelon form of each of these matrices.  The numbers never get big!</li><br>\n\n            <li> Use the Chinese Remainder Theorem to combine all these matrices mod $p$ together into a single matrix modulo $m = \\prod p_i$. </li><br>\n\n            <li> Use rational reconstruction to lift the matrix from 2 to the echelon form of $A$.</li>\n        </ol>\n    <span class=\"lighten\">(Note: There are some subtleties that involve detecting bad primes and in proving that the answer is right. These are explained in my book, where I came up with ways to do this myself from scratch.)\n    </div>\n\n    <div class=\"span3\">\n        <img src=\"http://magma.maths.usyd.edu.au/~allan/allan4.jpg\" style=\"width:100%\" class=\"pull-right\">\n    </div>\n</div>"}︡
︠240496f2-d25f-4ac1-a06b-225de37f9cc9i︠
%md
### Issue: A 1000x2000 matrix has two million entries in it and the modulus $m$ will be HUGE.

#### ... and matrices often have very large entries in their echelon form!
︡80d12065-a9a9-4051-bcec-9b8925ce8f16︡{"html":"<h3>Issue: A 1000x2000 matrix has two million entries in it and the modulus $m$ will be HUGE.</h3>\n\n<h4>&#8230; and matrices often have very large entries in their echelon form!</h4>\n"}︡
︠b711852c-94fb-433e-b4e5-41c3c7c017af︠
A = random_matrix(QQ,50,51)
print A[0]  # first row
︡9a91d03b-645d-4e47-a5de-ad1c3cb7faf0︡{"stdout":"(1/2, 0, -2, 1/2, 0, 2, 0, 0, -1, 2, 0, -2, 0, 2, -1, 0, 1, -2, 0, -1, 1/2, 1, -1, 0, 1/2, 1, 0, -1, 0, -2, 2, 1, 1/2, 0, 0, 0, 1/2, -2, -2, 0, 1, 2, -2, 1/2, 2, 1/2, 0, -1/2, 1, 0, 2)"}︡{"stdout":"\n"}︡
︠47010f30-942b-4091-964c-667a123ee15e︠
B = A.rref()
︡4a2a5ad7-953a-4418-ac2a-218f7a717908︡
︠59b5eb66-9054-4dc4-a653-c27cc5139925︠
B.transpose()[-1]   # last column of B!
︡cfea8d79-aa86-46c2-9834-311c36ff60ff︡{"stdout":"(1136495897155048097663156084069345016087016408849/960713505604025710035221105007592391959706258877, 1401333311205616173197173155099631581683367513425/960713505604025710035221105007592391959706258877, 2337360999981299495835153890633576862141140846302/960713505604025710035221105007592391959706258877, 1840160594758944051433473959687920955560709857640/960713505604025710035221105007592391959706258877, -4311477259838084896557433418511340201396142224555/960713505604025710035221105007592391959706258877, -263698759625241331546108886782677531383763778705/35581981689037989260563744629910829331840972551, 1475108065837407300105382716713878733235753088384/960713505604025710035221105007592391959706258877, 1149731821657173241538246747717431592131050041794/960713505604025710035221105007592391959706258877, 6624105030280413117943592361482827508575346597453/960713505604025710035221105007592391959706258877, -2091814010337207645627871968473947379712403815572/960713505604025710035221105007592391959706258877, 1928606041499947239996629671295820762563702396381/320237835201341903345073701669197463986568752959, 2708360663446053372263439549883446531430840099/106745945067113967781691233889732487995522917653, -3983440670142262263219368595460663372605521206304/960713505604025710035221105007592391959706258877, 91206057838034463830690618164028533464784661833/320237835201341903345073701669197463986568752959, 1306964210396544209256691222772655019713324722863/960713505604025710035221105007592391959706258877, 3585382580646698255410443773110392916210576190872/960713505604025710035221105007592391959706258877, -3477131649774479643916916364977491292929020668954/960713505604025710035221105007592391959706258877, 33670991555671735864661138459434060007633742272/106745945067113967781691233889732487995522917653, 359932846177218467326245619656773376119826791842/960713505604025710035221105007592391959706258877, 2440054379465366796342380476838626968511807700671/960713505604025710035221105007592391959706258877, 594177441195352089165857279392881077865307457201/320237835201341903345073701669197463986568752959, 584844507496711150507311586759616065503863976863/960713505604025710035221105007592391959706258877, -4901866013656335200044734894298921366959655072927/960713505604025710035221105007592391959706258877, -900950345303633744167024170105445018471776896050/960713505604025710035221105007592391959706258877, -56685950864306685702192003873415749960674450971/960713505604025710035221105007592391959706258877, -232813089535468335895368467675480081755257721090/960713505604025710035221105007592391959706258877, -2004253557224888362821030899589180048572481250148/320237835201341903345073701669197463986568752959, -470664359249999769209753442910519047187538914756/960713505604025710035221105007592391959706258877, -114996723333261804252116596334625945861466510238/960713505604025710035221105007592391959706258877, -1784003081837345854192277960481675018292411687141/960713505604025710035221105007592391959706258877, -309305912733134439114379354931122431299217743947/960713505604025710035221105007592391959706258877, -2784708649103211660655409449104150280537698644323/960713505604025710035221105007592391959706258877, 1555909424598356456247251792909911692094384248709/320237835201341903345073701669197463986568752959, 3158264479453081318872044100862328340932425245272/960713505604025710035221105007592391959706258877, -2211629227577076774258997103508531223604258326100/320237835201341903345073701669197463986568752959, -3106617486476630629466324277154470055836671759966/960713505604025710035221105007592391959706258877, 1590602905815108678882789017032798432618014017030/960713505604025710035221105007592391959706258877, 2756098692031753052069027795267297587875318077935/960713505604025710035221105007592391959706258877, -1603226115974264180423055420814301887694488807330/320237835201341903345073701669197463986568752959, 705266368519347340398546889524668374133435539634/960713505604025710035221105007592391959706258877, -871381815307000235351175343100449344627517474205/960713505604025710035221105007592391959706258877, 100813827721419373961735649896251053554297993434/35581981689037989260563744629910829331840972551, -1948548863912056491236748028332504205657741696844/320237835201341903345073701669197463986568752959, 411981245715347532926567903993754704195268013316/106745945067113967781691233889732487995522917653, 778536272843287344678847101229179604505316355631/960713505604025710035221105007592391959706258877, 2796675925512475336937616584169884814655608488186/960713505604025710035221105007592391959706258877, 23712650542514417340649082409445725144189182150/106745945067113967781691233889732487995522917653, -1825011004188561782071849307020825321677821214682/960713505604025710035221105007592391959706258877, 1512843819184844923166059008877960517833765469510/960713505604025710035221105007592391959706258877, 521383414475513983744847250389038824319657291310/320237835201341903345073701669197463986568752959)"}︡{"stdout":"\n"}︡
︠ccad6121-2650-4183-bbfc-3567cce7bb2bi︠
%hide
%md

### A much better algorithm

Imagine you apply the Euclidean algorithm to compute $gcd(m,a)$.  You start by writing
$$
   m + a q = r
$$
where $q$ is minus the quotient and $r$ the remainder of division of $m$ by $a$.
Notice that you might think you just efficiently found a rational number $r/q$ such that
$$
\frac{r}{q} \equiv a \pmod{m}.
$$
The problems are that $r/q$ might not have small numerator and denominator, and of course $q$ is not likely to be coprime to $m$, etc.
The actual algorithm for rational reconstruction more or less involves repeatedly
performing these quotient remainder steps, keeping track of exactly what happens,
and being able to tell whether or not there is any rational number at all that
satisfies the bound.

**Warning:** the details are surprisingly tricky.  Evidently, even the first published paper on this topic
had mistakes.

︡dc8c96a7-2596-40f9-a185-cd58b68fd37b︡{"html":"<h3>A much better algorithm</h3>\n\n<p>Imagine you apply the Euclidean algorithm to compute $gcd(m,a)$.  You start by writing\n$$\n   m + a q = r\n$$\nwhere $q$ is minus the quotient and $r$ the remainder of division of $m$ by $a$.\nNotice that you might think you just efficiently found a rational number $r/q$ such that\n$$\n\\frac{r}{q} \\equiv a \\pmod{m}.\n$$\nThe problems are that $r/q$ might not have small numerator and denominator, and of course $q$ is not likely to be coprime to $m$, etc.\nThe actual algorithm for rational reconstruction more or less involves repeatedly\nperforming these quotient remainder steps, keeping track of exactly what happens,\nand being able to tell whether or not there is any rational number at all that\nsatisfies the bound.</p>\n\n<p><strong>Warning:</strong> the details are surprisingly tricky.  Evidently, even the first published paper on this topic\nhad mistakes.</p>\n"}︡
︠7e18a059-8b4f-41ae-8125-da0cb2b58e83︠
# For m=1000, a=223, we get:

m = 1000
a = 223
q, r = m.quo_rem(a); q = -q
q, r
m + a*q == r
r/q
Mod(r/q, m)
︡66cfffe0-c46c-4c75-b325-3b8145aca7d7︡{"stdout":"(-4, 108)"}︡{"stdout":"\n"}︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"-27"}︡{"stdout":"\n"}︡{"stdout":"973"}︡{"stdout":"\n"}︡
︠e864060e-33d9-4257-aab0-e1e6321a2fe4︠
m.quo_rem(a)
︡237958d1-a936-486f-a1ac-d0d41e17e6db︡{"stdout":"(4, 108)"}︡{"stdout":"\n"}︡
︠f4dcae6d-af93-4148-8679-c9bfc7dd6ee3︠
Mod(7/9,1000)
︡f9c23dab-0a7e-41be-b7f6-ff9ac4f99475︡{"stdout":"223"}︡{"stdout":"\n"}︡
︠f77e9ad4-0e86-4ecb-9400-7865cb034b9c︠
# Use Function in Sage
Mod(223,1000).rational_reconstruction()
rational_reconstruction(223, 1000)
︡3d6b9cfb-638f-4c41-80aa-9d2fdf39f4eb︡{"stdout":"7/9"}︡{"stdout":"\n"}︡{"stdout":"7/9"}︡{"stdout":"\n"}︡
︠499f4b8a-c52b-49c9-a079-c245b3685aaf︠
rational_reconstruction??
︠fdeba6cf-e1df-4203-902a-09a7f9ee1be6︠
a = ZZ(223)
a.rational_reconstruction??
︠16d79aa9-e6be-483c-a3e3-fecec4fe4435︠
%md
### The Actual Source Code:

See this file:
<https://github.com/sagemath/sage/blob/master/src/sage/ext/gmp.pxi>



︠9ae0e39d-b446-46d8-a884-62201fe997cd︠
# Recall (or cython code):
%timeit rr1(223,10^7)
︡e15de6b5-5d12-4077-90d0-d2b4790f01c3︡{"stdout":"25 loops, best of 3: 11 ms per loop"}︡{"stdout":"\n"}︡
︠97788f40-b5b0-48a8-84e8-2f40ed17fce5︠
%timeit rr1(223,10^8)
︡3a57d923-6453-482c-8f38-2ec69ea691dc︡{"stdout":"25 loops, best of 3: 35.7 ms per loop"}︡{"stdout":"\n"}︡
︠3ca67eef-46fd-4b0e-9b85-46b7d4673e4d︠
%timeit 223.rational_reconstruction(10^8)
︡c353e333-fa36-4791-b582-3bc6b850dc22︡{"stdout":"625 loops, best of 3: 6.76 µs per loop"}︡{"stdout":"\n"}︡
︠8e2f6ff1-85e9-4cd1-9d61-c5dc2a18fffe︠
# A vastly better algorithm:
35.7/.00676
︡77d1eca1-985e-47b9-82f5-9ef3f0091302︡{"stdout":"5281.06508875740"}︡{"stdout":"\n"}︡
︠86bce000-5917-4e47-9d8b-dee19a5819ca︠
a = Mod(9393902384092834/29008098209348121127, 10^300); a
︡7d51f72a-37d4-4b9e-9209-81afe0f1e915︡{"stdout":"408903779465428065507206643927223798530479083889065051581527866829731519081445479756991993256042284146478434189972777556952573559785460232920334694992830599622915615961784916223477897631406295078465624963176640395490313490666387944524002664435859732920472811081339717193230146822991661104852427846542"}︡{"stdout":"\n"}︡
︠c009e46c-5207-4cc4-896a-80d0e36a04a1︠
a.rational_reconstruction()
︡1fd67f14-82e7-40a6-9e16-6f715533edd9︡{"stdout":"9393902384092834/29008098209348121127"}︡{"stdout":"\n"}︡
︠6a1bd9a1-96e2-43b9-903b-cb25fe29564d︠
%timeit a.rational_reconstruction()
︡073dd0fc-ea75-4c40-994c-dbf7a1212099︡{"stdout":"625 loops, best of 3: 55.2 µs per loop"}︡{"stdout":"\n"}︡
︠f98672d1-42f8-4ecb-b2be-3eff6169419ei︠
%hide
%md

### Plan:
- Public-key cryptography, since it is so closely related to what we just did.
- Mathematical typesetting (latex, mathjax).
- Hidden Markov Models (some statistics, machine learning, and and maybe a little finance)
- Sage development: git, patch review, trac, etc.
︡73921bfb-a0b1-40e8-9850-687a33bd1727︡{"html":"<h3>Plan:</h3>\n\n<ul>\n<li>Public-key cryptography, since it is so closely related to what we just did.</li>\n<li>Mathematical typesetting (latex, mathjax).</li>\n<li>Hidden Markov Models (some statistics, machine learning, and and maybe a little finance)</li>\n<li>Sage development: git, patch review, trac, etc.</li>\n</ul>\n"}︡
︠9cbdeda3-82a6-4e88-8534-f546d8fe27e1︠







