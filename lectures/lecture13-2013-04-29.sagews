︠85a53558-92bc-4da3-b400-cd6d811b4d32i︠
%hide
%md

# Lecture 13: Continued Fractions
(Wednesday: rational reconstruction)

**Reminder: turn on google+ hangout**

︡b1963dad-9584-4574-9a70-fdeb2a57afeb︡{"html":"<h1>Lecture 13: Continued Fractions</h1>\n\n<p>(Wednesday: rational reconstruction)</p>\n\n<p><strong>Reminder: turn on google+ hangout</strong></p>\n"}︡
︠0fbc22cd-bf43-4165-8263-bf7780f99d9di︠
%md

## The Definition

A **continued fraction** is an expression of the form
$$ a_0 + \frac{1}{\displaystyle a_1+\frac{1}{\displaystyle a_2+\frac{1}{\displaystyle a_3+\cdots}}}$$

For us today we will require the $a_i$ to all be integers, though people do consider more general continued fractions.

We denote the above continued fraction by $[a_0, a_1, a_2, a_3, \ldots]$.

︡164a4ccc-683c-4d8b-994c-90b707cfc659︡{"html":"<h2>The Definition</h2>\n\n<p>A <strong>continued fraction</strong> is an expression of the form\n$$ a_0 + \\frac{1}{\\displaystyle a_1+\\frac{1}{\\displaystyle a_2+\\frac{1}{\\displaystyle a_3+\\cdots}}}$$</p>\n\n<p>For us today we will require the $a_i$ to all be integers, though people do consider more general continued fractions.</p>\n\n<p>We denote the above continued fraction by $[a_0, a_1, a_2, a_3, \\ldots]$.</p>\n"}︡
︠0ccfe49b-8369-4e71-beaf-8058956ceef1i︠






%md
### Why Bother?
$$ a_0 + \frac{1}{\displaystyle a_1+\frac{1}{\displaystyle a_2+\frac{1}{\displaystyle a_3+\cdots}}}$$

 1. Every real number has a (nearly unique) continued fraction representation -- so this is a different way of thinking about real numbers than the usual decimal expansions, which yields surprises.

 2. Continued fractions provide a way to find the provably best possible rational number approximations to a real number.

 3. Continued fractions are an easy-to-understand special case of other much more sophisticated number theory algorithms.

 4. (Mainly for grad students) Continued fractions provide an algorithm to write any element of the special linear group ${\rm SL}_2(\mathbb{Z})$ in terms of its generators $S$ and $T$.  This is critical to algorithms for computing with *modular forms*.
︡c23233c6-4eac-48b8-ae99-5a31d1a494dc︡{"html":"<h3>Why Bother?</h3>\n\n<p>$$ a_0 + \\frac{1}{\\displaystyle a_1+\\frac{1}{\\displaystyle a_2+\\frac{1}{\\displaystyle a_3+\\cdots}}}$$</p>\n\n<ol>\n<li><p>Every real number has a (nearly unique) continued fraction representation &#8211; so this is a different way of thinking about real numbers than the usual decimal expansions, which yields surprises.</p></li>\n<li><p>Continued fractions provide a way to find the provably best possible rational number approximations to a real number.</p></li>\n<li><p>Continued fractions are an easy-to-understand special case of other much more sophisticated number theory algorithms.</p></li>\n<li><p>(Mainly for grad students) Continued fractions provide an algorithm to write any element of the special linear group ${\\rm SL}_2(\\mathbb{Z})$ in terms of its generators $S$ and $T$.  This is critical to algorithms for computing with <em>modular forms</em>.</p></li>\n</ol>\n"}︡
︠cb3fbac1-5ad4-46c4-9c2e-b07343d181a8i︠
%md
### 1. Every real number has a continued fraction

#### Continued Fraction Algorithm: apply to $x\in\mathbb{R}$:

- Set $i=0$.
- Let $a_i = \lfloor x \rfloor$ be the floor of $x$.
- Replace $x$ by $1/(x-a_i)$, increment $i$, and go to the previous step.

**Theorem** The above procedure outputs a sequence of integers $a_0, a_1, a_2, \ldots$ such that $x = [a_0, a_1, a_2, \ldots]$.

Let's do this in Sage for a few numbers... to *some precision*:

