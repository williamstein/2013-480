︠85a53558-92bc-4da3-b400-cd6d811b4d32i︠
%hide
%md

# Lecture 13: Continued Fractions
(Wednesday will be: rational reconstruction)

**Reminder: turn on google+ hangout**

︡152364a4-4bbe-4c75-bada-f7eab932de8a︡{"html":"<h1>Lecture 13: Continued Fractions</h1>\n\n<p>(Wednesday will be: rational reconstruction)</p>\n\n<p><strong>Reminder: turn on google+ hangout</strong></p>\n"}︡
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
︠08e461c1-6a1b-4ed8-94c2-9ede89281992︠
QQbar
︡3b0ec7f0-bc89-4f2c-b453-9bd37d7f4216︡{"stdout":"Algebraic Field"}︡{"stdout":"\n"}︡
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
︡2b78c28f-98ea-455e-be09-d649330d5b4c︡{"stdout":"[2013]"}︡{"stdout":"\n"}︡
︠aa5b2c02-61a8-44a8-883a-120b999829a6︠
continued_fraction(1/7)
︡66dd0873-ffbc-4e00-be44-7761d9efd5cd︡{"stdout":"[0, 7]"}︡{"stdout":"\n"}︡
︠69ad3cbf-a58f-4976-ae8d-2be02d677264︠
c = continued_fraction(1.2345)
c
type(c)
︡dcb38584-722d-4699-b941-02d0c2794b19︡{"stdout":"[1, 4, 3, 1, 3, 1, 1, 2, 4, 1]"}︡{"stdout":"\n"}︡{"stdout":"<class 'sage.rings.contfrac.ContinuedFraction'>"}︡{"stdout":"\n"}︡
︠7122220c-24ef-4d02-a548-06c772fd1b97︠
show(c)
︡d6af9558-56b0-4077-9617-7dd1cc296d1c︡{"tex":{"tex":"1+ \\frac{\\displaystyle 1}{\\displaystyle 4+ \\frac{\\displaystyle 1}{\\displaystyle 3+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 3+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 2+ \\frac{\\displaystyle 1}{\\displaystyle 4+ \\frac{\\displaystyle 1}{\\displaystyle 1}}}}}}}}}","display":true}}︡
︠d211cf45-57b7-436c-8380-08cb95b2d871︠
N(sqrt(2), digits=100)
︡1af449c3-12d9-4a05-9786-e933dfdf90e9︡{"stdout":"1.414213562373095048801688724209698078569671875376948073176679737990732478462107038850387534327641573"}︡{"stdout":"\n"}︡
︠176566ff-a468-43d5-bc85-e7695efd58ef︠
continued_fraction(sqrt(2))
# note -- in fact, this repeats forever
︡3b496dfd-6f3d-42a5-b52e-ef3843e59a9a︡{"stdout":"[1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]"}︡{"stdout":"\n"}︡
︠3f0d3e7e-78de-4f9e-acdd-6d1356a72d0c︠
var('alpha')
show(solve(alpha == 1/(2+alpha), alpha))
︡0d5fd1cc-e849-4db4-bafe-b6ef44e794a1︡{"stdout":"alpha"}︡{"stdout":"\n"}︡{"tex":{"tex":"\\left[\\alpha = -\\sqrt{2} - 1, \\alpha = \\sqrt{2} - 1\\right]","display":true}}︡
︠4cd11b37-5c20-462f-9c44-8dee0d82310f︠
continued_fraction(e,nterms=100)
# Wow!  There *is* a pattern!
# (see my book for a proof)
︡8cb77f50-7bd3-4b75-af69-a88f9def4b10︡{"stdout":"[2, 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1, 1, 10, 1, 1, 12, 1, 1, 14, 1, 1, 16, 1, 1, 18, 1, 1, 20, 1, 1, 22, 1, 1, 24, 1, 1, 26, 1, 1, 28, 1, 1, 30, 1, 1, 32, 1, 1, 34, 1, 1, 36, 1, 1, 38, 1, 1, 40, 1, 1, 42, 1, 1, 44, 1, 1, 46, 1, 1, 48, 1, 1, 50, 1, 1, 52, 1, 1, 54, 1, 1, 56, 1, 1, 58, 1, 1, 60, 1, 1, 62, 1, 1, 64, 1, 1, 66, 1]"}︡{"stdout":"\n"}︡
︠b9469edc-f2a0-4cf5-b417-2f87e19a1dff︠
continued_fraction(e^2,nterms=100)
︡c6efd9f9-39b8-45b5-8dca-df53a25edae2︡{"stdout":"[7, 2, 1, 1, 3, 18, 5, 1, 1, 6, 30, 8, 1, 1, 9, 42, 11, 1, 1, 12, 54, 14, 1, 1, 15, 66, 17, 1, 1, 18, 78, 20, 1, 1, 21, 90, 23, 1, 1, 24, 102, 26, 1, 1, 27, 114, 29, 1, 1, 30, 126, 32, 1, 1, 33, 138, 35, 1, 1, 36, 150, 38, 1, 1, 39, 162, 41, 1, 1, 42, 174, 44, 1, 1, 45, 186, 47, 1, 1, 48, 198, 50, 1, 1, 51, 210, 53, 1, 1, 54, 222, 56, 1, 1, 57, 234, 59, 1, 1, 60]"}︡{"stdout":"\n"}︡
︠e8e9add3-fd07-4104-a96f-fade429f8446︠
continued_fraction(pi, nterms=100)  # Total mystery!
︡28e79dd4-9e07-42c9-9eaf-3c5d9ae8fc5b︡{"stdout":"[3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1, 1, 10]"}︡{"stdout":"\n"}︡
︠8a6857f9-d46c-4734-bb49-a280d0e8707a︠
sloane_find([3,7,15,1,292,1,1,1])
︡1f1b1a75-1ff1-4234-a2de-f8a097f7c1c5︡{"stdout":"Searching Sloane's online database..."}︡{"stdout":"\n"}︡{"stdout":"[]"}︡{"stdout":"\n"}︡
︠86aa3db5-a550-4bb5-a468-2d1a3e6957f1︠
search_src('internet')
︡09aa3a81-4be6-4b68-b389-c8b0b0ef1fde︡{"stdout":"all.py:239:       from twisted.internet import reactor\nstructure/sage_object.pyx:748:        sage: s = load(u)                                                  # optional - internet\nstructure/sage_object.pyx:751:        sage: s                                                            # optional - internet\ncombinat/sloane_functions.py:52:    sage: for t in sloane.trait_names(): # long time; optional - internet\ncombinat/matrices/hadamard_matrix.py:179:        sage: hadamard_matrix_www(\"had.4.txt\")             # optional - internet\ncombinat/matrices/hadamard_matrix.py:184:        sage: hadamard_matrix_www(\"had.16.2.txt\",comments=True)   # optional - internet\ncombinat/designs/ext_rep.py:553:        sage: s = ext_rep.designs_from_XML_url(\"http://designtheory.org/database/v-b-k/v3-b6-k2.icgsa.txt.bz2\") # optional - internet\ncombinat/designs/ext_rep.py:1040:        sage: ext_rep.designs_from_XML_url(\"http://designtheory.org/database/v-b-k/v3-b6-k2.icgsa.txt.bz2\") # optional - internet\ncombinat/designs/covering_design.py:446:        sage: C = best_known_covering_design_www(7, 3, 2)   # optional - internet\ncombinat/designs/covering_design.py:447:        sage: print C                                       # optional - internet\ncombinat/words/paths.py:2008:            sage: sloane_find(_, nresults=1) #optional - internet\nserver/simple/twist.py:130:from twisted.internet.task import LoopingCall\nserver/notebook/avatars.py:27:from twisted.internet import defer\nserver/notebook/twist.py:417:            # downloading a file from the internet\nserver/notebook/mailsender.py:26:from twisted.application import internet\nserver/notebook/mailsender.py:27:from twisted.internet import protocol\nserver/notebook/mailsender.py:77:        smtp_client = internet.TCPClient(exchange, 25, self._factory)\nserver/notebook/mailsender.py:106:        from twisted.internet import reactor\nserver/notebook/guard.py:32:from twisted.internet import task, defer\nserver/notebook/run_notebook.py:201:    from twisted.internet.error import ReactorNotRunning\ntests/cmdline.py:508:    Check some things requiring an internet connection::\ntests/cmdline.py:510:        sage: (out, err, ret) = test_executable([\"sage\", \"--standard\"])  # optional - internet\ntests/cmdline.py:511:        sage: out.find(\"atlas\") >= 0  # optional - internet\ntests/cmdline.py:513:        sage: err  # optional - internet\ntests/cmdline.py:515:        sage: ret  # optional - internet\ntests/cmdline.py:518:        sage: (out, err, ret) = test_executable([\"sage\", \"--optional\"])  # optional - internet\ntests/cmdline.py:519:        sage: out.find(\"database_cremona_ellcurve\") >= 0  # optional - internet\ntests/cmdline.py:521:        sage: err  # optional - internet\ntests/cmdline.py:523:        sage: ret  # optional - internet\ntests/cmdline.py:526:        sage: (out, err, ret) = test_executable([\"sage\", \"--experimental\"])  # optional - internet\ntests/cmdline.py:527:        sage: out.find(\"macaulay2\") >= 0  # optional - internet\ntests/cmdline.py:529:        sage: err  # optional - internet\ntests/cmdline.py:531:        sage: ret  # optional - internet\nparallel/multiprocessing_sage.py:67:    from twisted.internet import reactor   # do not delete this (!)  -- see trac 8785\ncoding/linear_code.py:42:   created by Cen Tjhai instead of the online internet tables,\ncoding/linear_code.py:417:    This does not require an internet connection.\ncoding/linear_code.py:464:        sage: L = best_known_linear_code_www(72, 36, GF(2)) # optional - internet\ncoding/linear_code.py:465:        sage: print L                                       # optional - internet\ncoding/linear_code.py:526:    This does not require an internet connection. The format of the output is\ndatabases/cremona.py:20:the internet.  You can also install it from a local copy of the\ndatabases/lincodes.py:61:##         sage: lower, upper, text = linear_code_bound(7, 32, 8)     # optional - internet\ndatabases/lincodes.py:70:##         sage: linear_code_bound(9, 32, 200)          # optional - internet\ndatabases/sloane.py:6:    sage: sloane_sequence(60843)       # optional - internet \ndatabases/sloane.py:12:    sage: sloane_sequence(\"60843\")     # optional - internet \ndatabases/sloane.py:18:    sage: sloane_sequence(\"060843\")    # optional - internet \ndatabases/sloane.py:27:    sage: sloane_sequence('sage')     # optional - internet \ndatabases/sloane.py:37:    sage: sloane_find([2,3,5,7], 2)       # optional - internet \ndatabases/sloane.py:45:    sage: len(sloane_find([1,2,3,4,5], 3))      # optional - internet \ndatabases/sloane.py:52:    sage: sloane_find([7, 71, 281, 4523, 74713])  # optional - internet\ndatabases/sloane.py:266:            raise IOError(\"%s\\nError fetching the following website:\\n    %s\\nTry checking your internet connection.\"%(msg, oeis_url))\ndatabases/sloane.py:272:                raise IOError(\"%s\\nError fetching the following website:\\n    %s\\nTry checking your internet connection.\"%(msg, names_url))\ndatabases/sloane.py:478:        sage: sloane_sequence(22) # optional - internet\ndatabases/sloane.py:530:        sage: sloane_find([1,1,2,3,5,8,13,21], nresults=1) #optional - internet\ndatabases/sloane.py:561:        raise IOError(\"%s\\nError fetching the following website:\\n    %s\\nTry checking your internet connection.\"%(msg, url))\nmatrix/matrix2.pyx:709:            sage: print sloane_sequence(79908)                # optional (internet connection)\nplot/colors.py:379:        well as internet applications, this is a point in the sRGB\nplot/plot3d/parametric_plot3d.py:220:    Maeder's_Owl (pretty but can't find an internet reference)::\nfinance/stock.py:101:            sage: S        # random; optional -- internet\nfinance/stock.py:113:            sage: finance.Stock('ibm').__repr__()     # random; optional -- internet\nfinance/stock.py:128:            sage: finance.Stock('goog').market_value()   # random; optional - internet\nfinance/stock.py:143:            sage: finance.Stock('GOOG').yahoo()          # random; optional -- internet\nfinance/stock.py:207:            sage: finance.Stock('vmw').google()[:5]   # optional -- internet\nfinance/stock.py:216:            sage: finance.Stock('F').google('Jan+3,+1978', 'Jul+7,+2008')[:5] # optional -- internet\nfinance/stock.py:230:            sage: finance.Stock('AAPL').google('Sep+1,+1900', 'Jan+1,+2000')[0:5] # optional -- internet\nfinance/stock.py:242:            sage: finance.Stock(\"OTC:NTDOY\").google(startdate=\"Jan+1,+2007\", enddate=\"Jan+1,+2008\")[:5]  # optional -- internet\nfinance/stock.py:258:            sage: sage.finance.stock.Stock(\"AAPL\", 22144).google(startdate='Jan+1,+1990')[:5] #optional -- internet\nfinance/stock.py:307:            sage: finance.Stock('vmw').open(startdate='Jan+1,+2008', enddate='Feb+1,+2008')                 # optional -- internet\nfinance/stock.py:314:            sage: c.google(startdate='Feb+1,+2008', enddate='Mar+1,+2008')[:5]    # optional -- internet\nfinance/stock.py:322:            sage: c.open()    # optional -- internet\nfinance/stock.py:328:            sage: finance.Stock('vmw').open()   # random; optional -- internet\nfinance/stock.py:366:            sage: finance.Stock('vmw').close(startdate='Jan+1,+2008', enddate='Feb+1,+2008')                 # optional -- internet\nfinance/stock.py:373:            sage: c.google(startdate='Feb+1,+2008', enddate='Mar+1,+2008')[:5]    # optional -- internet\nfinance/stock.py:381:            sage: c.close()    # optional -- internet\nfinance/stock.py:387:            sage: finance.Stock('vmw').close()   # random; optional -- internet\nfinance/stock.py:506:            sage: finance.Stock('aapl').google(startdate='Jan+1,+1990')[:2]    # optional -- internet\ngraphs/isgci.py:632:            sage: graph_classes._download_db() # Not tested -- requires internet\ngraphs/isgci.py:727:        Updates the ISGCI database by downloading the latest version from internet.\ngraphs/isgci.py:741:            sage: graph_classes.update_db() # Not tested -- requires internet\ninterfaces/jmoldata.py:148:            sage: JData.export_image(targetfile=testfile,datafile=script,image_type=\"PNG\") # optional -- internet\ninterfaces/jmoldata.py:149:            sage: print os.path.exists(testfile) # optional -- internet\ninterfaces/magma_free.py:29:        sage: magma_free(\"Factorization(9290348092384)\")  # optional - internet\ninterfaces/magma_free.py:71:        sage: magma_free(\"Factorization(9290348092384)\")  # optional - internet\ninterfaces/r.py:402:            sage: r.install_packages('aaMI')       # optional - internet\ninterfaces/r.py:615:            This requires an internet connection. The CRAN server is\ninterfaces/r.py:620:            sage: ap = r.available_packages()   # optional - internet\ninterfaces/expect.py:326:In many cases, the server that can actually run \"slave\" is not accessible from the internet directly, but you have to hop through an intermediate trusted server, say \"gate\".\nsymbolic/integration/integral.py:462:    over the internet (does NOT require a Mathematica license!)::\nsymbolic/integration/integral.py:466:        sage: f.integrate(algorithm=\"mathematica_free\")       # optional - internet\nsymbolic/integration/external.py:44:        sage: mma_free_integrator(sin(x), x) # optional - internet\nmisc/package.py:65:        sage: sage.misc.package.install_all_optional_packages(dry_run=True)  # optional - internet\nmisc/package.py:101:    You must have an internet connection. Also, you will have to\nmisc/package.py:194:    from the Sage repository. You must have an internet connection.\nmisc/package.py:237:    from the Sage repository. You must have an internet connection.\nmisc/package.py:278:    from the Sage repository. You must have an internet connection.\nmisc/package.py:324:    You must have an internet connection. Also, you will have to\nmisc/package.py:350:    mesg += 'of possibilities.   All this requires an internet connection.'\nmisc/remote_file.py:15:        sage: g = get_remote_file(\"http://sagemath.org/ack.html\", verbose=False)   # optional - internet\nmisc/preparser.py:1715:        sage: sage.misc.preparser.load('http://wstein.org/loadtest.py', globals())  # optional - internet\nmisc/preparser.py:1720:        sage: sage.misc.preparser.load('https://github.com/jasongrout/minimum_rank/raw/minimum_rank_1_0_0/minrank.py', globals())  # optional - internet \nmisc/preparser.py:1733:        sage: sage.misc.preparser.load('http://wstein.org/loadtest.py', globals(), attach=True)  # optional - internet\nmisc/hg.py:1544:        If you have internet access, it's best to just do\nmisc/hg.py:1566:           bundle against (doesn't require internet access)\n"}︡{"stdout":"\n"}︡
︠c302d81c-3b74-4829-bc2a-fb6ed643dd4bi︠
%md
### An open problem

