︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md

# Lecture 19: Mathematical Formulas Using LaTeX and MathJax

#### May 13, 2013

1. Remember to start G+ recorder

2. Questions?

3. Learn about mathematical formulas

<br>
<img src="http://www.mathjax.org/wp-content/themes/mathjax/images/logo.gif">
︡545fcc13-5313-42f4-ad33-f9987acd6632︡{"html":"<h1>Lecture 19: Mathematical Formulas Using LaTeX and MathJax</h1>\n\n<h4>May 13, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Questions?</p></li>\n<li><p>Learn about mathematical formulas</p></li>\n</ol>\n\n<p><br>\n<img src=\"http://www.mathjax.org/wp-content/themes/mathjax/images/logo.gif\"></p>\n"}︡
︠de1760d8-f84e-4b19-b528-27dd8f5426aai︠
%md
## Goals:

1. Basics of typesetting mathematical expressions using ${\rm \LaTeX}$.

2. How to embed ${\rm\LaTeX}$ in websites using MathJax <http://www.mathjax.org/>.
︡6455218b-7439-4c82-9bd0-f20ba297a189︡{"html":"<h2>Goals:</h2>\n\n<ol>\n<li><p>Basics of typesetting mathematical expressions using ${\\rm \\LaTeX}$.</p></li>\n<li><p>How to embed ${\\rm\\LaTeX}$ in websites using MathJax <a href=\"http://www.mathjax.org/\">http://www.mathjax.org/</a>.</p></li>\n</ol>\n"}︡
︠c79b8535-acc0-4894-834f-450df08a8f66i︠
%md
## Typesetting mathematical expressions using ${\rm \LaTeX}$

**Motivation:** The Latex language for typesetting mathematical expressions is the *de facto* standard, which is used nearly everywhere.   And it looks very good.

**Interactive Latex Expression Editor?:** Sorry, but I don't know of any good interactive web-based equation editor that produces LaTeX yet.  I would like to write one or mentor/hire somebody to do so.  See [this list](http://stackoverflow.com/questions/7433540/embeddable-wysiwyg-equation-editor).


︡d314e579-d7cd-4036-8d7a-410212c8e4ec︡{"html":"<h2>Typesetting mathematical expressions using ${\\rm \\LaTeX}$</h2>\n\n<p><strong>Motivation:</strong> The Latex language for typesetting mathematical expressions is the <em>de facto</em> standard, which is used nearly everywhere.   And it looks very good.</p>\n\n<p><strong>Interactive Latex Expression Editor?:</strong> Sorry, but I don&#8217;t know of any good interactive web-based equation editor that produces LaTeX yet.  I would like to write one or mentor/hire somebody to do so.  See <a href=\"http://stackoverflow.com/questions/7433540/embeddable-wysiwyg-equation-editor\">this list</a>.</p>\n"}︡
︠84945cf2-85c9-41fd-aa79-739dec70ca1ei︠
%md
### You can typeset LaTeX expressions in Sage interactively in a few ways...

For example:
︡4e80a4bf-63a3-4b98-a348-1f3be2ef7efe︡{"html":"<h3>You can typeset LaTeX expressions in Sage interactively in a few ways&#8230;</h3>\n\n<p>For example:</p>\n"}︡
︠6054dd82-71e0-4289-8ac9-97b37575c210︠
# The latex cell mode typesets the rest of the cell as if it were in the
# body of a latex document.  The result is a PNG image.
%latex
Consider $\alpha = \frac{2}{3}$.
Then consider $$\int_{0}^{3} x^3 dx.$$
︡48fe8582-23df-44f5-8569-cac6a8dc0043︡{"once":false,"file":{"show":true,"uuid":"81350bb3-3cde-42d3-b68b-36ebf40a990d","filename":"/tmp/tmpaBTE3P.png"}}︡
︠059e4f34-fb14-4e59-be5a-31581d7ee13b︠
# In html mode, anything in dollar signs is typeset inline,
# and anything in double-dollar signs is displayed.
%html
Consider $\alpha = \frac{2}{3}$.
Then <span style="color:red">consider</span>$$\int_{0}^{3} x^3 dx.$$
︡f3005507-3b24-400f-9e4d-975180f0afbc︡{"html":"Consider $\\alpha = \\frac{2}{3}$.\nThen <span style=\"color:red\">consider</span>$$\\int_{0}^{3} x^3 dx.$$"}︡
︠b085724a-9f34-4930-8281-49ce60cbe0a2︠


︠24e7dc98-b6eb-45df-98cc-69ac24a70eb2i︠
%md
#### You can get a LaTeX representation of any mathematical object in Sage using the latex command.