︡614b5538-5ff2-4153-905f-75147505b406︡{"html":"<h3>1. Every real number has a continued fraction</h3>\n\n<h4>Continued Fraction Algorithm: apply to $x\\in\\mathbb{R}$:</h4>\n\n<ul>\n<li>Set $i=0$.</li>\n<li>Let $a_i = \\lfloor x \\rfloor$ be the floor of $x$.</li>\n<li>Replace $x$ by $1/(x-a_i)$, increment $i$, and go to the previous step.</li>\n</ul>\n\n<p><strong>Theorem</strong> The above procedure outputs a sequence of integers $a_0, a_1, a_2, \\ldots$ such that $x = [a_0, a_1, a_2, \\ldots]$.</p>\n\n<p>Let&#8217;s do this in Sage for a few numbers&#8230; to <em>some precision</em>:</p>\n"}︡
︠7a552f83-424a-4fa2-91d1-9e56a39b51f2︠
continued_fraction(2013)
︡0f75148e-b2cc-438d-ab37-3b312758902a︡{"stdout":"[2013]"}︡{"stdout":"\n"}︡
︠aa5b2c02-61a8-44a8-883a-120b999829a6︠
continued_fraction(1/7)
︡66dd0873-ffbc-4e00-be44-7761d9efd5cd︡{"stdout":"[0, 7]"}︡{"stdout":"\n"}︡
︠69ad3cbf-a58f-4976-ae8d-2be02d677264︠
continued_fraction(1.2345)
︡fe2d282f-eab3-4ae9-acb8-03e638eeaa2a︡{"stdout":"[1, 4, 3, 1, 3, 1, 1, 2, 4, 1]"}︡{"stdout":"\n"}︡
︠176566ff-a468-43d5-bc85-e7695efd58ef︠
continued_fraction(sqrt(2))   # note -- in fact, this repeats forever
︡3b496dfd-6f3d-42a5-b52e-ef3843e59a9a︡{"stdout":"[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]"}︡{"stdout":"\n"}︡
︠4cd11b37-5c20-462f-9c44-8dee0d82310f︠
continued_fraction(e)  # Wow!  There *is* a pattern!  (see my book for a proof)
︡02214660-8f27-4661-bfc3-7a70b340172f︡{"stdout":"[2, 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10, 1, 1, 12, 1, 1]"}︡{"stdout":"\n"}︡
︠e8e9add3-fd07-4104-a96f-fade429f8446︠
continued_fraction(pi)  # Total mystery!
︡261f4cdb-a8b5-4fa0-a61b-95979f41ae07︡{"stdout":"[3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14]"}︡{"stdout":"\n"}︡
︠c302d81c-3b74-4829-bc2a-fb6ed643dd4b︠
%md
### An open problem

**Definition** An *algebraic number* is any root of a polynomial with rational coefficients.



**Open Problem**  There is no example of an algebraic number of degree greater than $2$ for which the boundedness or not of the entries of the continued fraction has been determined.
︡567a68da-4934-4960-95ec-d259d586a592︡{"html":"<h3>An open problem</h3>\n\n<p><strong>Definition</strong> An <em>algebraic number</em> is any root of a polynomial with rational coefficients.</p>\n\n<p><strong>Open Problem</strong>  There is no example of an algebraic number of degree greater than $2$ for which the boundedness or not of the entries of the continued fraction has been determined.</p>\n"}︡
︠86366c1a-6d70-4f4a-b226-b85b1bf281a1︠
%time continued_fraction(2^(1/3), nterms=200)
︡cc0f3a75-2a44-4595-a29b-88d677813f24︡{"stdout":"[1, 3, 1, 5, 1, 1, 4, 1, 1, 8, 1, 14, 1, 10, 2, 1, 4, 12, 2, 3, 2, 1, 3, 4, 1, 1, 2, 14, 3, 12, 1, 15, 3, 1, 4, 534, 1, 1, 5, 1, 1, 121, 1, 2, 2, 4, 10, 3, 2, 2, 41, 1, 1, 1, 3, 7, 2, 2, 9, 4, 1, 3, 7, 6, 1, 1, 2, 2, 9, 3, 1, 1, 69, 4, 4, 5, 12, 1, 1, 5, 15, 1, 4, 1, 1, 1, 1, 1, 89, 1, 22, 186, 6, 2, 3, 1, 3, 2, 1, 1, 5, 1, 3, 1, 8, 9, 1, 26, 1, 7, 1, 18, 6, 1, 372, 3, 13, 1, 1, 14, 2, 2, 2, 1, 1, 4, 3, 2, 2, 1, 1, 9, 1, 6, 1, 38, 1, 2, 25, 1, 4, 2, 44, 1, 22, 2, 12, 11, 1, 1, 49, 2, 6, 8, 2, 3, 2, 1, 3, 5, 1, 1, 1, 3, 1, 2, 1, 2, 4, 1, 1, 3, 2, 1, 9, 4, 1, 4, 1, 2, 1, 27, 1, 1, 5, 5, 1, 3, 2, 1, 2, 2, 3, 1, 4, 2, 2, 8, 4, 1]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s"}︡{"stdout":"\n"}︡
︠ba0c59cf-c280-4a35-bdd1-2bd6a7bcb007i︠
%md

