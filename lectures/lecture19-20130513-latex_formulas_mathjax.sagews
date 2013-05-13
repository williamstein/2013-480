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
︡059d4a4a-aed2-4f25-9440-c86f9fbfc159︡{"once":false,"file":{"show":true,"uuid":"81350bb3-3cde-42d3-b68b-36ebf40a990d","filename":"/tmp/tmpCiYLYf.png"}}︡
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
︠5cc1f2e1-cba0-4695-987a-f42ef0985099︠