For example:
︡006d8bdf-f407-4b01-87c3-27054eededbe︡{"html":"<h4>You can get a LaTeX representation of any mathematical object in Sage using the latex command.</h4>\n\n<p>For example:</p>\n"}︡
︠52927522-e077-4511-96f3-260b475a9e32︠
latex(2/3)
︡a54befdd-ea15-425a-b84a-f50aceccd0e3︡{"stdout":"\\frac{2}{3}\n"}︡
︠a60f216d-203a-4659-ba2c-2da16c8341ee︠
a = random_matrix(QQ,3)^3
latex(a)
︡e5e8b45d-2115-4f44-82f4-177e08a1a616︡{"stdout":"\\left(\\begin{array}{rrr}\n\\frac{3}{8} & \\frac{1}{2} & -\\frac{17}{2} \\\\\n\\frac{29}{8} & \\frac{1}{2} & -\\frac{15}{2} \\\\\n\\frac{67}{8} & 2 & -\\frac{11}{2}\n\\end{array}\\right)\n"}︡
︠12ceaca7-911e-4f3d-a107-6d58a7e5ba30︠
%html
Consider the matrix
$$
a = \left(\begin{array}{rrr}
\frac{3}{8} & \frac{1}{2} & -\frac{17}{2} \\
\frac{29}{8} & \frac{1}{2} & -\frac{15}{2} \\
\frac{67}{8} & 2 & -\frac{11}{2}
\end{array}\right)
$$
︡41c5e961-0394-43ec-8e94-5dcf7ab5628f︡{"html":"Consider the matrix\n$$\na = \\left(\\begin{array}{rrr}\n\\frac{3}{8} & \\frac{1}{2} & -\\frac{17}{2} \\\\\n\\frac{29}{8} & \\frac{1}{2} & -\\frac{15}{2} \\\\\n\\frac{67}{8} & 2 & -\\frac{11}{2}\n\\end{array}\\right)\n$$"}︡
︠1e65a8df-c6c4-4c71-926b-ad6e3be8c044︠
q = var('q')
f = integrate(sin(q)*tan(q), q)
latex(f)
︡52258d74-4e05-4a98-86a1-e180b20217b0︡{"stdout":"-\\frac{1}{2} \\, \\log\\left(\\sin\\left(q\\right) - 1\\right) + \\frac{1}{2} \\, \\log\\left(\\sin\\left(q\\right) + 1\\right) - \\sin\\left(q\\right)\n"}︡
︠de19bf44-0b4e-4c37-88e7-84023cf38d32︠
%html
We have
$$\int \sin(q)\tan(q) = -\frac{1}{2} \, \log\left(\sin\left(q\right) - 1\right) + \frac{1}{2} \, \log\left(\sin\left(q\right) + 1\right) - \sin\left(q\right) + c$$
︡3c504aaf-481f-4e3b-8cff-32bd86441ebf︡{"html":"We have\n$$\\int \\sin(q)\\tan(q) = -\\frac{1}{2} \\, \\log\\left(\\sin\\left(q\\right) - 1\\right) + \\frac{1}{2} \\, \\log\\left(\\sin\\left(q\\right) + 1\\right) - \\sin\\left(q\\right) + c$$"}︡
︠c01f50d1-8f1b-4e7c-842c-5e06b12eb868︠
latex(continued_fraction(e))
︡33b5d079-8fd3-4213-8ffd-830a7f54f574︡{"stdout":"2+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 2+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 4+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 6+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 8+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 10+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 12+ \\frac{\\displaystyle 1}{\\displaystyle 1+ \\frac{\\displaystyle 1}{\\displaystyle 1}}}}}}}}}}}}}}}}}}}\n"}︡
︠fc38823e-c2de-4ee4-ad12-f670020ae580︠
# NOTE: You can use the latex command in latex mode:

a = matrix(2,2,[e,pi,sqrt(2),2/3])

%latex
If $a=\sage{latex(a)}$, then $$a^2 = \sage{latex(a^2)}.$$
︡f8f2ceb7-8054-4317-a066-4d8d472d9193︡{"once":false,"file":{"show":true,"uuid":"d443496a-67a7-4f3a-bd70-dfa395107e5f","filename":"/tmp/tmpyYqOtM.png"}}︡
︠e9a2969d-5e7d-4ed9-abef-7a5ef14a1521︠
# NOTE: Unfortunately, \sage is NOT implemented for html mode *yet*...
%html
Consider $\sage{2+2}$.
︡27d413b5-c975-48b6-8b2d-c58dffd99cba︡{"html":"Consider $\\sage{2+2}$."}︡
︠5cc1f2e1-cba0-4695-987a-f42ef0985099i︠