### 2. Best rational approximation to a real number

 - The convergents two a continued fraction $[a_0, a_1, \ldots]$ are the rational numbers you get by simply truncating and evaluating.

 - These provide the "best possible" rational approximations to a real number.
︡ca05f6f6-dc1d-4a16-837c-d9f8568233dc︡{"html":"<h3>2. Best rational approximation to a real number</h3>\n\n<ul>\n<li><p>The convergents two a continued fraction $[a_0, a_1, \\ldots]$ are the rational numbers you get by simply truncating and evaluating.</p></li>\n<li><p>These provide the &#8220;best possible&#8221; rational approximations to a real number.</p></li>\n</ul>\n"}︡
︠8a5d4019-7f99-45fb-bbc5-1f762140ffe8︠
v = continued_fraction(pi); v
︡57089bed-d1e4-438f-9421-a243146e0d9d︡{"stdout":"[3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14]"}︡{"stdout":"\n"}︡
︠26443ddd-7ec4-4fc3-a008-395a5cb3d22b︠
v.convergents()
︡f36b9e2a-d985-4afb-a971-4b45b1bec5cf︡{"stdout":"[3, 22/7, 333/106, 355/113, 103993/33102, 104348/33215, 208341/66317, 312689/99532, 833719/265381, 1146408/364913, 4272943/1360120, 5419351/1725033, 80143857/25510582]"}︡{"stdout":"\n"}︡
︠fc3ac37c-f91b-44d1-9813-9e2a4c27c76c︠
3 + 1/7
︡5abfda1a-872d-419b-9b7f-f6080fd866d0︡{"stdout":"22/7"}︡{"stdout":"\n"}︡
︠afc402da-bdd4-40b0-ac48-374e79442afe︠
3 + 1/(7+1/15)
︡36fe487a-d6b6-43d1-8cc2-995c82bf7ab0︡{"stdout":"333/106"}︡{"stdout":"\n"}︡
︠08259999-2b48-4c28-8283-b53694ef55a5︠
N(333/106, digits=20)
N(pi, digits=20)
︡d92cb60f-091f-4ede-9810-17be85dcace8︡{"stdout":"3.1415094339622641509"}︡{"stdout":"\n"}︡{"stdout":"3.1415926535897932385"}︡{"stdout":"\n"}︡
︠5fda00e2-85f6-4816-871a-69816eeb2ff5︠
N(80143857/25510582, digits=20)
N(pi, digits=20)
︡1e18ee7a-482f-48fc-ad49-f5421060ed53︡{"stdout":"3.1415926535897926594"}︡{"stdout":"\n"}︡{"stdout":"3.1415926535897932385"}︡{"stdout":"\n"}︡
︠d7a197e0-4db1-4925-b6ee-390f91f6fe10i︠
%md
### This is a useful algorithmic building block.

- Suppose you have a way to compute a number $\alpha$ you know is rational, but your what you do  uses floating point numbers.

- Compute an approximation $\tilde{\alpha}$ to $\alpha$, then compute the continued fraction of $\tilde{\alpha}$, and look at the convergents.  The one before a big $a_i$ is likely to be $\alpha$.


- I used this sort of idea in a paper with Darmon et al. on Stark-Heegner points recently.