**Definition** An *algebraic number* is any root of a polynomial with rational coefficients.



**Open Problem**  There is no example of an algebraic number of degree greater than $2$ for which the boundedness or not of the entries of the continued fraction has been determined.
︡567a68da-4934-4960-95ec-d259d586a592︡{"html":"<h3>An open problem</h3>\n\n<p><strong>Definition</strong> An <em>algebraic number</em> is any root of a polynomial with rational coefficients.</p>\n\n<p><strong>Open Problem</strong>  There is no example of an algebraic number of degree greater than $2$ for which the boundedness or not of the entries of the continued fraction has been determined.</p>\n"}︡
︠86366c1a-6d70-4f4a-b226-b85b1bf281a1︠
%time continued_fraction(2^(1/3), nterms=200)
︡cc0f3a75-2a44-4595-a29b-88d677813f24︡{"stdout":"[1, 3, 1, 5, 1, 1, 4, 1, 1, 8, 1, 14, 1, 10, 2, 1, 4, 12, 2, 3, 2, 1, 3, 4, 1, 1, 2, 14, 3, 12, 1, 15, 3, 1, 4, 534, 1, 1, 5, 1, 1, 121, 1, 2, 2, 4, 10, 3, 2, 2, 41, 1, 1, 1, 3, 7, 2, 2, 9, 4, 1, 3, 7, 6, 1, 1, 2, 2, 9, 3, 1, 1, 69, 4, 4, 5, 12, 1, 1, 5, 15, 1, 4, 1, 1, 1, 1, 1, 89, 1, 22, 186, 6, 2, 3, 1, 3, 2, 1, 1, 5, 1, 3, 1, 8, 9, 1, 26, 1, 7, 1, 18, 6, 1, 372, 3, 13, 1, 1, 14, 2, 2, 2, 1, 1, 4, 3, 2, 2, 1, 1, 9, 1, 6, 1, 38, 1, 2, 25, 1, 4, 2, 44, 1, 22, 2, 12, 11, 1, 1, 49, 2, 6, 8, 2, 3, 2, 1, 3, 5, 1, 1, 1, 3, 1, 2, 1, 2, 4, 1, 1, 3, 2, 1, 9, 4, 1, 4, 1, 2, 1, 27, 1, 1, 5, 5, 1, 3, 2, 1, 2, 2, 3, 1, 4, 2, 2, 8, 4, 1]"}︡{"stdout":"\n"}︡{"stdout":"CPU time: 0.01 s, Wall time: 0.01 s"}︡{"stdout":"\n"}︡
︠00845486-793d-478c-9cd7-cf37aa37c618︠
a = pari(923094820834/239402842031)
%timeit a.contfrac()
︡7ce6a4d7-35fd-40a6-811d-ff010474ac1c︡{"stdout":"625 loops, best of 3: 5.65 µs per loop"}︡{"stdout":"\n"}︡
︠e4226237-98fe-4f1f-8383-f664283365b9︠
a = 923094820834/239402842031
%timeit list(continued_fraction(a))
︡5799c301-3fd4-4c91-aba8-2e36aac3831e︡{"stdout":"625 loops, best of 3: 136 µs per loop"}︡{"stdout":"\n"}︡
︠7cc492f5-79c4-465a-a3f9-a2eb05501602︠
136/5.65
︡d767518c-56b5-4eeb-b648-0a275ec7d83e︡{"stdout":"24.0707964601770"}︡{"stdout":"\n"}︡
︠ba0c59cf-c280-4a35-bdd1-2bd6a7bcb007i︠
%md