%md

### Crash course in typesetting formulas (part 1)

The following is most of what you need to know to make almost any latex expression you want.

- Use backslash followed by standard function or symbol names, e.g., `\sin`, `\alpha`, etc.   There are big tables of symbols that you can find online, and often you can guess them.  Example: `A \rightarrow B` gives $A \rightarrow B$.

- Any sequence of characters without backslash before them means "multiplying the variables", e.g. `$abc$` means "a times b times c".

- Group expressions using braces.

- Typeset braces using `\{` and `\}`.

- Use ^ for exponent and underscore for a subscript: `a_{5+i}^3` --> $a_5^3$

- Use \int to make an integral sign (and \sum for a summation):  `\int_2^3 \sin(x^2) dx` --> $\int_2^3 \sin(x^2) dx$

- Use \frac{numerator expression}{denominator expression} to make a fraction: `\frac{\int_2^3 x^3}{\sin(\alpha x)}` --> $\displaystyle \frac{\int_2^3 x^3}{\sin(\alpha x)}$

︡10113e2e-89ec-4c7f-b001-df402d5807e2︡{"html":"<h3>Crash course in typesetting formulas (part 1)</h3>\n\n<p>The following is most of what you need to know to make almost any latex expression you want.</p>\n\n<ul>\n<li><p>Use backslash followed by standard function or symbol names, e.g., <code>\\sin</code>, <code>\\alpha</code>, etc.   There are big tables of symbols that you can find online, and often you can guess them.  Example: <code>A \\rightarrow B</code> gives $A \\rightarrow B$.</p></li>\n<li><p>Any sequence of characters without backslash before them means &#8220;multiplying the variables&#8221;, e.g. <code>$abc$</code> means &#8220;a times b times c&#8221;.</p></li>\n<li><p>Group expressions using braces.</p></li>\n<li><p>Typeset braces using <code>\\{</code> and <code>\\}</code>.</p></li>\n<li><p>Use ^ for exponent and underscore for a subscript: <code>a_{5+i}^3</code> &#8211;> $a_5^3$</p></li>\n<li><p>Use \\int to make an integral sign (and \\sum for a summation):  <code>\\int_2^3 \\sin(x^2) dx</code> &#8211;> $\\int_2^3 \\sin(x^2) dx$</p></li>\n<li><p>Use \\frac{numerator expression}{denominator expression} to make a fraction: <code>\\frac{\\int_2^3 x^3}{\\sin(\\alpha x)}</code> &#8211;> $\\displaystyle \\frac{\\int_2^3 x^3}{\\sin(\\alpha x)}$</p></li>\n</ul>\n"}︡
︠382f319a-f111-4321-b14e-739c6635cb9bi︠
%md
### Crash course (part 2)

- Typeset black board bold like this: `\mathbb{R}^3` --> $\mathbb{R}^3$

- Typeset text inside math like this: `\{\text{ all sets }\}` --> $\\{\text{ all sets }\\}$

- Size: make correctly sized parenthesis, braces, etc., using `\left` and `\right`:  `\sum_{a=3}^{10} \left( \frac{2a}{3} + \frac{4}{5a} \right)`
$$\sum_{a=3}^{10} \left( \frac{2a}{3} + \frac{4}{5a} \right)$$

- Matrics (modify the output of latex(a matrix) from sage).

