︠85a53558-92bc-4da3-b400-cd6d811b4d32i︠
%md

# Lecture 12: Prime Numbers
(Monday: continued fractions; Wednesday: rational reconstruction)

**Reminder: turn on google+ hangout**

︡8ae0c405-373d-48a1-8ba7-750b3524c024︡{"html":"<h1>Lecture 12: Prime Numbers</h1>\n\n<p>(Monday: continued fractions; Wednesday: rational reconstruction)</p>\n\n<p><strong>Reminder: turn on google+ hangout</strong></p>\n"}︡
︠0b2ee2eb-85b3-40e1-8ed5-1dafbf61db6di︠
%hide
%html
<img src="http://www.claymath.org/images/primes_poster.jpg" style="width:100%">
︡2da4dabf-5ec1-45ff-9ca0-c79a47fed8e2︡{"html":"<img src=\"http://www.claymath.org/images/primes_poster.jpg\" style=\"width:100%\">"}︡
︠ee85db33-e64c-4a54-81b0-abd6d48562aai︠


%md
# Primality testing -- some theory

 - A **prime number** is an integer $\geq 2$ divisible only by itself and $1$.
 - Basic computational number theory problem: *decide whether or not a given number $n$ is a prime.*
 - One approach: use Fermat's Little Theorem, that if $a$ is coprime to $n$, then $a^{n-1}\equiv 1\pmod{n}$ (but not conversely).

︡e142fc51-bd3c-4b8c-9257-eb4ab186936f︡{"html":"<h1>Primality testing &#8211; some theory</h1>\n\n<ul>\n<li>A <strong>prime number</strong> is an integer $\\geq 2$ divisible only by itself and $1$.</li>\n<li>Basic computational number theory problem: <em>decide whether or not a given number $n$ is a prime.</em></li>\n<li>One approach: use Fermat&#8217;s Little Theorem, that if $a$ is coprime to $n$, then $a^{n-1}\\equiv 1\\pmod{n}$ (but not conversely).</li>\n</ul>\n"}︡
︠dbc8bf22-675f-454e-bda5-789402a7e474︠
n = 2013   # make up a number
Mod(2,n)^(n-1)   # if != 1, then number can't be prime!
︡25ff6a26-d1a4-4079-8005-c292d948f326︡{"stdout":"301"}︡{"stdout":"\n"}︡
︠6fb45c8d-09b4-4959-a224-bc1dc31c3b75︠
n = 2011   # make up a number
Mod(2,n)^(n-1)
︡019779a6-758c-4c32-b23d-70dc71e4ad2b︡{"stdout":"1"}︡{"stdout":"\n"}︡
︠72594263-8ebe-4c3a-8a43-b5cf516c378f︠
n = 92138409238409283409823094823487231092348092834098240398203498204380298409284309287409820498203840283427340723498234098209482098402840982304982084029735078729458739857398475938759837598734597395739875983751
Mod(2,n)^(n-1)
︡ae8a777e-dda4-4554-baa4-e7ec42bd6c02︡{"stdout":"19104676238632177074540820054395225807188765067750418765299920386734811855305975230447643586105824803741290995667853649911520958239618521515324990097863034782792178032718020769995056843008482872123529144012"}︡{"stdout":"\n"}︡
︠775884bf-0e66-432e-bcb6-3eb6138e0cfc︠
n = 561
Mod(7,n)^(n-1)
︡f46ee06b-af0a-4dcc-8fa3-9eac5d3ed2e0︡{"stdout":"1"}︡{"stdout":"\n"}︡
︠18080af0-cef4-4a55-a96a-d4553dc23e57︠
factor(561)
︡03b75259-55ae-4248-a320-1435861d8bd9︡{"stdout":"3 * 11 * 17"}︡{"stdout":"\n"}︡
︠a403056f-202b-47fc-84d8-1cccb50c87c2︠
b = 5 % 561
b
type(b)
b^560
︡c76c9e32-0633-4d72-b6c3-23d42f57ebc1︡{"stdout":"5"}︡{"stdout":"\n"}︡{"stdout":"<type 'sage.rings.integer.Integer'>"}︡{"stdout":"\n"}︡{"stdout":"26497349136889904540094297102338792048842007654486987513108141219242520439074860067791572114971742036578602619754846974776586165828097217415710548598866881389857257972830884460418602352641085186282930956611863545779123602346020430502561590994770393842463689179799325100849238120078569482437571071384615890476399106484347385593451533443878647794446899201015188651808784925378859043121337890625"}︡{"stdout":"\n"}︡
︠58db1bd0-b862-4d7d-905c-67893b11b067︠

