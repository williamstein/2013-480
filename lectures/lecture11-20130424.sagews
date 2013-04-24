︠ee12ff98-828a-460c-a938-38ebf5279705i︠
%md
# Lecture 11: Computational Number Theory Using Sage (part 1)

## April 24, 2013

---
︡2c0fe248-d57e-4779-a0c2-c5b9d5103775︡{"html":"<h1>Lecture 11: Computational Number Theory Using Sage (part 1)</h1>\n\n<h2>April 24, 2013</h2>\n\n<hr />\n"}︡
︠c87421e7-8a0a-450b-a1a5-423fe35391bbi︠
%md

## Target Topics

I published an undergraduate book called "Elementary Number Theory: Primes, Congruences, and Secrets" [free online](http://wstein.org/ent/) and will start with showing you how to compute with the mathematical objects of that book.    Depending on how this goes, I may also talk about some more advanced topics (e.g., basic number fields).
︡44357d62-96f4-46ac-820b-1a8fa8d5fabd︡{"html":"<h2>Target Topics</h2>\n\n<p>I published an undergraduate book called &#8220;Elementary Number Theory: Primes, Congruences, and Secrets&#8221; <a href=\"http://wstein.org/ent/\">free online</a> and will start with showing you how to compute with the mathematical objects of that book.    Depending on how this goes, I may also talk about some more advanced topics (e.g., basic number fields).</p>\n"}︡
︠9ee308b3-f7b8-489c-8125-de95c1ad4b21i︠
%md

# Integer Factorization

### Sage has a function to factor integers.

 - it can also factor rationals as negative numbers

 - the output is a special "factorization" object

 - the `factor` function calls the corresponding function in the [Pari number theory library](http://pari.math.u-bordeaux.fr/), *then* proves that each claimed prime factor is in fact prime (which Pari doesn't do by default).

  - Sage also has special separate code that can be useful for solving related problems:
      - `trail_division` -- for finding small factors

      - `ecm` -- state-of-the-art-in-some-cases factoring algorithm for finding medium sized factors of numbers.

      - `qsieve` -- for factoring a large number, usually a product of two primes.

  - (for experts) Sage does not include any number field sieve implementations, but Kartik was working on this at [Sage Days 46](http://wiki.sagemath.org/sagedays46) in Hawaii over spring break.
︡99ada73d-d093-4f4d-a480-64301d428028︡{"html":"<h1>Integer Factorization</h1>\n\n<h3>Sage has a function to factor integers.</h3>\n\n<ul>\n<li><p>it can also factor rationals as negative numbers</p></li>\n<li><p>the output is a special &#8220;factorization&#8221; object</p></li>\n<li><p>the <code>factor</code> function calls the corresponding function in the <a href=\"http://pari.math.u-bordeaux.fr/\">Pari number theory library</a>, <em>then</em> proves that each claimed prime factor is in fact prime (which Pari doesn&#8217;t do by default).</p>\n\n<ul>\n<li><p>Sage also has special separate code that can be useful for solving related problems:</p>\n\n<ul>\n<li><p><code>trail_division</code> &#8211; for finding small factors</p></li>\n<li><p><code>ecm</code> &#8211; state-of-the-art-in-some-cases factoring algorithm for finding medium sized factors of numbers.</p></li>\n<li><p><code>qsieve</code> &#8211; for factoring a large number, usually a product of two primes.</p></li>\n</ul></li>\n<li><p>(for experts) Sage does not include any number field sieve implementations, but Kartik was working on this at <a href=\"http://wiki.sagemath.org/sagedays46\">Sage Days 46</a> in Hawaii over spring break.</p></li>\n</ul></li>\n</ul>\n"}︡
︠24d6237d-a22b-433b-bc7d-f1e5dc76183ei︠
hide();md("### We illustrate factoring an integer")
︡b8fbdf0b-f421-4d74-b610-77ae69522628︡{"html":"<h3>We illustrate factoring an integer</h3>\n"}︡
︠7de009da-e970-4207-b3e4-0bed593fe7d5︠
f = factor(2016)
print f
︡0551192c-f17c-4c2e-9562-379942a84f30︡{"stdout":"2^5 * 3^2 * 7"}︡{"stdout":"\n"}︡
︠b81eec85-5d65-46e3-bea9-ebbcc0253e5d︠

︠c49709b9-2a5d-46ae-916e-e66ea9154bf3︠
show(f)
︡63e512c9-f36e-4498-996b-73d51a99b7be︡{"tex":{"tex":"2^{5} \\cdot 3^{2} \\cdot 7","display":true}}︡
︠fbe38e31-2664-48a4-9334-a8d7be1e3ead︠
type(f)
︡71b5f2ef-3388-4359-ada1-e17c1ee73492︡{"stdout":"<class 'sage.structure.factorization_integer.IntegerFactorization'>"}︡{"stdout":"\n"}︡
︠5298c8d4-0c01-44d7-b50f-41cc4adf3794︠
list(f)
︡00ee4d7a-e36e-438d-973a-f9296f417cf4︡{"stdout":"[(2, 5), (3, 2), (7, 1)]"}︡{"stdout":"\n"}︡
︠a31b833a-f862-4ed8-aadb-fef7d3664f6d︠
f[1]
︡94321cfc-0213-4c58-a209-d4a00cb6e918︡{"stdout":"(3, 2)"}︡{"stdout":"\n"}︡
︠d1a361ad-ade4-4f68-a2c5-02775d1f1e97i︠
hide();md("### Factoring a negative rational")
︡7ec21606-948d-4660-939d-dec9b561a54a︡{"html":"<h3>Factoring a negative rational</h3>\n"}︡
︠e2f34364-7bd0-4a0e-8aeb-bf6e120be334︠
f = factor(-2013/2015); show(f)
︡f3aed5a5-0a7f-463d-817c-7b04b6232b47︡{"tex":{"tex":"-1 \\cdot 3 \\cdot 5^{-1} \\cdot 11 \\cdot 13^{-1} \\cdot 31^{-1} \\cdot 61","display":true}}︡
︠8854e8d5-2cb4-43ac-a8e6-03f43137e627︠
list(f)
︡1acb81a8-d6dd-416b-a7ae-9f0556a1e260︡{"stdout":"[(3, 1), (5, -1), (11, 1), (13, -1), (31, -1), (61, 1)]"}︡{"stdout":"\n"}︡
︠2b6700fa-82b9-4d95-bfe6-0dd5a4071dd8︠
f.unit()
︡7cc1e378-bbfc-4884-b951-0d8dd25fe4c4︡{"stdout":"-1"}︡{"stdout":"\n"}︡
︠2b540280-a8d2-4db6-a7a4-e62cd2d930d9︠
# This skips proving primality of found factors:
factor(9002384092834, proof=False)
︡ac76039e-b038-4ce7-aa4a-77b441def1ca︡{"stdout":"2 * 11 * 4567 * 89599141"}︡{"stdout":"\n"}︡
︠45fc8271-257d-4a95-b7e8-ac65e1f5c28ci︠
hide();md("### Trial division finds exactly one small factor of an integer quickly (if there is one), or gives up.")
︡9d689491-9351-4218-b23c-8fc068d2f16d︡{"html":"<h3>Trial division finds exactly one small factor of an integer quickly (if there is one), or gives up.</h3>\n"}︡
︠ec4a8b64-450f-4268-852c-315be3cfd800︠
n = 2015
n.trial_division()
︡dfda236d-b549-46eb-8cbe-a8563ddc2c02︡{"stdout":"5"}︡{"stdout":"\n"}︡
︠21599922-000d-46a8-b340-e6103e2bbe6d︠
%timeit n.factor()
%timeit n.trial_division()
︡10229146-0271-4bc2-bbe4-766e294427c8︡{"stdout":"625 loops, best of 3: 14.3 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 251 ns per loop"}︡{"stdout":"\n"}︡
︠dd011f87-0bc3-4498-a06c-cc230ec70414︠
n = next_prime(10^14)*next_prime(10^50)
n.trial_division(bound=10^6)  # returns n, since nothing found
n
︡f8a7c99f-61a4-4676-a38b-a1de9268a406︡{"stdout":"10000000000003100000000000000000000000000000000015100000000004681"}︡{"stdout":"\n"}︡{"stdout":"10000000000003100000000000000000000000000000000015100000000004681"}︡{"stdout":"\n"}︡
︠b4889f8e-9fd6-4593-bcc2-c84489194a50︠
# ECM -- "elliptic curve method"; algorithm invented by Hendrik Lenstra
# to find medium size factors of integers.

e = ecm.factor(n); print e
︡49299df2-e8b5-4fbc-8a1e-582539cc5a4a︡{"stdout":"[100000000000031, 100000000000000000000000000000000000000000000000151]"}︡{"stdout":"\n"}︡
︠d7efb8c9-c30b-46c3-91dd-c7d26ca28090︠
# qsieve -- factoring a product of two similarly sized primes
n = next_prime(10^20)*next_prime(10^21)
qsieve(n)
︡d87cb0a8-79f7-4444-9688-362626e25cc2︡{"stdout":"([100000000000000000039, 1000000000000000000117], '')"}︡{"stdout":"\n"}︡
︠876bdabb-954c-4b05-88e0-8144c004ff08o︠
# Bill Hart -- (author of much in Sage) invented a short algorithm called
# "A ONE LINE FACTORING ALGORITHM" that is very good at factoring
# numbers of the form next_prime(10^a)*next_prime(10^b) that one might
# make up for benchmarks.
html.iframe("http://journals.cambridge.org/action/displayAbstract?fromPage=online&aid=8610702")
︡6a6befa3-cad3-4652-83fb-a0888e543003︡{"html":"<iframe height=\"400\" width=\"800\" src=\"http://journals.cambridge.org/action/displayAbstract?fromPage=online&aid=8610702\"></iframe>"}︡
︠adb51ee1-185e-4db9-906f-e6916ea77b26︠
%gp
OLF(x)=;i=1;while(i<x,if(issquare(ceil(sqrt(i*x))^2%x),return (gcd(x,floor(ceil(sqrt(i*x))-sqrt((ceil(sqrt(i*x))^2)%x)))));i++)
︡1e9a4239-c35a-4b3f-b0c4-dc945699205d︡{"stdout":"(x)->;i=1;while(i<x,if(issquare(ceil(sqrt(i*x))^2%x),return(gcd(x,floor(ceil(sqrt(i*x))-sqrt((ceil(sqrt(i*x))^2)%x)))));i++)"}︡{"stdout":"\n"}︡
︠97fd1a63-41d4-4a4b-aa5f-5ae9d8c65716︠
gp('OLF')(n)
︡11b4308f-e5ec-4552-a5a2-7251830bd6c2︡{"stdout":"1000000000000000000117"}︡{"stdout":"\n"}︡
︠5f6ed1ee-44fc-4d10-86c9-4e6164228f77︠
n = next_prime(10^20)*next_prime(10^21)
factor(n, verbose=4)  # verbose doesn't work in notebook; use command line
︡2900aa13-1871-4719-a249-6b425bb79807︡{"stdout":"100000000000000000039 * 1000000000000000000117"}︡{"stdout":"\n"}︡
︠ee85db33-e64c-4a54-81b0-abd6d48562aai︠


%md
# Primality testing

 - Sage (because of Pari) has a very, very fast function to decide if a number is highly likely to be prime. When I last checked this seemed to be "overall" the best implementation available anywhere.

 - Sage can also efficiently *provably* decide primality.  (When I last checked) this does not use the "primes is in P" theorem at all, but instead uses an non-deterministic elliptic-curve based primality algorithm (ECPP).
︡31b3b10b-7a04-4624-980c-68fc4e771e75︡{"html":"<h1>Primality testing</h1>\n\n<ul>\n<li><p>Sage (because of Pari) has a very, very fast function to decide if a number is highly likely to be prime. When I last checked this seemed to be &#8220;overall&#8221; the best implementation available anywhere.</p></li>\n<li><p>Sage can also efficiently <em>provably</em> decide primality.  (When I last checked) this does not use the &#8220;primes is in P&#8221; theorem at all, but instead uses an non-deterministic elliptic-curve based primality algorithm (ECPP).</p></li>\n</ul>\n"}︡
︠679d0632-340d-4441-a7cd-c680d03abab9︠
# This tests primality of numbers after $10^{250}$ until it finds one
# that is very likely to be prime.  Being able to find large primes
# like this quickly is useful in public-key cryptogrpahy.
%time p = next_probable_prime(10^250)
p
︡be6e80cd-1f83-4208-8635-13a2a9f203da︡{"stdout":"CPU time: 0.13 s, Wall time: 0.13 s"}︡{"stdout":"\n"}︡{"stdout":"10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001227"}︡{"stdout":"\n"}︡
︠10cbe468-b481-45b9-bd38-4ce1be96b5a5︠
# This proves that the $p$ we found above is in fact prime.
%time p.is_prime()
︡d1f310de-5bc8-4834-8a61-4d68737220c1︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 2.49 s, Wall time: 2.47 s"}︡{"stdout":"\n"}︡
︠372b097d-5e01-445f-915c-91adf4ce43c5︠
# A random 1000-digit number is not likely to be prime
n = randint(0,10^1000); n
%time is_pseudoprime(n)
︡5e7a7935-9676-482d-9009-7af7774cf0b9︡{"stdout":"7925103225135963298840378372317315061112834524929056494654561882430339782653977080199077971785740586957666070972788444423189688776516333552668083604078567985459533194604759813505101053586109003686209081587089238263603062626795876184136811930134860608259904934308445404566797746211069439298899962780950327238242776917304811116495939615326589948300236920662082221130948953389072142787837989664249486687685354940456014221776522344996320782719058475215512056813929278580793571913670445275159134376018871629757956337240364084396464424526248215180228411787356802873359556449697319754006806375392909251663077474101377221076430500456356790877467015918621395499086770808987985879421927318798440118434651737086490078280306652088381356563350613658523237769212134463590781233781012665175597661325301789186301158481733864656269568245533307631586707824247655775854803894511487459487873690574505281785171752481799361406494715085740767635670661221851668581151623011432710749382862993683865272473829849619340193214779L"}︡{"stdout":"\n"}︡{"stdout":"False"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.00 s, Wall time: 0.00 s"}︡{"stdout":"\n"}︡
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
%timeit v = list(primes(20000))   # watch out -- primes is SLOW (due to algorithm)
%timeit v = prime_range(20000)
︡11b7fca1-51aa-468f-97c5-745a0970e0ec︡{"stdout":"25 loops, best of 3: 9.98 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 299 µs per loop"}︡{"stdout":"\n"}︡
︠c80cea6f-d7a2-4f5b-8238-24b41fa33d99︠
# Count some primes
prime_pi(20000)
︡c20df746-50b8-4952-961a-01f3bded89db︡{"stdout":"2262"}︡{"stdout":"\n"}︡
︠61031f50-6a69-4a69-8d17-2c65acffa5a4︠
len(prime_range(20000))
︡e95dd5f0-83c6-42a7-b58d-a2d270c91fb8︡{"stdout":"2262"}︡{"stdout":"\n"}︡
︠a30f4973-3a6c-4313-9dd4-5e8a2f254fe9︠
for k in [2..11]:
    print "10^%s\t\t"%k, prime_pi(10^k)
︡e9fe09f3-cf5d-4c13-bd6e-6acc12529852︡{"stdout":"10^2\t\t"}︡{"stdout":"25"}︡{"stdout":"\n"}︡{"stdout":"10^3\t\t"}︡{"stdout":"168"}︡{"stdout":"\n"}︡{"stdout":"10^4\t\t"}︡{"stdout":"1229"}︡{"stdout":"\n"}︡{"stdout":"10^5\t\t"}︡{"stdout":"9592"}︡{"stdout":"\n"}︡{"stdout":"10^6\t\t"}︡{"stdout":"78498"}︡{"stdout":"\n"}︡{"stdout":"10^7\t\t"}︡{"stdout":"664579"}︡{"stdout":"\n"}︡{"stdout":"10^8\t\t"}︡{"stdout":"5761455"}︡{"stdout":"\n"}︡{"stdout":"10^9\t\t"}︡{"stdout":"50847534"}︡{"stdout":"\n"}︡{"stdout":"10^10\t\t"}︡{"stdout":"455052511"}︡{"stdout":"\n"}︡{"stdout":"10^11\t\t"}︡{"stdout":"4118054813"}︡{"stdout":"\n"}︡
︠d8ede194-1185-479e-9c29-8b1018692beb︠
plot(prime_pi, 2,50)
︡480c55ad-fbdf-4c8d-96b2-6029ad5a236a︡{"file":{"show":true,"uuid":"cb9a5d76-e2ba-45b6-9c2b-fdc0e50ea535","filename":"/home/wstein/.sage/temp/localhost/7374/tmp_CYPMj1.svg"}}︡{"stdout":"\n"}︡
︠cf8e8955-dbc6-4bff-b212-ab05d8364e57︠
plot(prime_pi, 2,10000)
︡e7e4daa7-3dd8-45ba-a886-b73afe694a4c︡{"file":{"show":true,"uuid":"82f62f41-54c7-4eef-93ea-b999d46c72e0","filename":"/home/wstein/.sage/temp/localhost/7374/tmp_elxtRH.svg"}}︡{"stdout":"\n"}︡
︠8d29cb66-bb79-4485-b4ce-d3c0d64007cei︠
%md

Let $\pi(x) = \\#\\{p : p\leq x \text{ is prime }\\}$ and
${\rm Li}(x) = \int_{2}^x \frac{dt}{\log(t)}$.

**Conjecture (The Riemann Hypothesis)**: *We have $|\pi(x) - {\rm Li}(x)|\leq \sqrt{x}\cdot \log(x)$.*

Note: There is a [one million dollar cash prize](http://www.claymath.org/millennium/Riemann_Hypothesis/) for proving this conjecture.
︡e711de99-7254-44de-adf2-dc651631d2db︡{"html":"<p>Let $\\pi(x) = \\#\\{p : p\\leq x \\text{ is prime }\\}$ and\n${\\rm Li}(x) = \\int_{2}^x \\frac{dt}{\\log(t)}$.</p>\n\n<p><strong>Conjecture (The Riemann Hypothesis)</strong>: <em>We have $|\\pi(x) - {\\rm Li}(x)|\\leq \\sqrt{x}\\cdot \\log(x)$.</em></p>\n\n<p>Note: There is a <a href=\"http://www.claymath.org/millennium/Riemann_Hypothesis/\">one million dollar cash prize</a> for proving this conjecture.</p>\n"}︡
︠8e4d98fe-4ffb-49da-99ec-2ec9cb228bb6︠

plot(prime_pi, 2,10000) + plot(Li, 2, 10000, color='red')
︡9216a775-bf57-4c94-b937-7ff1e872cb08︡{"file":{"show":true,"uuid":"c1bc13b6-e81d-4316-bb73-50fb4789c9ab","filename":"/home/wstein/.sage/temp/localhost/7374/tmp_UlQLan.svg"}}︡{"stdout":"\n"}︡
︠5fc3056c-0746-4ab9-b6da-650c8bbf1d9d︠
for k in [2..11]:
    z = int(N(Li(10^k))); pr = prime_pi(10^k)
    print "10^%s\t\t%-15s%-15s%-15s"%(k, pr, z, pr-z)
︡e8f83a80-2973-4c98-b52c-7ef3c1c472a7︡{"stdout":"10^2\t\t25             29             -4             "}︡{"stdout":"\n"}︡{"stdout":"10^3\t\t168            176            -8             "}︡{"stdout":"\n"}︡{"stdout":"10^4\t\t1229           1245           -16            "}︡{"stdout":"\n"}︡{"stdout":"10^5\t\t9592           9628           -36            "}︡{"stdout":"\n"}︡{"stdout":"10^6\t\t78498          78626          -128           "}︡{"stdout":"\n"}︡{"stdout":"10^7\t\t664579         664917         -338           "}︡{"stdout":"\n"}︡{"stdout":"10^8\t\t5761455        5762208        -753           "}︡{"stdout":"\n"}︡{"stdout":"10^9\t\t50847534       50849233       -1699          "}︡{"stdout":"\n"}︡{"stdout":"10^10\t\t455052511      455055613      -3102          "}︡{"stdout":"\n"}︡{"stdout":"10^11\t\t4118054813     4118066399     -11586         "}︡{"stdout":"\n"}︡
︠605a64fa-c03e-41c0-9db4-89a2e49f0fa3︠