- Awesome Commutative diagrams -- use [xymatrix](http://www.jmilne.org/not/Mxymatrix.pdf), which works in cloud.sagemath and is a LaTeX package for a .tex file.
$$\begin{xy}
\xymatrix{
T \ar@/_/[ddr]_y \ar@/^/[drr]^x \ar@{.>}[dr]|-{(x,y)}\\\\     % NOTE! it's \\\\ instead of \\ here because of markdown.
&X \times_Z Y \ar[d]^q \ar[r]_p & X\ar[d]_f \\\\
&Y \ar[r]^g &Z}
\end{xy}
$$
︡8a98ffbc-d95b-4caa-8dbf-3b23f28c5109︡{"html":"<h3>Crash course (part 2)</h3>\n\n<ul>\n<li><p>Typeset black board bold like this: <code>\\mathbb{R}^3</code> &#8211;> $\\mathbb{R}^3$</p></li>\n<li><p>Typeset text inside math like this: <code>\\{\\text{ all sets }\\}</code> &#8211;> $\\{\\text{ all sets }\\}$</p></li>\n<li><p>Size: make correctly sized parenthesis, braces, etc., using <code>\\left</code> and <code>\\right</code>:  <code>\\sum_{a=3}^{10} \\left( \\frac{2a}{3} + \\frac{4}{5a} \\right)</code>\n$$\\sum_{a=3}^{10} \\left( \\frac{2a}{3} + \\frac{4}{5a} \\right)$$</p></li>\n<li><p>Matrics (modify the output of latex(a matrix) from sage).</p></li>\n<li><p>Awesome Commutative diagrams &#8211; use <a href=\"http://www.jmilne.org/not/Mxymatrix.pdf\">xymatrix</a>, which works in cloud.sagemath and is a LaTeX package for a .tex file.\n$$\\begin{xy}\n\\xymatrix{\nT \\ar@/_/[ddr]_y \\ar@/^/[drr]^x \\ar@{.&gt;}[dr]|-{(x,y)}\\\\     % NOTE! it&#8217;s \\\\ instead of \\ here because of markdown.\n&amp;X \\times_Z Y \\ar[d]^q \\ar[r]_p &amp; X\\ar[d]_f \\\\\n&amp;Y \\ar[r]^g &amp;Z}\n\\end{xy}\n$$</p></li>\n</ul>\n"}︡
︠f6b40f6b-f3ba-459f-8e7e-229cb115bd67︠
html(r"<h3>Typeset an expression using ${\rm\LaTeX}$</h3>")
@interact(layout=[[('f',11)],
                  [('x',3),('',6)]])
def typeset(f=("Formula ", r'\begin{xy} \xymatrix{ T \ar@/_/[ddr]_y \ar@/^/[drr]^x \ar@{.>}[dr]|-{(x,y)}\\ &X \times_Z Y \ar[d]^q \ar[r]_p & X\ar[d]_f \\ &Y \ar[r]^g &Z} \end{xy}')):
    html("$$%s$$"%f)
︡5de8fa41-32d5-4166-b538-32e5a62003ab︡{"html":"<h3>Typeset an expression using ${\\rm\\LaTeX}$</h3>"}︡{"interact":{"style":"None","flicker":false,"layout":[[["f",11,null]],[["x",3,null],["",6,null]]],"id":"6bdc28d5-9795-4360-8463-c32629f1fb2b","controls":[{"control_type":"input-box","default":"\\begin{xy} \\xymatrix{ T \\ar@/_/[ddr]_y \\ar@/^/[drr]^x \\ar@{.>}[dr]|-{(x,y)}\\\\ &X \\times_Z Y \\ar[d]^q \\ar[r]_p & X\\ar[d]_f \\\\ &Y \\ar[r]^g &Z} \\end{xy}","label":"Formula ","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":"<type 'str'>"}]}}︡
︠4b5c0304-df33-449e-9256-a47994576ba9i︠
%hide
%md
### Putting LaTeX in your webpages.

 - For your own static html webpage, which you control, you can put this at the top, then just put math in dollars all over your page.   See <http://wstein.org/misc/20130513.html>.

︡1f74aeda-f772-4e7f-8113-c6da916ae8cb︡{"html":"<h3>Putting LaTeX in your webpages.</h3>\n\n<ul>\n<li>For your own static html webpage, which you control, you can put this at the top, then just put math in dollars all over your page.   See <a href=\"http://wstein.org/misc/20130513.html\">http://wstein.org/misc/20130513.html</a>.</li>\n</ul>\n"}︡
︠4bc89919-e058-4cbd-9a18-35cca9f17589︠
%html
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
<script type="text/javascript"
    src="https://c328740.ssl.cf1.rackcdn.com/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
︠e69323f0-e001-48cb-b7ae-05830d5ae6f0i︠
%md

- Github: nope.  It seems pretty much impossible to put mathjax in the github pages you browse (e.g., their wiki or md files).  There are security issues.

- Various pages on the internet that let users include content may or may just work with math formulas typeset in dollar signs.  For example <http://mathoverflow.net/> works for formulas in the content (though maybe not in the titles).

- The chat in cloud.sagemath supports math formulas... (but doesn't support chatting with anybody else yet!)






︡9291cb51-7c1c-4a5b-bd95-966f4c741028︡{"html":"<ul>\n<li><p>Github: nope.  It seems pretty much impossible to put mathjax in the github pages you browse (e.g., their wiki or md files).  There are security issues.</p></li>\n<li><p>Various pages on the internet that let users include content may or may just work with math formulas typeset in dollar signs.  For example <a href=\"http://mathoverflow.net/\">http://mathoverflow.net/</a> works for formulas in the content (though maybe not in the titles).</p></li>\n<li><p>The chat in cloud.sagemath supports math formulas&#8230; (but doesn&#8217;t support chatting with anybody else yet!)</p></li>\n</ul>\n"}︡
︠27931fb2-bbb4-4486-9dcf-6197aec7f4cc︠















