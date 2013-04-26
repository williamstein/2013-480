︠412a20ba-7eb1-4c65-8876-59b66f55ebf5i︠
%md
## Goals
- Start Google+ Hangout
- Questions
- Reminder hw3 is due tonight at midnight.
- [New homework assignment](https://docs.google.com/forms/d/1ZkZKixNbIJwC6uZAbmisOWmqDLoDS5BEz_HO4VGk39k/viewform)
- Remarks about [https://cloud.sagemath.org](https://cloud.sagemath.org):
   - I upped the disk space by 128GB
   - I'm planning on redeploy the entire thing on a multi-site cluster Thursday; some small downtime, followed by improved reliability and many new features.
- New topic: **Computational elementary number theory**

︡3cf54a0e-854e-435c-a430-4c4b4a0714b0︡{"html":"<h2>Goals</h2>\n\n<ul>\n<li>Start Google+ Hangout</li>\n<li>Questions</li>\n<li>Reminder hw3 is due tonight at midnight.</li>\n<li><a href=\"https://docs.google.com/forms/d/1ZkZKixNbIJwC6uZAbmisOWmqDLoDS5BEz_HO4VGk39k/viewform\">New homework assignment</a></li>\n<li>Remarks about <a href=\"https://cloud.sagemath.org\">https://cloud.sagemath.org</a>:\n<ul>\n<li>I upped the disk space by 128GB</li>\n<li>I&#8217;m planning on redeploy the entire thing on a multi-site cluster Thursday; some small downtime, followed by improved reliability and many new features.</li>\n</ul></li>\n<li>New topic: <strong>Computational elementary number theory</strong></li>\n</ul>\n"}︡
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
︠81469adb-484e-40fc-a2c4-2160510a9c69︠
proof.
︠24d6237d-a22b-433b-bc7d-f1e5dc76183ei︠
hide();md("### We illustrate factoring an integer")
︡b8fbdf0b-f421-4d74-b610-77ae69522628︡{"html":"<h3>We illustrate factoring an integer</h3>\n"}︡
︠7de009da-e970-4207-b3e4-0bed593fe7d5︠
f = factor(2016)
print f
︡d83ed470-5c22-4380-a191-2644ff8cdc46︡{"stdout":"2^5 * 3^2 * 7"}︡{"stdout":"\n"}︡
︠b81eec85-5d65-46e3-bea9-ebbcc0253e5d︠
g = f*f
g
︡6f417b4a-bbd3-420c-a98b-cd46ccff16ce︡{"stdout":"2^10 * 3^4 * 7^2"}︡{"stdout":"\n"}︡
︠cdaafb33-bf05-4151-90f9-e93311ddd32a︠
f.value()
︡f8ec4cad-b2df-4b07-ba90-35cc182bcccd︡{"stdout":"2016"}︡{"stdout":"\n"}︡
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
︠5c2ef32f-4fe7-4dcf-90f3-7c006af8fe95︠
%var x,y
factor(x^3 - sin(y)^3)
︡c204d735-1c71-4c53-a532-da2dbcd20b32︡{"stdout":"(x - sin(y))*(x^2 + x*sin(y) + sin(y)^2)"}︡{"stdout":"\n"}︡
︠739e9da2-bf5f-42e0-832b-c7f82afa6671︠
R.<x,y> = QQ[]
factor(x^3 - y^3)
︡09c05884-2a6c-49e3-aa69-f087e5effff0︡{"stdout":"(x - y) * (x^2 + x*y + y^2)"}︡{"stdout":"\n"}︡
︠dec4daab-395f-4d5b-93ba-71fee0023e73︠
type(factor(x^3 - y^3))
︡59a7a7ba-08f9-4c1c-95ea-35f840b2cf87︡{"stdout":"<class 'sage.structure.factorization.Factorization'>"}︡{"stdout":"\n"}︡
︠d1a361ad-ade4-4f68-a2c5-02775d1f1e97i︠
hide();md("### Factoring a negative rational")
︡7ec21606-948d-4660-939d-dec9b561a54a︡{"html":"<h3>Factoring a negative rational</h3>\n"}︡
︠e2f34364-7bd0-4a0e-8aeb-bf6e120be334︠
f = factor(-2013/2015); show(f)
︡d0df6cb5-cc63-4cbf-b363-8e1d73eb0c66︡{"tex":{"tex":"-1 \\cdot 3 \\cdot 5^{-1} \\cdot 11 \\cdot 13^{-1} \\cdot 31^{-1} \\cdot 61","display":true}}︡
︠0f134bb7-640a-4abb-aaf2-6f595706cf3e︠

︠8854e8d5-2cb4-43ac-a8e6-03f43137e627︠
list(f)
︡1acb81a8-d6dd-416b-a7ae-9f0556a1e260︡{"stdout":"[(3, 1), (5, -1), (11, 1), (13, -1), (31, -1), (61, 1)]"}︡{"stdout":"\n"}︡
︠2b6700fa-82b9-4d95-bfe6-0dd5a4071dd8︠
f.unit()
︡7cc1e378-bbfc-4884-b951-0d8dd25fe4c4︡{"stdout":"-1"}︡{"stdout":"\n"}︡
︠2b540280-a8d2-4db6-a7a4-e62cd2d930d9︠
# This skips proving primality of found factors:
factor(900238409283492834, proof=False)
︡e4578d1a-2389-4796-9a57-327f9ff73cc0︡{"stdout":"2 * 3 * 47 * 25747 * 314771 * 393901"}︡{"stdout":"\n"}︡
︠45fc8271-257d-4a95-b7e8-ac65e1f5c28ci︠
hide();md("### Trial division finds exactly one small factor of an integer quickly (if there is one), or gives up.")
︡9d689491-9351-4218-b23c-8fc068d2f16d︡{"html":"<h3>Trial division finds exactly one small factor of an integer quickly (if there is one), or gives up.</h3>\n"}︡
︠ec4a8b64-450f-4268-852c-315be3cfd800︠
n = 2015920845029834982347
n.trial_division(10^3)
︡69a364b9-5200-48c2-8858-a491c8a132b7︡{"stdout":"2015920845029834982347"}︡{"stdout":"\n"}︡
︠46733166-ddb2-4040-82ce-bacdf16fb414︠
n.factor()
︡e992f72a-6e0a-470b-a7aa-a608c37cb7c7︡{"stdout":"10456542743 * 192790379629"}︡{"stdout":"\n"}︡
︠21599922-000d-46a8-b340-e6103e2bbe6d︠
n = 2016
%timeit n.factor()
%timeit n.trial_division()
︡b836b0b8-9194-4dad-be9f-b37a24ff3ec0︡{"stdout":"625 loops, best of 3: 22.5 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 378 ns per loop"}︡{"stdout":"\n"}︡
︠dd011f87-0bc3-4498-a06c-cc230ec70414︠
n = next_prime(10^14)*next_prime(10^50)
n.trial_division(bound=10^6)  # returns n, since nothing found
n
︡a7ef6547-96e0-4fa5-b68f-eec5683703c5︡{"stdout":"10000000000003100000000000000000000000000000000015100000000004681"}︡{"stdout":"\n"}︡{"stdout":"10000000000003100000000000000000000000000000000015100000000004681"}︡{"stdout":"\n"}︡
︠b4889f8e-9fd6-4593-bcc2-c84489194a50︠
# ECM -- "elliptic curve method"; algorithm invented by Hendrik Lenstra
# to find medium size factors of integers.

#GMPECM
e = ecm.factor(n); print e
︡26dd7ea3-6aad-4297-8598-5e711eafdbcf︡{"stdout":"[100000000000031, 100000000000000000000000000000000000000000000000151]"}︡{"stdout":"\n"}︡
︠4b3b92c3-cc31-4796-96ab-a21d6aa1363d︠
!ecm --help
︡03f4a3af-227d-4fa9-8eb4-5e7e6123ff1c︡{"stdout":"Usage: ecm [options] B1 [[B2min-]B2] < file\n\nParameters:\n  B1           stage 1 bound\n  B2           stage 2 bound (or interval B2min-B2max)\n\nOptions:\n  -x0 x        use x as initial point\n  -sigma s     use s as curve generator [ecm]\n  -A a         use a as curve parameter [ecm]\n  -k n         perform >= n steps in stage 2\n  -power n     use x^n for Brent-Suyama's extension\n  -dickson n   use n-th Dickson's polynomial for Brent-Suyama's extension\n  -c n         perform n runs for each input\n  -pm1         perform P-1 instead of ECM\n  -pp1         perform P+1 instead of ECM\n  -q           quiet mode\n  -v           verbose mode\n  -timestamp   print a time stamp with each number\n  -mpzmod      use GMP's mpz_mod for modular reduction\n  -modmuln     use Montgomery's MODMULN for modular reduction\n  -redc        use Montgomery's REDC for modular reduction\n  -nobase2     disable special base-2 code\n  -nobase2s2   disable special base-2 code in ecm stage 2 only\n  -base2 n     force base 2 mode with 2^n+1 (n>0) or 2^|n|-1 (n<0)\n  -ntt         enable NTT convolution routines in stage 2\n  -no-ntt      disable NTT convolution routines in stage 2\n  -save file   save residues at end of stage 1 to file\n  -savea file  like -save, appends to existing files\n  -resume file resume residues from file, reads from stdin if file is \"-\"\n  -chkpnt file save periodic checkpoints during stage 1 to file\n  -primetest   perform a primality test on input\n  -treefile f  store product tree of F in files f.0 f.1 ... \n  -maxmem n    use at most n MB of memory in stage 2\n  -stage1time n add n seconds to ECM stage 1 time (for expected time est.)\n  -i n         increment B1 by this constant on each run\n  -I f         auto-calculated increment for B1 multiplied by 'f' scale factor\n  -inp file    Use file as input (instead of redirecting stdin)\n  -b           Use breadth-first mode of file processing\n  -d           Use depth-first mode of file processing (default)\n  -one         Stop processing a candidate if a factor is found (looping mode)\n  -n           run ecm in \"nice\" mode (below normal priority)\n  -nn          run ecm in \"very nice\" mode (idle priority)\n  -t n         Trial divide candidates before P-1, P+1 or ECM up to n\n  -ve n        Verbosely show short (< n character) expressions on each loop\n  -cofdec      Force cofactor output in decimal (even if expressions are used)\n  -B2scale f   Multiplies the default B2 value by f \n  -go val      Preload with group order val, which can be a simple expression,\n               or can use N as a placeholder for the number being factored.\n  -printconfig Print compile-time configuration and exit.\n  -h, --help   Prints this help and exit.\n"}︡
︠d7efb8c9-c30b-46c3-91dd-c7d26ca28090︠
# qsieve -- factoring a product of two similarly sized primes
n = next_prime(10^20)*next_prime(10^23)
qsieve(n)
︡d1a125be-f346-47d2-b208-ba8b4ecf757f︡{"stdout":"([100000000000000000039, 100000000000000000000117], '')"}︡{"stdout":"\n"}︡
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
︡1b47133c-a790-453b-a40d-38eadac7c39a︡{"stdout":"(x)->;i=1;while(i<x,if(issquare(ceil(sqrt(i*x))^2%x),return(gcd(x,floor(ceil(sqrt(i*x))-sqrt((ceil(sqrt(i*x))^2)%x)))));i++)"}︡{"stdout":"\n"}︡
︠97fd1a63-41d4-4a4b-aa5f-5ae9d8c65716︠
gp('OLF')(n)
︡11b4308f-e5ec-4552-a5a2-7251830bd6c2︡{"stdout":"1000000000000000000117"}︡{"stdout":"\n"}︡
︠5f6ed1ee-44fc-4d10-86c9-4e6164228f77︠
n = next_prime(10^20)*next_prime(10^21)
factor(n, verbose=4)
# verbose doesn't work in notebook; use command line
︡2900aa13-1871-4719-a249-6b425bb79807︡{"stdout":"100000000000000000039 * 1000000000000000000117"}︡{"stdout":"\n"}︡





