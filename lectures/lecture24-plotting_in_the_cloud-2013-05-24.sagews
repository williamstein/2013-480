︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%md

<div class="pull-right"><img src="http://sagemath.org/pix/sage_logo_new.png"></div>

## Lecture 24: 2D Plotting in the Sage Cloud

#### May 24, 2013

1. Remember to start G+ recorder

2. Topic: Plotting Graphics in the Sage Cloud

︡a3fc0c89-a288-4b97-bb1a-3c9ffb282cfe︡{"html":"<div class=\"pull-right\"><img src=\"http://sagemath.org/pix/sage_logo_new.png\"></div>\n\n<h2>Lecture 24: 2D Plotting in the Sage Cloud</h2>\n\n<h4>May 24, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Topic: Plotting Graphics in the Sage Cloud</p></li>\n</ol>\n"}︡
︠258cede7-5822-4d8c-ae51-ec4aa277d675i︠
%md

## 3 Topics

1. Mathematica-like 2d plotting -- standard plotting commands

2. MATLAB-like 2d plotting -- how to make matplotlib pylab plots



︡0278d89c-9b83-4b0b-86fe-37916c14f1a1︡{"html":"<h2>3 Topics</h2>\n\n<ol>\n<li><p>Mathematica-like 2d plotting &#8211; standard plotting commands</p></li>\n<li><p>MATLAB-like 2d plotting &#8211; how to make matplotlib pylab plots</p></li>\n</ol>\n"}︡
︠fda8d16a-c84c-4e49-989e-18a645293b36i︠
%md

## Standard 2d plotting commands


### Remarks

**Regarding SVG:**

SVG = scalable vector graphics = looks better than static images

I will often use the option `svg=True` to the show command, since it looks better.
However, there is a bug in some versions of Chrome were horizontal or vertical lines
will not show up.   If you leave off svg=True, you'll get a png file.

If you're using Sage (not in cloud.sagemath.com), make an svg using `g.save('a.svg')`.

**Regarding images in cloud.sagemath worksheets:**

Right now the rendered output images vanish after a few minutes.  This is because I haven't enabled longterm saveing of the images in the datbase.  I will do so soon, and then images will stay visible indefinitely.


︡bfdd9d06-ace8-4dda-8a7b-9d0c2ff04808︡{"html":"<h2>Standard 2d plotting commands</h2>\n\n<h3>Remarks</h3>\n\n<p><strong>Regarding SVG:</strong></p>\n\n<p>SVG = scalable vector graphics = looks better than static images</p>\n\n<p>I will often use the option <code>svg=True</code> to the show command, since it looks better.\nHowever, there is a bug in some versions of Chrome were horizontal or vertical lines\nwill not show up.   If you leave off svg=True, you&#8217;ll get a png file.</p>\n\n<p>If you&#8217;re using Sage (not in cloud.sagemath.com), make an svg using <code>g.save('a.svg')</code>.</p>\n\n<p><strong>Regarding images in cloud.sagemath worksheets:</strong></p>\n\n<p>Right now the rendered output images vanish after a few minutes.  This is because I haven&#8217;t enabled longterm saveing of the images in the datbase.  I will do so soon, and then images will stay visible indefinitely.</p>\n"}︡
︠567e8a67-c902-458e-8c03-54680c830e94︠
# see what is available:
sage.plot.all.   # [tab key]

