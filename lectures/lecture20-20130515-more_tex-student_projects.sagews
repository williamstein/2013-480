︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%hide
%md

# Lecture 20: Finish "Mathematical Formulas Using LaTeX and MathJax"; student projects

#### May 15, 2013

1. Remember to start G+ recorder

2. You should have received an email with your grades.

3. Questions?

4. Learn about embedding mathematical formulas

5. Student projects


︡29e954b4-00d9-4c32-ae36-e14f9c182bd8︡{"html":"<h1>Lecture 20: Finish &#8220;Mathematical Formulas Using LaTeX and MathJax&#8221;; student projects</h1>\n\n<h4>May 15, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>You should have received an email with your grades.</p></li>\n<li><p>Questions?</p></li>\n<li><p>Learn about embedding mathematical formulas</p></li>\n<li><p>Student projects</p></li>\n</ol>\n"}︡
︠d7e4c991-d1ad-4754-b4b0-d9cf6c08e62f︠
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
At least you can make png images using %latex with Sage, and include them in a git repo...

- Various pages on the internet that let users include content may or may just work with math formulas typeset in dollar signs.  For example <http://mathoverflow.net/> works for formulas in the content (though maybe not in the titles).

- The chat in cloud.sagemath supports math formulas... (but doesn't support chatting with anybody else yet!)



︡c0294353-91c2-493e-b280-46f1a18ee1b4︡{"html":"<ul>\n<li><p>Github: nope.  It seems pretty much impossible to put mathjax in the github pages you browse (e.g., their wiki or md files).  There are security issues.\nAt least you can make png images using %latex with Sage, and include them in a git repo&#8230;</p></li>\n<li><p>Various pages on the internet that let users include content may or may just work with math formulas typeset in dollar signs.  For example <a href=\"http://mathoverflow.net/\">http://mathoverflow.net/</a> works for formulas in the content (though maybe not in the titles).</p></li>\n<li><p>The chat in cloud.sagemath supports math formulas&#8230; (but doesn&#8217;t support chatting with anybody else yet!)</p></li>\n</ul>\n"}︡

︠67b9eedc-a4a3-4fa7-8782-3a0239b8ad64︠

email('wstein@gmail.com', 'My thesis is done!', 'The answer is 42.', 'chenh123@uw.edu')

︡ff07ede4-1f56-4919-b790-4168c710423a︡{"stdout":"Child process 18400 is sending email to wstein@gmail.com...\n"}︡{"stdout":"Successfully sent an email to wstein@gmail.com."}︡
︠776a6baf-f6ac-4352-9ad9-cafeb8b0d6e6︠
%md

A Live Sage Development Example:x

    <http://trac.sagemath.org/sage_trac/ticket/14587>

︡2fa656de-39ad-4637-98ee-d982f784dd07︡{"html":"<p>A Live Sage Dev21epment Example:</p>\n\n<pre><code>&lt;http:"}︡{"stdout":"Successfully sent an email to wstein@gmail.com.//t}︡
︠ea21376e-8a9a-4876-a223-3739dfd74c4f︠
%md
# Student projects

Go around room and briefly describe each (take notes here).  Clusters/groups?


---


 - Kippy: musical tempered scale.  make your own musical scale.

 - Dwight & Tannor: logic.py file (beginner sage tickets).

 - Jessica: logic as well (maybe group of 3)

 - Taylor & James: thin SVD (remove some columns); something new

 - Clara: Sage graphs using "real world" data.

 - Mary & Rebecca : 2d polygon class, intersections, areas, etc.; done currently by the Sage Polyhedral class.  Improve documentation.

 - Andrea: Simplex algorithm for optimization.   (cvxopt package; always give inputs like float(2.3) rather than 2.3; or put percent "python")

 - Mark: raw data; updating transitional matrix.  markov process.  (see stats.hmm)

 - Jose: Construct Billera-Lee polytopes (for Ph.D. research) using combination of Sage and polymake... but Sage has a lot hidden for this.

 - Hon, Hao, Wu, Qian:
      (1) challenge problem -- pos integer in binary; put + digits in
          compute sum, get another binary number.  Is there a number
          c so that any number goes to 1 in at most c steps.
      (2) computing Fermat points -- m points in R^d; find one point
          so that the sum of the distance to the m points is minimized.
          Three algorithms to solve... which is best.
          Use cvxopt to implement one of them.

 - Josh: implement elliptic curve cryptosystem... Diffie-Hellman.
   Koblitz book on this.

 - Tian Yu: Sage/Python <---> statistics data.
   Given a bunch of data, you give feedback.
     Consider http://statsmodels.sourceforge.net/ which is coming
     to cloud.sagemath.com soon...

 - Brian & Mellisa: simplex algorithm, min/max; TUTORIAL. Graphically
   visualize each step.
      show(icosahedron())

 - Sean & Alex & Daae: game of GO AI;   human versus computer.

 - Gary: optimization.  Making some functionality of cvxopt more user friendly...

 - Trevor: exploring `golden_ratio`

 - Jasper: AI engine for 2-player game... implement n x m tic-tac-toe *and* obstacles.  Find the best move...  



︠cced84bb-7c40-4e2a-9afa-a78c5d2500a3︠
N(golden_ratio, 100)
︡b3eefc0e-3cdf-40b9-941d-55707b56fdfc︡{"stdout":"1.6180339887498948482045868344\n"}︡

︠676fd3ef-30f4-4135-83b4-30af3d2fa77b︠


︠e49356c5-a1c8-4cd0-9eac-ac23098a6c71︠

var('x,y')

3*x <= 2*y + 2
︡91c3540a-b1a1-4095-a24b-825f37b78a66︡{"stdout":"(x, y)\n3*x <= 2*y + 2\n"}︡
︠9c700dea-d3ba-4511-8315-db137e10fdf3︠
type(x<y)
︡f3285f87-5cd5-41ad-9386-a990c87c29ef︡{"stdout":"<type 'sage.symbolic.expression.Expression'>\n"}︡
︠c1984868-6157-4053-8d9a-fda665d8a7dc︠














︠8a511988-f873-4dfc-8bb4-20de011b7f57︠

show(icosahedron())

︡7fce70fb-0b1a-48b1-a228-0bb276296a60︡{"file":{"show":true,"uuid":"bd397595-cca1-496f-b684-6eb53b6e3522","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/18006/tmp_61o9kN.png"}}︡
︠27931fb2-bbb4-4486-9dcf-6197aec7f4cci︠
# Student Projects

Go around room and describe them. Clusters?

 -