︠a000b38b-4528-41ea-acc2-989a6f00d744︠
b = Mod(5, 561)
b
type(b)
b^560
parent(b)
︡667d4588-3a8e-47c1-b057-ce041824433c︡{"stdout":"5"}︡{"stdout":"\n"}︡{"stdout":"<type 'sage.rings.finite_rings.integer_mod.IntegerMod_int'>"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"Ring of integers modulo 561"}︡{"stdout":"\n"}︡
︠8b57a75f-c43f-4a48-b928-deb1dc9403e0︠
b.modulus()
︡2180cd20-a7b8-4579-aedf-dcd1d8c481de︡{"stdout":"561"}︡{"stdout":"\n"}︡
︠6570be9d-d4f0-49a8-be0e-38979cd1a7bf︠
%gp
Mod(593893,561)
︡7d4f42d1-9d64-4806-9e62-26a8840ee565︡{"stdout":"Mod(355, 561)"}︡{"stdout":"\n"}︡
︠0158f90f-fbad-4e35-a74d-762be41ae113︠
%magma

a := IntegerRing(561)!593893;
a;
Parent(a);
︡dea458ee-4d75-4df3-886d-6c8cbacbddb8︡{"stdout":"\n355\nResidue class ring of integers modulo 561"}︡{"stdout":"\n"}︡
︠d02194d9-63af-4b97-b9c7-af03f832e9f5︠
for i in [2..11]:
    print Mod(1,i)
︡168c9765-c3c5-4d77-b9ff-b9bbc1dcca4d︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡
︠9c0709c3-004d-41c5-8da4-b5bd1ef44f75︠
a = Mod(3,5);
︡4cf4445c-e1ec-4e1d-a89d-a615fcb67947︡
︠2722039c-9119-4536-a1f1-92af007479c5︠
Mod(1, 4) == 5
︡994e967c-3d5c-4efe-a396-82f93412b189︡{"stdout":"True"}︡{"stdout":"\n"}︡
︠859d9da1-57b6-4cf1-b60d-513114f1a200︠
R.<x> = ZZ['x']
f = 1/2 + x; f
︡4580950b-7083-4e18-ba20-f4f743b84ae5︡{"stdout":"x + 1/2"}︡{"stdout":"\n"}︡
︠176f5abf-9d09-4f86-9503-a6d159681c6c︠
parent(f)
︡3b4323ff-a13b-41f1-b495-a0902654d4f2︡{"stdout":"Univariate Polynomial Ring in x over Rational Field"}︡{"stdout":"\n"}︡
︠91f25f11-3f71-48b5-8e3e-4fb7a4e1bfc3︠
magma_free("""
R<x> := PolynomialRing(IntegerRing());
f := 1/2 + x;
f;
""")
︡ea46acbc-e772-4af3-8e19-e19bf42deb34︡{"stdout":">> f := 1/2 + x;\n            ^\nRuntime error: Bad argument types\nArgument types given: FldRatElt, RngUPolElt[RngInt]\n>> f;\n   ^\nUser error: Identifier 'f' has not been declared or assigned"}︡{"stdout":"\n"}︡
︠0170996e-cd4a-4c3a-aff1-7fa17c40b7ca︠
%magma
R<x> := PolynomialRing(IntegerRing());
f := 1/2 + x;
f;
︡00c30e6d-e608-478b-8cc2-874ee3590abe︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 409, in execute\n"}︡{"stderr":"    block = parsing.preparse_code(block)\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 438, in execute_with_code_decorators\n"}︡{"stderr":"    \n"}︡{"stderr":"  File \"/home/wstein/sage/sage-5.9.rc0/local/lib/python2.7/site-packages/sage/interfaces/magma.py\", line 539, in eval\n"}︡{"stderr":"    raise RuntimeError, \"Error evaluating Magma code.\\nIN:%s\\nOUT:%s\"%(x, ans)\n"}︡{"stderr":"RuntimeError: Error evaluating Magma code.\nIN:R<x> := PolynomialRing(IntegerRing());\nf := 1/2 + x;    \nf;\nOUT:\n\n>> f := 1/2 + x;    \n            ^\nRuntime error in '+': Bad argument types\nArgument types given: FldRatElt, RngUPolElt[RngInt]\n\nx + 1/2\n"}︡
︠ea0c4e76-b9e8-4305-8d65-7359fc8a3c3c︠
# Pseudo-primes: sometimes this test is misleading
# no matter what $a$ you try (see "Carmichael number"):
n = 561
v = []
for a in [2..560]:
    if gcd(a,n)==1:
        if Mod(a,n)^(n-1) == 1:
            v.append(a)
        else:
            print "not prime! a=%s"%a