︡64b4e650-1f21-4e48-8d34-1391d7d6868e︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"<string>\", line 1\n    sage.plot.all.\n                 ^\nSyntaxError: unexpected EOF while parsing\n"}︡
︠9ce95d6d-63c2-486e-a2d4-ed5251319ddf︠
# Plot a function
plot(sin(x^2), (x, 0, 3*pi)).show(svg=True, figsize=[8,2])
︡5be4824f-8aa1-459d-b758-0beeca808bcc︡{"file":{"show":true,"uuid":"34814c27-d8e9-4c13-a108-efd79e593b6d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_4GfSpZ.svg"}}︡
︠c7cc8cd6-0b44-49cb-9828-c14d61eddbaa︠
# Combine plot with @interact
@interact(layout=[['f','xmin', 'xmax'], ['frame', 'svg', 'gridlines'], ['color', 'thickness']])
def _(f = sin(x^2), xmin=-pi, xmax=2*pi, thickness=(0.5,.6,..,10),
      color=Color('blue'), gridlines=[True, False, 'minor'], frame=false, svg=True):
    g = plot(f, (x, xmin, xmax), thickness=thickness, color=color, gridlines=gridlines)
    g.show(svg=svg, frame=frame, figsize=[8,2])
︡b92426f9-f2eb-4213-a2d4-a4e7016055b1︡{"interact":{"style":"None","flicker":false,"layout":[[["f",4,null],["xmin",4,null],["xmax",4,null]],[["frame",4,null],["svg",4,null],["gridlines",4,null]],[["color",6,null],["thickness",6,null]],[["",12,null]]],"id":"2561a70a-cefc-4c39-b6b9-264bdad2cae3","controls":[{"control_type":"input-box","default":"sin(x^2)","label":"f","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"f","type":null},{"control_type":"input-box","default":"-pi","label":"xmin","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xmin","type":null},{"control_type":"input-box","default":"2*pi","label":"xmax","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xmax","type":null},{"control_type":"slider","default":0,"var":"thickness","width":null,"vals":["0.500000000000000","0.600000000000000","0.700000000000000","0.800000000000000","0.900000000000000","1.00000000000000","1.10000000000000","1.20000000000000","1.30000000000000","1.40000000000000","1.50000000000000","1.60000000000000","1.70000000000000","1.80000000000000","1.90000000000000","2.00000000000000","2.10000000000000","2.20000000000000","2.30000000000000","2.40000000000000","2.50000000000000","2.60000000000000","2.70000000000000","2.80000000000000","2.90000000000000","3.00000000000000","3.10000000000000","3.20000000000000","3.30000000000000","3.40000000000000","3.50000000000000","3.60000000000000","3.70000000000000","3.80000000000000","3.90000000000000","4.00000000000000","4.10000000000000","4.20000000000000","4.30000000000000","4.40000000000000","4.50000000000000","4.60000000000000","4.70000000000000","4.80000000000000","4.90000000000000","5.00000000000000","5.10000000000000","5.20000000000000","5.30000000000000","5.40000000000000","5.50000000000000","5.60000000000000","5.70000000000000","5.80000000000000","5.90000000000000","5.99999999999999","6.09999999999999","6.19999999999999","6.29999999999999","6.39999999999999","6.49999999999999","6.59999999999999","6.69999999999999","6.79999999999999","6.89999999999999","6.99999999999999","7.09999999999999","7.19999999999999","7.29999999999999","7.39999999999999","7.49999999999999","7.59999999999999","7.69999999999999","7.79999999999999","7.89999999999999","7.99999999999999","8.09999999999999","8.19999999999999","8.29999999999999","8.39999999999999","8.49999999999999","8.59999999999999","8.69999999999999","8.79999999999998","8.89999999999998","8.99999999999998","9.09999999999998","9.19999999999998","9.29999999999998","9.39999999999998","9.49999999999998","9.59999999999998","9.69999999999998","9.79999999999998","9.89999999999998","10.0000000000000"],"animate":true,"label":"thickness","display_value":true},{"widget":null,"control_type":"color-selector","hide_box":false,"Color":"<class 'sage.plot.colors.Color'>","label":"color","default":"#0000ff","readonly":false,"var":"color"},{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["True","False","minor"],"label":"gridlines","nrows":null,"width":null,"var":"gridlines"},{"default":false,"var":"frame","readonly":false,"control_type":"checkbox","label":"frame"},{"default":true,"var":"svg","readonly":false,"control_type":"checkbox","label":"svg"}]}}︡
︠ed4edf09-5861-4b8a-a156-b3434bdd3665︠
# Other plotting commands
[x for x in sorted(sage.plot.all.__dict__.keys()) if x[0] != '_']
︡124206aa-7077-4093-bd4c-17f49465ff47︡{"stdout":"['Color', 'Graphics', 'Tachyon', 'animate', 'arc', 'arrow', 'arrow2d', 'bar_chart', 'bezier_path', 'circle', 'colormaps', 'colors', 'complex_plot', 'contour_plot', 'density_plot', 'disk', 'ellipse', 'graphics_array', 'hue', 'hyperbolic_arc', 'hyperbolic_triangle', 'implicit_plot', 'is_Graphics', 'lazy_import', 'line', 'line2d', 'list_plot', 'list_plot_loglog', 'list_plot_semilogx', 'list_plot_semilogy', 'matrix_plot', 'parametric_plot', 'plot', 'plot_loglog', 'plot_semilogx', 'plot_semilogy', 'plot_slope_field', 'plot_step_function', 'plot_vector_field', 'point', 'point2d', 'points', 'polar_plot', 'polygon', 'polygon2d', 'rainbow', 'region_plot', 'scatter_plot', 'show_default', 'text']\n"}︡
︠a38309c5-fec4-4ebe-aba0-b9c188d8fd33︠
# Combine objects into a single plot using *addition*
g = arc((0,0), 1, sector=(pi/4,3*pi/4)) + arc((0,0), .8, sector=(pi/4,3*pi/4), color='green')
g.show(svg=True)
︡b5dc7869-4504-43f4-be56-f64bdfabc381︡{"file":{"show":true,"uuid":"5e0de46c-1fa0-47e9-b119-c89cdff02304","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_g8DveU.svg"}}︡
︠4ccea62f-4947-4ac1-8f76-89ea1bc5d3bd︠
# Let's make a rainbow ray!
g = sum( arc((0,0), r, sector=(pi/4,3*pi/4), color=hue(r), thickness=20) for r in (0.1,0.2,..,1))
g.show(svg=True, frame=True)
︡f5acf5da-dc54-4978-922b-d741fc2b6bb3︡{"file":{"show":true,"uuid":"24557e6b-bbe7-4a21-aaca-2c90db017c0d","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_Z_0uVE.svg"}}︡
︠992fad4b-0376-40e2-afac-74ebcd8f6437o︠
# The animate command lets you make... an animation.
%time
v = []
g = Graphics()
for r in (0.1,0.2, .., 1):
    g += arc((0,0), r, sector=(pi/4,3*pi/4), color=hue(r), thickness=20,
             ymin=0, ymax=1, xmin=-.7, xmax=.7, frame=True, axes=False)
    v.append(g)
A = animate(v)
A.save('/tmp/animation.gif')
salvus.file('/tmp/animation.gif')

︡24560c9f-fdba-4ed4-a695-4a91afe149e4︡{"file":{"show":true,"uuid":"382ad842-1e52-4f92-a5db-2ddc38f8edab","filename":"/tmp/animation.gif"}}︡{"stdout":"CPU time: 5.88 s, Wall time: 4.05 s\n"}︡
︠ff637e43-8da2-44e6-a2eb-bf8fe43f9cb6︠
arrow((0,0), (1,1)).show(svg=True)
︡701b322e-41cc-4196-aeb9-e40353f09e9c︡{"file":{"show":true,"uuid":"079d244a-f6ae-49ef-a8fe-5c32ce37f817","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_DyrR3Y.svg"}}︡
︠2a12ca5c-7912-4086-8240-9b75fa189f86︠
bar_chart([2,3,5,7,11]).show(svg=True)
︡5b4a18ce-b306-4595-a6e1-c2069f602017︡{"file":{"show":true,"uuid":"7ae98088-da6b-4240-b972-ab77790a12a5","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_PzuscY.svg"}}︡
︠06907e9a-7579-41b5-aae5-0a5d4f9f202d︠
path = [[(0,0),(.5,.1),(.75,3),(1,0)],[(.5,1),(.5,0)],[(.2,.5)]]
b = bezier_path(path, linestyle='dashed', rgbcolor='green', thickness=3)
b.show(svg=True, ymax=1.5)
︡d74fd9da-0aee-40ab-b395-44d118872556︡{"file":{"show":true,"uuid":"89dd27f4-dfe3-4bf0-93d9-1b3a6e4369a6","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_3GFOT1.svg"}}︡
︠6755f507-06e6-46c3-b721-7ca14bbeae75︠
# Draw circles

g = Graphics()
step=6; ocur=1/5; paths=16;
PI = math.pi    # numerical for speed -- fine for graphics
for r in (1..paths+1):
    for x,y in [((r+ocur)*math.cos(n), (r+ocur)*math.sin(n)) for n in srange(0, 2*PI+PI/step, PI/step)]:
        g += circle((x,y), ocur, rgbcolor=hue(r/paths), thickness=.5)
    rnext = (r+1)^2
    ocur = (rnext-r)-ocur

eps = paths
g.show(xmin=-(paths+1)^2-eps, xmax=(paths+1)^2+eps, ymin=-(paths+1)^2-eps, ymax=(paths+1)^2+eps,
       figsize=[4,4], svg=True, axes=False)
︡5997225e-85c4-4b7e-aa10-13d4e5245c58︡{"file":{"show":true,"uuid":"8e93aa5c-6d08-4d0e-926b-81ea66a46ea8","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_DejNR1.svg"}}︡
︠4259ec9e-18e2-469c-b81c-00fc45814bd4o︠
# Plot a function of a complex variable

f(z) = z^5 + z - 1 + 1/z
g1 = complex_plot(f, (-3, 3), (-3, 3))
g2 = complex_plot(zeta, (-30,30), (-30,30))
show(graphics_array([[g1, g2]]))
︡61144294-31d2-484a-b300-c1020231516d︡{"file":{"show":true,"uuid":"33de7012-2e1c-4798-9650-b321051f97ea","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_2gyeQd.png"}}︡
︠f0d96e67-15d3-4436-91a5-b9184797bdcd︠
%var x y

contour_plot(y^2 + 1 - x^3 - x, (x,-pi,pi), (y,-pi,pi), cmap='hsv')
︡ace631cf-ba54-4d79-9bbc-826062e2f4d6︡{"file":{"show":true,"uuid":"dce810cc-2a0b-46e8-9970-db5767e28bad","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_qZivtl.png"}}︡
︠5230f296-0034-446b-80cc-abf0e8cb5abb︠
contour_plot(x^2+y^2-1, (-2, 2), (-2, 2), contours=20, cmap='hsv')
︡392122e3-7f3e-49bb-aaa5-3ccc977361b0︡{"file":{"show":true,"uuid":"27777107-e803-4dc2-8ae1-60a237002009","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_2QN6MX.png"}}︡
︠60b2993b-4783-4eb2-a298-2c6fadb12677︠
# There is also an "implicit_plot" that builds on the contour_plot

%var x y
@interact(layout=[['eqn'], ['xmin','xmax','ymin','ymax']])
def _(eqn = cos(sin(y^2))==sin(x*y), xmin=-3, xmax=3, ymin=-3, ymax=3):
    g = implicit_plot(eqn, (xmin,xmax), (ymin, ymax))
    g.show(svg=True)
︡4220aab2-5252-47e2-b778-091e5b5f1f98︡{"interact":{"style":"None","flicker":false,"layout":[[["eqn",12,null]],[["xmin",3,null],["xmax",3,null],["ymin",3,null],["ymax",3,null]],[["",12,null]]],"id":"4008b6bf-e310-48a4-8917-30da6213b3e7","controls":[{"control_type":"input-box","default":"cos(sin(y^2)) == sin(x*y)","label":"eqn","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"eqn","type":null},{"control_type":"input-box","default":-3,"label":"xmin","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xmin","type":null},{"control_type":"input-box","default":3,"label":"xmax","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"xmax","type":null},{"control_type":"input-box","default":-3,"label":"ymin","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"ymin","type":null},{"control_type":"input-box","default":3,"label":"ymax","nrows":1,"width":null,"readonly":false,"submit_button":null,"var":"ymax","type":null}]}}︡
︠fb24b47e-6084-4052-bf78-70d716c72625︠
%md
## We got through "c"...
### There's more, including ellipse, line, list_Plot, matrix_plot, parametric_plot, plot_vector_field, points, region_plot, scatter_plot, text,  etc.
︡a66aa76a-0b67-4b7e-8b4f-6bb5dd582987︡{"html":"<h2>We got through &#8220;c&#8221;&#8230;</h2>\n\n<h3>There&#8217;s more, including ellipse, line, list_Plot, matrix_plot, parametric_plot, plot_vector_field, points, region_plot, scatter_plot, text,  etc.</h3>\n"}︡
︠97ba2ca5-a6ab-4ce3-8978-f94a08bb868f︠
g = text(r"$\sin(\pi/4) = \frac{\sqrt{2}}{2}$", (pi/4-.3,sin(pi/4)), fontsize=20, color='black')
g += plot(sin, (0,2))
g += point((pi/4, sin(pi/4)), pointsize=100, color='red', zorder=10)
g.show(svg=True)
︡2a6de90f-0613-4b0c-a0ff-c9d246ebbfbd︡{"file":{"show":true,"uuid":"73d1f69c-6abf-415c-a35a-17bc7f3201ee","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/3218/tmp_hGHZMZ.svg"}}︡
︠32d75d64-83f4-4b85-8836-3b3a7dbc2b0ci︠
%md

### 2d plotting in Sage uses [MatPlotLib](http://matplotlib.org/gallery.html).

**Motivation:** Matplotlib provides functions almost exactly like in MATLAB, which are designed for visualizing data (so for real-world applications).

But, you can't directly use the examples in Sage, without a tiny change to show them!

Here's how to get things to work.

For example, consider [this example](http://matplotlib.org/examples/pylab_examples/transoffset.html)

Here is it in Sage:


︡30d4e608-b6b7-422e-af5c-7aeea692c596︡{"html":"<h3>2d plotting in Sage uses <a href=\"http://matplotlib.org/gallery.html\">MatPlotLib</a>.</h3>\n\n<p><strong>Motivation:</strong> Matplotlib provides functions almost exactly like in MATLAB, which are designed for visualizing data (so for real-world applications). </p>\n\n<p>But, you can&#8217;t directly use the examples in Sage, without a tiny change to show them!</p>\n\n<p>Here&#8217;s how to get things to work.</p>\n\n<p>For example, consider <a href=\"http://matplotlib.org/examples/pylab_examples/transoffset.html\">this example</a></p>\n\n<p>Here is it in Sage:</p>\n"}︡
︠cdf2cb85-c5d7-4f6f-9165-112ab9d4bc93︠
# See http://matplotlib.org/examples/pylab_examples/transoffset.html
import pylab as P
from matplotlib.transforms import offset_copy

X = P.arange(7)
Y = X**2

fig = P.figure(figsize=(5,10))
ax = P.subplot(2,1,1)

# If we want the same offset for each text instance,
# we only need to make one transform.  To get the
# transform argument to offset_copy, we need to make the axes
# first; the subplot command above is one way to do this.

transOffset = offset_copy(ax.transData, fig=fig,
                            x = 0.05, y=0.10, units='inches')

for x, y in zip(X, Y):
    P.plot((x,),(y,), 'ro')
    P.text(x, y, '%d, %d' % (int(x),int(y)), transform=transOffset)


# offset_copy works for polar plots also.

ax = P.subplot(2,1,2, polar=True)

transOffset = offset_copy(ax.transData, fig=fig, y = 6, units='dots')

for x, y in zip(X, Y):
    P.polar((x,),(y,), 'ro')
    P.text(x, y, '%d, %d' % (int(x),int(y)),
                transform=transOffset,
                horizontalalignment='center',
                verticalalignment='bottom')

# Instead of... "P.show()"
P.savefig('/tmp/a.svg')
salvus.file('/tmp/a.svg')
︡9403b9ba-49d7-427a-a063-a7b345c92f04︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7dd23d0>]\n<matplotlib.text.Text object at 0x7dd27d0>\n[<matplotlib.lines.Line2D object at 0x7dd2690>]\n<matplotlib.text.Text object at 0x7dd2790>\n[<matplotlib.lines.Line2D object at 0x7dd2050>]\n<matplotlib.text.Text object at 0xaa575d0>\n[<matplotlib.lines.Line2D object at 0xaa576d0>]\n<matplotlib.text.Text object at 0xaa57050>\n[<matplotlib.lines.Line2D object at 0xaa57310>]\n<matplotlib.text.Text object at 0xaa57710>\n[<matplotlib.lines.Line2D object at 0xaa4b210>]\n<matplotlib.text.Text object at 0xaa4bc90>\n[<matplotlib.lines.Line2D object at 0xaa4b990>]\n<matplotlib.text.Text object at 0xaa4bdd0>\n[<matplotlib.lines.Line2D object at 0x78cc9d0>]\n<matplotlib.text.Text object at 0x78ccb90>\n[<matplotlib.lines.Line2D object at 0x78ccd50>]\n<matplotlib.text.Text object at 0x7dfea90>\n[<matplotlib.lines.Line2D object at 0x7dfe210>]\n<matplotlib.text.Text object at 0x7dfe3d0>\n[<matplotlib.lines.Line2D object at 0x7dfea50>]\n<matplotlib.text.Text object at 0x7dfe4d0>\n[<matplotlib.lines.Line2D object at 0xa1fb450>]\n<matplotlib.text.Text object at 0xa1f9bd0>\n[<matplotlib.lines.Line2D object at 0xa45c7d0>]\n<matplotlib.text.Text object at 0xa44a110>\n[<matplotlib.lines.Line2D object at 0xa48e090>]\n<matplotlib.text.Text object at 0xa48ee10>\n"}︡{"file":{"show":true,"uuid":"5c384575-e088-4466-8430-5db5c9f4a42d","filename":"/tmp/a.svg"}}︡
︠56874ea5-9c7e-4a46-a86e-63c86ffe47aci︠
%md
## Sage development project idea...

Make it so every one of [these example](http://matplotlib.org/gallery.html) works in Sage with *exactly* the input given there.   There is no reason why `P.show()` couldn't be made to "just work" in <https://cloud.sagemath.com>, it just hasn't been done yet.

**Bonus points:** enable click to zoom, etc. -- this might even be fairly easy, building on something like <https://code.google.com/p/mplh5canvas/> or maybe using <http://d3js.org/> (?).

︡b2894b86-d60a-4b65-99a3-b6b671ca52c1︡{"html":"<h2>Sage development project idea&#8230;</h2>\n\n<p>Make it so every one of <a href=\"http://matplotlib.org/gallery.html\">these example</a> works in Sage with <em>exactly</em> the input given there.   There is no reason why <code>P.show()</code> couldn&#8217;t be made to &#8220;just work&#8221; in <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a>, it just hasn&#8217;t been done yet.</p>\n\n<p><strong>Bonus points:</strong> enable click to zoom, etc. &#8211; this might even be fairly easy, building on something like <a href=\"https://code.google.com/p/mplh5canvas/\">https://code.google.com/p/mplh5canvas/</a> or maybe using <a href=\"http://d3js.org/\">http://d3js.org/</a> (?).</p>\n"}︡
︠d71df173-d0cd-4329-a1b5-7978c8f3e094︠
︡62349756-4159-4573-a8a2-1aa9dc1ba1ce︡
︠2b0ab37e-5cf2-45bb-ac2f-0dbbd68e0580︠






































