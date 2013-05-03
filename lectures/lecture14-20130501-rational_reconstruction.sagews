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
︠12bc7802-be6c-48d9-99c7-8a9312a77e51︠
9*223
︡2a7054da-527c-4303-bec3-f78112f49b0a︡{"stdout":"2007"}︡{"stdout":"\n"}︡
︠dd201326-72a7-4a93-96b5-9761290db1f9︠
Mod(2/3, 7)
︡d8f7d07d-3a17-46b0-883d-6000276a7504︡{"stdout":"3"}︡{"stdout":"\n"}︡
︠51dd20eb-e3f6-4b7d-ac1a-e1549b889193︠
(2/3) % 7
︡3f71ed1d-b7bf-4b8b-b8b6-5ab1611d063e︡{"stdout":"3"}︡{"stdout":"\n"}︡
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
︡55277563-ae4a-4524-8afd-2d1074019e5b︡
︠357d54f1-2490-4435-9aeb-b22a4bcc13c3︠
Mod(7/9,1000)
︡8786d382-cc29-44ea-b846-8124e4b19dc5︡{"stdout":"223"}︡{"stdout":"\n"}︡
︠3058a56e-d132-42d7-bd61-a36d4c78fa91︠
rr1(223, 1000)
rr1(224, 1000)
︡e2e7d848-d55d-41b9-86ab-6d2be6d0dcee︡{"stdout":"7/9"}︡{"stdout":"\n"}︡{"stdout":"16/9"}︡{"stdout":"\n"}︡
︠d181f168-982b-4d0e-a8b5-d98867e09bc0︠
rr1(225, 1000)
︡293c9b0b-d208-43c6-ae7e-3c0093f9f258︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"\", line 8, in rr1\n"}︡{"stderr":"ValueError: no solution\n"}︡
︠1ece3cd7-bb7a-4cda-89d2-3704c8799c5b︠
%timeit rr1(223,1000)
︡015dedbc-44d8-4fd8-80b0-e505247284ae︡{"stdout":"625 loops, best of 3: 190 µs per loop"}︡{"stdout":"\n"}︡
︠f0370c0d-4b1c-4f6a-aed9-d688892f39dc︠
# Above time is "ok" (say), but this is depressing.
%time rr1(223,10^7)
︡37fba019-796e-4241-b68b-ea82043a9917︡{"stdout":"223"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.47 s, Wall time: 0.46 s"}︡{"stdout":"\n"}︡
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
︡65836ea7-755c-4ea9-9a6a-fce7729a9367︡{"stdout":"(-1, -1, 0, -1, 0, -2, 0, 0, 1, 1, 1, -1, 2, 1, 2, 0, 0, -1, 2, 0, 1/2, -1, 0, 0, 1, 0, 0, 0, -2, 1, 0, 0, -1/2, -2, 0, -1, -1, -1/2, -1, 0, -2, 0, -2, 0, 2, 1/2, 0, -2, 1, 0, -2)"}︡{"stdout":"\n"}︡
︠110fad99-0b7d-4211-b150-4cdc68568e2b︠

︠47010f30-942b-4091-964c-667a123ee15e︠
%time B = A.rref()
︡ef688337-0ef5-4dd5-ae96-fe675cfc4892︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s"}︡{"stdout":"\n"}︡
︠59b5eb66-9054-4dc4-a653-c27cc5139925︠
B.transpose()[-1]   # last column of B!
︡ce673e76-9931-49de-bf95-c02e39f5d811︡{"stdout":"(95180610256234983477171321720102611906962133282/115233022449930168737429803535883136159293023865, -475952116647594458244403042641622805246244037481/460932089799720674949719214143532544637172095460, 507768732771648511195241931223157009679342956247/307288059866480449966479476095688363091448063640, -47261985421932430682282377961296281641264733525/61457611973296089993295895219137672618289612728, -32391172754678663799132887185265653991882025449/115233022449930168737429803535883136159293023865, -228843818370842682653735962037858799307844951009/460932089799720674949719214143532544637172095460, -147478154191615538950056097706732689657386109411/230466044899860337474859607071766272318586047730, -160875758486076399708544428351219982095752428931/460932089799720674949719214143532544637172095460, -86098904301653349171454747299572710977891799223/230466044899860337474859607071766272318586047730, -515305891848723194991667996445153390751692685883/307288059866480449966479476095688363091448063640, 9637614242411129093319092761595679045795303281/46093208979972067494971921414353254463717209546, -4135518906327627078105337013182674047527913651/20040525643466116302161704962762284549442265020, 3410498463882357122856744635538325582377823917/307288059866480449966479476095688363091448063640, 445138820315067745629691484460371437183799523649/460932089799720674949719214143532544637172095460, 75524225367685774887380576957797415220159922577/307288059866480449966479476095688363091448063640, 579712045089132238362590946728354028728503614811/921864179599441349899438428287065089274344190920, 89587397034945682323689246709600273320997961997/76822014966620112491619869023922090772862015910, 598243005818076458577516989968089763427370544013/307288059866480449966479476095688363091448063640, -811699447222776709411855808692013574005012689/92186417959944134989943842828706508927434419092, -164741238093859472680413196520313452456587114283/184372835919888269979887685657413017854868838184, 694595380889002651972744772517783783112048050049/460932089799720674949719214143532544637172095460, 408789704478960871013353054100736148283935599359/460932089799720674949719214143532544637172095460, -149325436308624576741344457479638916480287904881/92186417959944134989943842828706508927434419092, -22565169342580828955105361545580869252926145351/115233022449930168737429803535883136159293023865, 144696426478914385821445561510008395889393805097/153644029933240224983239738047844181545724031820, 700941954772809079043331517711460395083755477341/460932089799720674949719214143532544637172095460, -196934994046401154503824936216970782860408781654/115233022449930168737429803535883136159293023865, -621630775142011421872224364045294843993866227603/921864179599441349899438428287065089274344190920, 22043600721470167448444336128957010016348202817/61457611973296089993295895219137672618289612728, -15874432548444171952832456411180153826823331309/307288059866480449966479476095688363091448063640, 11793367651184035593278996223093871077050226803/23046604489986033747485960707176627231858604773, -82099597546030364941416487589407178503958339133/61457611973296089993295895219137672618289612728, 111658334957483453785410808140412414688760117453/153644029933240224983239738047844181545724031820, 158379656563619772638428899453540810829614566747/307288059866480449966479476095688363091448063640, -825632560937293570999169372578487394922147489093/921864179599441349899438428287065089274344190920, 233827820652192819090258987109032363995254561167/153644029933240224983239738047844181545724031820, 147011764630767449039517333047363931352687684597/921864179599441349899438428287065089274344190920, 914338967992985788194614380774878215053062210727/921864179599441349899438428287065089274344190920, 424112136233624207396359046318909465494945574777/460932089799720674949719214143532544637172095460, -29279367892508028358467388378930422004211019637/153644029933240224983239738047844181545724031820, 193598740597500269198368736758030172899865008951/921864179599441349899438428287065089274344190920, -4374876743710857826278448761512834382113378997/30728805986648044996647947609568836309144806364, 27482216013017189317930979551738132442688261229/153644029933240224983239738047844181545724031820, 606604855616239275546402106631417981891202196367/921864179599441349899438428287065089274344190920, -21205717442786727369042937968361179204689732692/38411007483310056245809934511961045386431007955, 194447927613082288448520023760880004944737367859/307288059866480449966479476095688363091448063640, 102923111122016723368438346216671834927904402361/307288059866480449966479476095688363091448063640, -153454249301220037634892416739698733065896361371/115233022449930168737429803535883136159293023865, 694096101924305957336007124681147159724320633549/460932089799720674949719214143532544637172095460, -46850463604286745374563287930690177899031610813/460932089799720674949719214143532544637172095460)"}︡{"stdout":"\n"}︡
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



︡7cbe6eca-d597-4deb-bcdd-1e8e873982fe︡{"html":"<h3>The Actual Source Code:</h3>\n\n<p>See this file:\n<a href=\"https://github.com/sagemath/sage/blob/master/src/sage/ext/gmp.pxi\">https://github.com/sagemath/sage/blob/master/src/sage/ext/gmp.pxi</a></p>\n"}︡
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
︡b4a9258e-80ed-4d56-81a5-6c979c82e424︡{"stdout":"408903779465428065507206643927223798530479083889065051581527866829731519081445479756991993256042284146478434189972777556952573559785460232920334694992830599622915615961784916223477897631406295078465624963176640395490313490666387944524002664435859732920472811081339717193230146822991661104852427846542"}︡{"stdout":"\n"}︡
︠c009e46c-5207-4cc4-896a-80d0e36a04a1︠
a.rational_reconstruction()
︡1fd67f14-82e7-40a6-9e16-6f715533edd9︡{"stdout":"9393902384092834/29008098209348121127"}︡{"stdout":"\n"}︡
︠6a1bd9a1-96e2-43b9-903b-cb25fe29564d︠
%timeit a.rational_reconstruction()
︡7291325b-72a7-4218-9acf-659053bc522e︡{"stdout":"625 loops, best of 3: 55.4 µs per loop"}︡{"stdout":"\n"}︡
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