v
︡65d978bb-31b1-45ee-b115-c64b991d34ff︡{"stdout":"[2, 4, 5, 7, 8, 10, 13, 14, 16, 19, 20, 23, 25, 26, 28, 29, 31, 32, 35, 37, 38, 40, 41, 43, 46, 47, 49, 50, 52, 53, 56, 58, 59, 61, 62, 64, 65, 67, 70, 71, 73, 74, 76, 79, 80, 82, 83, 86, 89, 91, 92, 94, 95, 97, 98, 100, 101, 103, 104, 106, 107, 109, 112, 113, 115, 116, 118, 122, 124, 125, 127, 128, 130, 131, 133, 134, 137, 139, 140, 142, 145, 146, 148, 149, 151, 152, 155, 157, 158, 160, 161, 163, 164, 166, 167, 169, 172, 173, 175, 178, 179, 181, 182, 184, 185, 188, 190, 191, 193, 194, 196, 197, 199, 200, 202, 203, 205, 206, 208, 211, 212, 214, 215, 217, 218, 223, 224, 226, 227, 229, 230, 232, 233, 235, 236, 239, 241, 244, 245, 247, 248, 250, 251, 254, 256, 257, 259, 260, 262, 263, 265, 266, 268, 269, 271, 274, 277, 278, 280, 281, 283, 284, 287, 290, 292, 293, 295, 296, 298, 299, 301, 302, 304, 305, 307, 310, 311, 313, 314, 316, 317, 320, 322, 325, 326, 328, 329, 331, 332, 334, 335, 337, 338, 343, 344, 346, 347, 349, 350, 353, 355, 356, 358, 359, 361, 362, 364, 365, 367, 368, 370, 371, 373, 376, 377, 379, 380, 382, 383, 386, 388, 389, 392, 394, 395, 397, 398, 400, 401, 403, 404, 406, 409, 410, 412, 413, 415, 416, 419, 421, 422, 424, 427, 428, 430, 431, 433, 434, 436, 437, 439, 443, 445, 446, 448, 449, 452, 454, 455, 457, 458, 460, 461, 463, 464, 466, 467, 469, 470, 472, 475, 478, 479, 481, 482, 485, 487, 488, 490, 491, 494, 496, 497, 499, 500, 502, 503, 505, 508, 509, 511, 512, 514, 515, 518, 520, 521, 523, 524, 526, 529, 530, 532, 533, 535, 536, 538, 541, 542, 545, 547, 548, 551, 553, 554, 556, 557, 559, 560]"}︡{"stdout":"\n"}︡
︠ac7800a4-5d7a-4ed4-a5d8-3d2c25bbd1dai︠
%md