### 2. Best rational approximation to a real number

 - The convergents two a continued fraction $[a_0, a_1, \ldots]$ are the rational numbers you get by simply truncating and evaluating.

 - These provide the "best possible" rational approximations to a real number.
︡ca05f6f6-dc1d-4a16-837c-d9f8568233dc︡{"html":"<h3>2. Best rational approximation to a real number</h3>\n\n<ul>\n<li><p>The convergents two a continued fraction $[a_0, a_1, \\ldots]$ are the rational numbers you get by simply truncating and evaluating.</p></li>\n<li><p>These provide the &#8220;best possible&#8221; rational approximations to a real number.</p></li>\n</ul>\n"}︡
︠8a5d4019-7f99-45fb-bbc5-1f762140ffe8︠
v = continued_fraction(pi,nterms=100); v
︡c129ea6a-c6ca-4a65-9ca9-f1221f41b8ad︡{"stdout":"[3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15, 3, 13, 1, 4, 2, 6, 6, 99, 1, 2, 2, 6, 3, 5, 1, 1, 6, 8, 1, 7, 1, 2, 3, 7, 1, 2, 1, 1, 12, 1, 1, 1, 3, 1, 1, 8, 1, 1, 2, 1, 6, 1, 1, 5, 2, 2, 3, 1, 2, 4, 4, 16, 1, 161, 45, 1, 22, 1, 2, 2, 1, 4, 1, 2, 24, 1, 2, 1, 3, 1, 2, 1, 1, 10]"}︡{"stdout":"\n"}︡
︠26443ddd-7ec4-4fc3-a008-395a5cb3d22b︠
v.convergents()
︡f36b9e2a-d985-4afb-a971-4b45b1bec5cf︡{"stdout":"[3, 22/7, 333/106, 355/113, 103993/33102, 104348/33215, 208341/66317, 312689/99532, 833719/265381, 1146408/364913, 4272943/1360120, 5419351/1725033, 80143857/25510582]"}︡{"stdout":"\n"}︡
︠55496eb5-12b3-45bf-94fb-c9f1ef9629f6︠
103993/33102.
︡2b313f45-633b-45d3-b956-5349a79b65d3︡{"stdout":"3.14159265301190"}︡{"stdout":"\n"}︡
︠c0e609d4-f301-47be-8532-fbe3a58f7274︠
355/113.0
︡f92f2160-9602-44f7-8f3b-1efa476f7f38︡{"stdout":"3.14159292035398"}︡{"stdout":"\n"}︡
︠21e9eb40-6f85-41ed-bd9b-33c3aa8ee3da︠
N(pi,digits=20)
︡cc04f765-2d5a-407f-9df0-a6ae3a30f720︡{"stdout":"3.1415926535897932385"}︡{"stdout":"\n"}︡
︠cd634264-269f-48ff-a8b4-6a058d169b0f︠
3 + 14159/100000
︡d5415efe-8134-41e3-9287-9d4c05edfbdf︡{"stdout":"314159/100000"}︡{"stdout":"\n"}︡
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
︠cf60445a-392d-4d88-a787-68be0f2f4bc0i︠
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






