︡28280ac5-7d3d-49ad-87ef-82c19da635f3︡{"html":"<h3>This is a useful algorithmic building block.</h3>\n\n<ul>\n<li><p>Suppose you have a way to compute a number $\\alpha$ you know is rational, but your what you do  uses floating point numbers.</p></li>\n<li><p>Compute an approximation $\\tilde{\\alpha}$ to $\\alpha$, then compute the continued fraction of $\\tilde{\\alpha}$, and look at the convergents.  The one before a big $a_i$ is likely to be $\\alpha$.</p></li>\n<li><p>I used this sort of idea in a paper with Darmon et al. on Stark-Heegner points recently.</p></li>\n</ul>\n"}︡
︠3075bf76-4190-4ca7-8a45-0d4e54aace6e︠
alpha = 2017/2013; N(alpha, digits=10)
︡8cba0cd1-c077-4922-b9c4-85438e3c01a4︡{"stdout":"1.001987084"}︡{"stdout":"\n"}︡
︠c9e9a7aa-1787-4446-8a62-336ce7a409bf︠
v = continued_fraction(1.001987084); v
︡f7c6bf37-e647-4d77-b6eb-5a269510fd34︡{"stdout":"[1, 503, 4, 5399, 2, 3, 6, 1]"}︡{"stdout":"\n"}︡
︠d8a29893-30d9-4c82-b977-2679a415b3f3︠
v.convergents()
︡5f408a21-326f-46be-ad95-497be01592b3︡{"stdout":"[1, 504/503, 2017/2013, 10890287/10868690, 21782591/21739393, 76238060/76086869, 479210951/478260607, 555449011/554347476]"}︡{"stdout":"\n"}︡
︠aa976b79-d15c-4ed0-9a1e-827605fe93d4︠
continued_fraction([1,503,4]).convergents()
︡45ded83f-e318-4e15-aebe-f9724ab170da︡{"stdout":"[1, 504/503, 2017/2013]"}︡{"stdout":"\n"}︡
︠7d5a331c-ecf2-4dcb-b296-0f6a8228f11ei︠
%md

This idea is **massively better** than what you learn in school, which is to look for a repeat in the decimal expansion!
︡16837ec3-6fe0-4348-a36c-ad8386261134︡{"html":"<p>This idea is <strong>massively better</strong> than what you learn in school, which is to look for a repeat in the decimal expansion!</p>\n"}︡
︠da6f8e92-0e2d-4038-96f8-3da7f9c00b5f︠
# number of terms until decimal expansion repeats
Mod(2013,10000).multiplicative_order()
︡cdc98dab-9ca1-416c-a676-8613d4260885︡{"stdout":"500"}︡{"stdout":"\n"}︡
︠a2b17ad7-4fc9-483a-afcd-51f9afad0a0f︠
N(2017/2013, digits=510)
︡be780bff-56ea-4905-82e6-b52509242efc︡{"stdout":"1.00198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182314952806756085444610034773969200198708395429706905116741182"}︡{"stdout":"\n"}︡
︠cf60445a-392d-4d88-a787-68be0f2f4bc0︠
%md

### And now for a surprise...

**Theorem:** *A continued fraction is repeating if and only if it is the continued fraction of a real quadratic number.*
︡551c5ad3-4d72-4c82-8e63-acfcd60936f7︡{"html":"<h3>And now for a surprise&#8230;</h3>\n\n<p><strong>Theorem:</strong> <em>A continued fraction is repeating if and only if it is the continued fraction of a real quadratic number.</em></p>\n"}︡
︠90eff660-0c29-45ad-9e80-e31bfd740157︠
continued_fraction(sqrt(3))
︡be3d0fe4-d844-4338-a62c-b0afe5fe0b68︡{"stdout":"[1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2]"}︡{"stdout":"\n"}︡
︠95a30eb8-686c-4adb-80c7-280841e40376︠
continued_fraction(17-1/sqrt(13))
︡fe21c5a1-13df-41c3-b418-cd57c39d3327︡{"stdout":"[16, 1, 2, 1, 1, 1, 1, 6, 1, 1, 1, 1, 6, 1, 1, 1, 1, 6, 1, 1, 1, 1, 6, 1, 1]"}︡{"stdout":"\n"}︡
︠1027fb1f-89eb-4652-b432-666dd7a0a0b5︠
continued_fraction(sqrt(2013))
︡2fbd7157-1b88-4896-97b7-4583123e2b2a︡{"stdout":"[44, 1, 6, 2, 21, 1, 28, 1, 21, 2]"}︡{"stdout":"\n"}︡
︠286423ed-780b-47ee-befe-2ac3d5d194da︠

︠ccfe25f9-2954-4279-a88e-8db9f0167aadi︠


%md

### Next up... "rational reconstruction"...
︡4103beef-5b32-4f69-91e6-e8d1a35c5726︡{"html":"<h3>Next up&#8230; &#8220;rational reconstruction&#8221;&#8230;</h3>\n"}︡
︠de4445d3-81bf-49a3-8552-d93c39018458︠






