## Miller-Rabin

  - The [Miller-Rabin test](http://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test) is a little more complicated.

  - Each time you run it and it says "$n$ is prime", then the probability that $n$ is actually prime increases (a lot).

  - I've included (hidden) code in this worksheet from [http://www.uam.es/personal_pdi/ciencias/fchamizo/asignaturas/cripto1011/crypto1011.html](http://www.uam.es/personal_pdi/ciencias/fchamizo/asignaturas/cripto1011/crypto1011.html) for Miller-Rabin.

  - Philosophical discussion: there is some nonzero probability that a cosmic ray will change your RAM in a way that is not detected.  Running Miller-Rabin a bunch of times results is a smaller probability than that.

︡72a817c7-cd2f-48aa-be33-9c627deb529d︡{"html":"<h2>Miller-Rabin</h2>\n\n<ul>\n<li><p>The <a href=\"http://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test\">Miller-Rabin test</a> is a little more complicated.  </p></li>\n<li><p>Each time you run it and it says &#8220;$n$ is prime&#8221;, then the probability that $n$ is actually prime increases (a lot).</p></li>\n<li><p>I&#8217;ve included (hidden) code in this worksheet from <a href=\"http://www.uam.es/personal_pdi/ciencias/fchamizo/asignaturas/cripto1011/crypto1011.html\">http://www.uam.es/personal_pdi/ciencias/fchamizo/asignaturas/cripto1011/crypto1011.html</a> for Miller-Rabin.</p></li>\n<li><p>Philosophical discussion: there is some nonzero probability that a cosmic ray will change your RAM in a way that is not detected.  Running Miller-Rabin a bunch of times results is a smaller probability than that.</p></li>\n</ul>\n"}︡
︠e1596049-46ec-41d9-8582-5b53244981c0ai︠
%hide
%auto

print "double click to see Miller-Rabin code"

#
# Miller-Rabin
#

def q_and_k(n):
     q = n-1
     k = 0
     while Mod(q,2)==0:
         k += 1
         q = q/2
     return q,k

def strong_pseud(n,a):
    (q,k) = q_and_k(n)
    b = Mod(a,n)^q
    if b==1:
        return True

    for i in range(k):
        if b==-1:
            return True
        b = Mod(b,n)^2
    return False

def miller_rabin(n,secur):
    for p in primes_first_n(secur):
        # Small primes
        if Mod(n,p)==0:
            if n==p:
                return 'Prime'
            return 'Composite'
        # Check strong pseudoprimes
        if strong_pseud(n,p)==False:
            return 'Composite'
    return 'likely prime'

def miller_rabin2(n,secur):
    a = 0
    for i in range(secur):
        a = 2+ZZ.random_element( n-3 )
        if Mod(n,a)==0:
            return 'Composite'
        if strong_pseud(n,a)==False:
            return 'Composite'
    return 'likely prime'

︡b9dc01c6-781d-4f04-9fc7-94bdec55d185︡{"auto":true}︡{"stdout":"double click to see Miller-Rabin code"}︡{"stdout":"\n"}︡
︠5413c9da-2ec9-49d6-a1b8-978819fa382a︠
miller_rabin(561,10)
︡1c931cab-0e96-4441-94bc-ea145950230e︡{"stdout":"'Composite'"}︡{"stdout":"\n"}︡
︠767628d9-fa0f-4e25-8e12-2dc626dbfdba︠
miller_rabin(next_probable_prime(10^20),10)
︡68b304cb-5b3c-4c10-b6e0-ec828c0c85b0︡{"stdout":"'likely prime'"}︡{"stdout":"\n"}︡
︠a30f6b1d-2d12-4cf5-80b3-efd8778a8daa︠
p = next_probable_prime(10^20); p
is_prime(p)
︡77fca151-de3a-4e62-800c-2a493fc3f461︡{"stdout":"100000000000000000039"}︡{"stdout":"\n"}︡{"stdout":"True"}︡{"stdout":"\n"}︡
︠65080627-eb87-4e9d-ad7a-ee7a6e8ec63ai︠
%md

# Primality testing in Sage

 - Sage (because of Pari) has a very, very fast function to decide if a number is highly likely to be prime. When I last checked this seemed to be "overall" the best implementation available anywhere.

 - Sage can also efficiently *provably* decide primality.  (When I last checked) this does not use the "primes is in P" theorem at all, but instead uses an non-deterministic elliptic-curve based primality algorithm (ECPP), and other algorithms.

︡55b3acfe-2b29-4cca-964a-e6ae6ee18a4a︡{"html":"<h1>Primality testing in Sage</h1>\n\n<ul>\n<li><p>Sage (because of Pari) has a very, very fast function to decide if a number is highly likely to be prime. When I last checked this seemed to be &#8220;overall&#8221; the best implementation available anywhere.</p></li>\n<li><p>Sage can also efficiently <em>provably</em> decide primality.  (When I last checked) this does not use the &#8220;primes is in P&#8221; theorem at all, but instead uses an non-deterministic elliptic-curve based primality algorithm (ECPP), and other algorithms.</p></li>\n</ul>\n"}︡
︠679d0632-340d-4441-a7cd-c680d03abab9︠
# This tests primality of numbers after $10^{250}$ until it finds one
# that is very likely to be prime.  Being able to find large primes
# like this quickly is useful in public-key cryptogrpahy.
%time p = next_probable_prime(randint(10^249,10^250))
p
︡5fc71f61-7c75-4ea0-ad81-761c275a3311︡{"stdout":"CPU time: 0.34 s, Wall time: 0.34 s"}︡{"stdout":"\n"}︡{"stdout":"3254025717381609046332312900301878963276007880154842626578717977476195646906825098317779920942931567725541225212160145359044675343201502008673037688150799008394140415294520042838115809362224792382986581588515128477512839168733839398323730195591152371"}︡{"stdout":"\n"}︡
︠9dabf2de-0c5a-41b1-be70-206bcfa07198︠

︠10cbe468-b481-45b9-bd38-4ce1be96b5a5︠
# This proves that the $p$ we found above is in fact prime.
%time p.is_prime()
︡94f55353-538c-4296-a11c-f08bf61db5e1︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 2.30 s, Wall time: 2.27 s"}︡{"stdout":"\n"}︡
︠372b097d-5e01-445f-915c-91adf4ce43c5︠
# A random 500-digit number is not likely to be prime
n = randint(0,10^500); n
%time is_pseudoprime(n)
︡19bf9419-1e37-4cb9-b7ba-1e4c2291009c︡{"stdout":"29421252272098370347236652114441058253706464209766339780349618610391561736846772678887237652300736209641875135255076385462639153378890815008861436859186812277424554749570234989914955935991857882065667516728512792149588941453300927514964504774786632144919982057179290830728470152651849157293448909105997795032178222015500924757503001899614186472127742198083064145026257348234898190580112937964382456228137059724636668347038606115304023031675554186528098155446285720643432134792425767470749607360201270L"}︡{"stdout":"\n"}︡{"stdout":"False"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s"}︡{"stdout":"\n"}︡
︠6755e29c-8c81-4335-ad31-a17955982a61︠
k = next_probable_prime(n);
n - k
︡5ad2bf79-d700-4a44-8028-ee551099e57e︡{"stdout":"-197"}︡{"stdout":"\n"}︡
︠2e9ddb02-9a25-4ca6-9dc9-fce0731eabba︠
# But we can *find* a 500 digit (probable) prime with Sage
%time p = next_probable_prime(n); p
︡fd698261-c785-4acf-b551-980070ad231d︡{"stdout":"29421252272098370347236652114441058253706464209766339780349618610391561736846772678887237652300736209641875135255076385462639153378890815008861436859186812277424554749570234989914955935991857882065667516728512792149588941453300927514964504774786632144919982057179290830728470152651849157293448909105997795032178222015500924757503001899614186472127742198083064145026257348234898190580112937964382456228137059724636668347038606115304023031675554186528098155446285720643432134792425767470749607360201467"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.11 s, Wall time: 0.11 s"}︡{"stdout":"\n"}︡
︠24195419-47ba-4a6d-9921-8c2d993ac700︠
%time Mod(2,p)^(p-1)   # this test usually works
︡60b33c37-6c75-4531-bee7-33146fbc80f3︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s"}︡{"stdout":"\n"}︡
︠47e4e3cc-2169-4a8e-8750-2b7ea18fdc41i︠



%md
# Prime Enumeration

 - PARI (hence Sage) is pretty good at making a list of *all* primes up to some bound.

 - Sage also has reasonably fast code written from scratch by Andrew Ohana for *counting* the numbers of primes up to $X$.  See [trac #11475](http://trac.sagemath.org/sage_trac/ticket/11475) for an update that is nearly 10 times faster, which **needs review**!




︡4f9c50a8-7b56-4ecc-b2d0-f5a2ecb3cacb︡{"html":"<h1>Prime Enumeration</h1>\n\n<ul>\n<li><p>PARI (hence Sage) is pretty good at making a list of <em>all</em> primes up to some bound.</p></li>\n<li><p>Sage also has reasonably fast code written from scratch by Andrew Ohana for <em>counting</em> the numbers of primes up to $X$.  See <a href=\"http://trac.sagemath.org/sage_trac/ticket/11475\">trac #11475</a> for an update that is nearly 10 times faster, which <strong>needs review</strong>!</p></li>\n</ul>\n"}︡
︠f1305b0e-c1ee-4e16-a872-06d43896bef9︠
# Enumerate some primes:
prime_range(100)
︡fe10ab86-cf06-4ccd-86d7-87e8dc39d8db︡{"stdout":"[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]"}︡{"stdout":"\n"}︡
︠607dd28e-1b77-447f-8d43-4ff945755c3fo︠
prime_range(10^15,10^15+100)
︡bb8d4fdd-6b80-433d-a05c-90d8fa01bd16︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 409, in execute\n"}︡{"stderr":"    block = parsing.preparse_code(block)\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"fast_arith.pyx\", line 56, in sage.rings.fast_arith.prime_range (sage/rings/fast_arith.c:4193)\n"}︡{"stderr":"  File \"fast_arith.pyx\", line 141, in sage.rings.fast_arith.prime_range (sage/rings/fast_arith.c:3828)\n"}︡{"stderr":"  File \"gen.pyx\", line 9882, in sage.libs.pari.gen.PariInstance.init_primes (sage/libs/pari/gen.c:51461)\n"}︡{"stderr":"KeyboardInterrupt\n"}︡
︠49d3b247-87f9-4c12-bb06-732238f6fa3c︠
list(primes(10^15,10^15+100))

︡5ee1c08c-3536-4659-a826-d9bfd3d2d91d︡{"stdout":"[1000000000000037, 1000000000000091]"}︡{"stdout":"\n"}︡
︠eb79cdfd-9510-418a-9526-f95a87a3b0b2︠
%timeit list(primes(100))
︡bd99b01b-00cc-47a8-963b-6040f061e641︡{"stdout":"625 loops, best of 3: 80.5 µs per loop"}︡{"stdout":"\n"}︡
︠aed7cda9-5d99-494a-b88f-35e76f90e15e︠
%timeit prime_range(100)
︡3b0277cc-8d69-4611-9bf6-469bd1fb6377︡{"stdout":"625 loops, best of 3: 1.15 µs per loop"}︡{"stdout":"\n"}︡
︠a741d973-8def-4e40-bfcf-d6b2da82bf14︠
primes(100)
︡9a23f781-bfa8-4b92-b70d-8bf1dc4c249c︡{"stdout":"<generator object primes at 0x79ebe60>"}︡{"stdout":"\n"}︡
︠d9ec3114-5abd-4d7d-be00-39dcc03ceb1c︠
for p in primes(100):
    print p,
︡2c4148de-fe6b-4965-8ca4-f70d067a9f00︡{"stdout":"2"}︡{"stdout":" "}︡{"stdout":"3"}︡{"stdout":" "}︡{"stdout":"5"}︡{"stdout":" "}︡{"stdout":"7"}︡{"stdout":" "}︡{"stdout":"11"}︡{"stdout":" "}︡{"stdout":"13"}︡{"stdout":" "}︡{"stdout":"17"}︡{"stdout":" "}︡{"stdout":"19"}︡{"stdout":" "}︡{"stdout":"23"}︡{"stdout":" "}︡{"stdout":"29"}︡{"stdout":" "}︡{"stdout":"31"}︡{"stdout":" "}︡{"stdout":"37"}︡{"stdout":" "}︡{"stdout":"41"}︡{"stdout":" "}︡{"stdout":"43"}︡{"stdout":" "}︡{"stdout":"47"}︡{"stdout":" "}︡{"stdout":"53"}︡{"stdout":" "}︡{"stdout":"59"}︡{"stdout":" "}︡{"stdout":"61"}︡{"stdout":" "}︡{"stdout":"67"}︡{"stdout":" "}︡{"stdout":"71"}︡{"stdout":" "}︡{"stdout":"73"}︡{"stdout":" "}︡{"stdout":"79"}︡{"stdout":" "}︡{"stdout":"83"}︡{"stdout":" "}︡{"stdout":"89"}︡{"stdout":" "}︡{"stdout":"97"}︡
︠275f80ac-0e2f-4707-8912-121a8e2e74d1︠
prime_range(1000,1100)
︡cddee912-df14-4bd1-bd5c-ca32ce25bf6b︡{"stdout":"[1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, 1087, 1091, 1093, 1097]"}︡{"stdout":"\n"}︡
︠108bbe2e-ed95-4f5e-b44a-775724473522︠
%timeit v = list(primes(10000))   # watch out -- primes is SLOW (due to algorithm)
%timeit v = prime_range(10000)
︡3410c66a-dd49-45b1-80dd-a8ba904558e3︡{"stdout":"25 loops, best of 3: 8.59 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 250 µs per loop"}︡{"stdout":"\n"}︡
︠c80cea6f-d7a2-4f5b-8238-24b41fa33d99︠
# Count some primes
prime_pi(10000)
︡6581257b-d435-4c68-9132-879c72173c56︡{"stdout":"1229"}︡{"stdout":"\n"}︡
︠61031f50-6a69-4a69-8d17-2c65acffa5a4︠
len(prime_range(10000))
︡a4fc18b8-356b-48eb-89b1-73f2a1ddf1ab︡{"stdout":"1229"}︡{"stdout":"\n"}︡
︠a30f4973-3a6c-4313-9dd4-5e8a2f254fe9︠
for k in [2..11]:
    t = walltime()
    print "%-20s%-20s%-20s"%('10^%s'%k, prime_pi(10^k), walltime(t))
︡e8b55be8-0d39-4526-9211-1615c3918ecc︡{"stdout":"10^2                25                  6.103515625e-05     "}︡{"stdout":"\n"}︡{"stdout":"10^3                168                 4.50611114502e-05   "}︡{"stdout":"\n"}︡{"stdout":"10^4                1229                4.60147857666e-05   "}︡{"stdout":"\n"}︡{"stdout":"10^5                9592                7.79628753662e-05   "}︡{"stdout":"\n"}︡{"stdout":"10^6                78498               0.000261068344116   "}︡{"stdout":"\n"}︡{"stdout":"10^7                664579              0.00130105018616    "}︡{"stdout":"\n"}︡{"stdout":"10^8                5761455             0.00745296478271    "}︡{"stdout":"\n"}︡{"stdout":"10^9                50847534            0.0313189029694     "}︡{"stdout":"\n"}︡{"stdout":"10^10               455052511           0.227545022964      "}︡{"stdout":"\n"}︡{"stdout":"10^11               4118054813          1.62120199203       "}︡{"stdout":"\n"}︡
︠d8ede194-1185-479e-9c29-8b1018692beb︠
plot(prime_pi, 2,50)
︡340bee77-29ce-4d94-876a-99c4e25f8903︡{"file":{"show":true,"uuid":"f692bdeb-8f36-4e6c-b41c-288b73f8c021","filename":"/home/wstein/.sage/temp/localhost/23428/tmp_MKC3jl.svg"}}︡{"stdout":"\n"}︡
︠cf8e8955-dbc6-4bff-b212-ab05d8364e57︠
plot(prime_pi, 2,10000)
︡9fd12dc1-0152-4dfa-b167-f61988d5c98a︡{"file":{"show":true,"uuid":"4ba0e838-2d17-4f6a-b9fb-830440c44aa7","filename":"/home/wstein/.sage/temp/localhost/23428/tmp_ADQqnV.svg"}}︡{"stdout":"\n"}︡
︠8d29cb66-bb79-4485-b4ce-d3c0d64007cei︠
%md

Let $\pi(x) = \\#\\{p : p\leq x \text{ is prime }\\}$ and
${\rm Li}(x) = \int_{2}^x \frac{dt}{\log(t)}$.

**Conjecture (The Riemann Hypothesis)**: *We have $|\pi(x) - {\rm Li}(x)|\leq \sqrt{x}\cdot \log(x)$.*

Note: There is a [one million dollar cash prize](http://www.claymath.org/millennium/Riemann_Hypothesis/) for proving this conjecture.
︡e711de99-7254-44de-adf2-dc651631d2db︡{"html":"<p>Let $\\pi(x) = \\#\\{p : p\\leq x \\text{ is prime }\\}$ and\n${\\rm Li}(x) = \\int_{2}^x \\frac{dt}{\\log(t)}$.</p>\n\n<p><strong>Conjecture (The Riemann Hypothesis)</strong>: <em>We have $|\\pi(x) - {\\rm Li}(x)|\\leq \\sqrt{x}\\cdot \\log(x)$.</em></p>\n\n<p>Note: There is a <a href=\"http://www.claymath.org/millennium/Riemann_Hypothesis/\">one million dollar cash prize</a> for proving this conjecture.</p>\n"}︡
︠8e4d98fe-4ffb-49da-99ec-2ec9cb228bb6︠
plot(prime_pi, 2,10000) + plot(Li, 2, 10000, color='red')
︡a0ecd368-601c-492b-bdbc-d66a650b817e︡{"file":{"show":true,"uuid":"c2da3ef6-9f54-4bc5-b4b4-bc2a3266029e","filename":"/home/wstein/.sage/temp/localhost/23428/tmp_Dqb2V9.svg"}}︡{"stdout":"\n"}︡
︠5fc3056c-0746-4ab9-b6da-650c8bbf1d9d︠
for k in [2..11]:
    z = int(N(Li(10^k))); pr = prime_pi(10^k)
    print "10^%s\t\t%-15s%-15s%-15s"%(k, pr, z, pr-z)
︡e8f83a80-2973-4c98-b52c-7ef3c1c472a7︡{"stdout":"10^2\t\t25             29             -4             "}︡{"stdout":"\n"}︡{"stdout":"10^3\t\t168            176            -8             "}︡{"stdout":"\n"}︡{"stdout":"10^4\t\t1229           1245           -16            "}︡{"stdout":"\n"}︡{"stdout":"10^5\t\t9592           9628           -36            "}︡{"stdout":"\n"}︡{"stdout":"10^6\t\t78498          78626          -128           "}︡{"stdout":"\n"}︡{"stdout":"10^7\t\t664579         664917         -338           "}︡{"stdout":"\n"}︡{"stdout":"10^8\t\t5761455        5762208        -753           "}︡{"stdout":"\n"}︡{"stdout":"10^9\t\t50847534       50849233       -1699          "}︡{"stdout":"\n"}︡{"stdout":"10^10\t\t455052511      455055613      -3102          "}︡{"stdout":"\n"}︡{"stdout":"10^11\t\t4118054813     4118066399     -11586         "}︡{"stdout":"\n"}︡
︠605a64fa-c03e-41c0-9db4-89a2e49f0fa3i︠
%hide
%md
For more about the Riemann Hypothesis, read [PRIMES](http://wstein.org/rh/).
︡03d70ce3-a67f-4853-9ec1-98867be1765f︡{"html":"<p>For more about the Riemann Hypothesis, read <a href=\"http://wstein.org/rh/\">PRIMES</a>.</p>\n"}︡
︠2e1ec632-490c-4848-9844-fe5d596b8dd7︠




