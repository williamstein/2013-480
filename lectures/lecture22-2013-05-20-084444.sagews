︠10ea4cc3-f10d-4cad-b2c7-cbf74aa9d1aai︠
%hide
%md

## Lecture 22: Hidden Markov Models with Sage

#### May 20, 2013

1. Remember to start G+ recorder

2. Questions?  Reminder: homework and office hours.

3. Topic: Hidden Markov Models in Sage

**Remarks:**

 - If you do development on Sage with [cloud](https://cloud.sagemath.com), just extract Sage in your home directory.  I've disabled quotas and am fine with people creating 4-5GB of data in a project.

 - Rest of class will involve *surprise* single lecture introductions to various computational capabilities of Sage.  Then final project presentations (June 3-7!!!).  So work hard on your final projects now.  You'll be done June 7.

︡f7f3db38-e848-4b3c-b129-93428ca88d1e︡{"html":"<h2>Lecture 22: Hidden Markov Models with Sage</h2>\n\n<h4>May 20, 2013</h4>\n\n<ol>\n<li><p>Remember to start G+ recorder</p></li>\n<li><p>Questions?  Reminder: homework and office hours.</p></li>\n<li><p>Topic: Hidden Markov Models in Sage</p></li>\n</ol>\n\n<p><strong>Remarks:</strong></p>\n\n<ul>\n<li><p>If you do development on Sage with <a href=\"https://cloud.sagemath.com\">cloud</a>, just extract Sage in your home directory.  I&#8217;ve disabled quotas and am fine with people creating 4-5GB of data in a project.</p></li>\n<li><p>Rest of class will involve <em>surprise</em> single lecture introductions to various computational capabilities of Sage.  Then final project presentations (June 3-7!!!).  So work hard on your final projects now.  You&#8217;ll be done June 7.</p></li>\n</ul>\n"}︡
︠4aaf550c-9ea9-4de0-b98d-26f4916910b6i︠
%md
## A Model

Systems often behave somewhat randomly, but dictated by a state.  For example, a person might have a few states, and they might utter one of the listed phrases:

  - <i class="icon-ellipsis-horizontal"></i> **asleep:** 'must sleep', 'zzz'

  - <i class="icon-frown"></i> **morning, before drinking coffee:** 'good morning', 'must sleep'

  - <i class="icon-smile"></i> **morning, right after drinking coffee:** 'good morning', 'awesome!', 'ha ha'

  - <i class="icon-meh"></i> **afternoon, right after eating lunch** 'must sleep', 'ha ha'

Using a Markov Model we can simulate such a person as follows:

 - 4 states as above

 - probabilities of uttering each phrase (let's just make them equally likely)

 - probabilities to transition from any one state to another (every 10 minutes):
     - morning --> morning (stay there): 70%
     - morning --> coffee: 25%
     - morning --> asleep: 5%
     - coffee --> coffee (stay there): 95%
     - coffee --> lunch: 5%
     - lunch --> lunch (stay there): 97%
     - lunch --> sleep: 3%
     - sleep -> sleep: 97%
     - sleep --> morning: 3%
︡b2436723-3cc4-41c0-96c4-f12a5e83a99e︡{"html":"<h2>A Model</h2>\n\n<p>Systems often behave somewhat randomly, but dictated by a state.  For example, a person might have a few states, and they might utter one of the listed phrases:</p>\n\n<ul>\n<li><p><i class=\"icon-ellipsis-horizontal\"></i> <strong>asleep:</strong> &#8216;must sleep&#8217;, &#8216;zzz&#8217;</p></li>\n<li><p><i class=\"icon-frown\"></i> <strong>morning, before drinking coffee:</strong> &#8216;good morning&#8217;, &#8216;must sleep&#8217;</p></li>\n<li><p><i class=\"icon-smile\"></i> <strong>morning, right after drinking coffee:</strong> &#8216;good morning&#8217;, &#8216;awesome!&#8217;, &#8216;ha ha&#8217;</p></li>\n<li><p><i class=\"icon-meh\"></i> <strong>afternoon, right after eating lunch</strong> &#8216;must sleep&#8217;, &#8216;ha ha&#8217;</p></li>\n</ul>\n\n<p>Using a Markov Model we can simulate such a person as follows:</p>\n\n<ul>\n<li><p>4 states as above</p></li>\n<li><p>probabilities of uttering each phrase (let&#8217;s just make them equally likely)</p></li>\n<li><p>probabilities to transition from any one state to another (every 10 minutes):</p>\n\n<ul>\n<li>morning &#8211;> morning (stay there): 70%</li>\n<li>morning &#8211;> coffee: 25%</li>\n<li>morning &#8211;> asleep: 5%</li>\n<li>coffee &#8211;> coffee (stay there): 95%</li>\n<li>coffee &#8211;> lunch: 5%</li>\n<li>lunch &#8211;> lunch (stay there): 97%</li>\n<li>lunch &#8211;> sleep: 3%</li>\n<li>sleep -> sleep: 97%</li>\n<li>sleep &#8211;> morning: 3%</li>\n</ul></li>\n</ul>\n"}︡
︠513a9644-0ddd-462d-89b6-5ccdaf743d7do︠
# Here's how to implement it in Sage:

A = matrix(RR, 4, [.97, .03, 0,  0,  # sleep
                   .05, .7, .25, 0,  # morning (pre-coffee)
                    0,   0, .95, .05, # morning (post-coffee)
                   .03,   0,   0, .97]) # lunch

emission_symbols = ['must sleep', 'zzz', 'good morning', 'awesome!', 'ha ha']
B = matrix(RR, 4, 5, [.03,.97,0,0,0,  # sleep
                      .5,0,.5,0,0,  # pre-coffee
                      0,0,1/3,1/3,1/3, # post-coffee
                      0.5,0,0,0,.5])

initial = [0,1,0,0]

model = hmm.DiscreteHiddenMarkovModel(A, B, initial, emission_symbols)
︡af3140a5-4404-4e12-823d-0e1291fcbd5a︡
︠15016917-0af0-4e62-ae80-4ca014955b81︠
# The model:
model
︡3cdc985e-cef0-4dca-b3c7-0bbfcf86df37︡{"stdout":"Discrete Hidden Markov Model with 4 States and 5 Emissions\nTransition matrix:\n[0.97 0.03  0.0  0.0]\n[0.05  0.7 0.25  0.0]\n[ 0.0  0.0 0.95 0.05]\n[0.03  0.0  0.0 0.97]\nEmission matrix:\n[          0.03           0.97            0.0            0.0            0.0]\n[           0.5            0.0            0.5            0.0            0.0]\n[           0.0            0.0 0.333333333333 0.333333333333 0.333333333333]\n[           0.5            0.0            0.0            0.0            0.5]\nInitial probabilities: [0.0000, 1.0000, 0.0000, 0.0000]\nEmission symbols: ['must sleep', 'zzz', 'good morning', 'awesome!', 'ha ha']\n"}︡
︠f48fb6b4-3864-499c-9ebe-e0cd61d22c3do︠
# This shows the transition matrix.  It's ugly (developer project idea!)
model.graph().plot(edge_labels=True, graph_border=True).show(figsize=5, svg=True)
︡c242a071-3b67-427d-ace0-47acb9bcdedc︡{"stderr":"Error in lines 2-2\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nNameError: name 'model' is not defined\n"}︡
︠46078441-90e6-4e1f-b1fb-da17b6479962o︠
set_random_seed(0); model.sample(10)
︡895d3645-f60c-4b3f-bafc-760402d52aa2︡{"stdout":"['must sleep', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz']\n"}︡
︠33d00064-982f-43e3-a763-8f40cce9847eo︠
set_random_seed(1); model.sample(10)
︡78963f8a-72d1-4c8b-904b-3fda645f7b47︡{"stdout":"['good morning', 'ha ha', 'good morning', 'ha ha', 'awesome!', 'ha ha', 'good morning', 'good morning', 'good morning', 'awesome!']\n"}︡
︠3ac7df99-d9a2-41bf-9e48-531180cdcb2ao︠
set_random_seed(1);
a,b=model.generate_sequence(20)
a,list(b)
︡43278277-ff2e-427e-92b8-594ebd250f09︡{"stdout":"(['good morning', 'ha ha', 'good morning', 'ha ha', 'awesome!', 'ha ha', 'good morning', 'good morning', 'good morning', 'awesome!', 'good morning', 'good morning', 'must sleep', 'ha ha', 'must sleep', 'ha ha', 'must sleep', 'must sleep', 'must sleep', 'ha ha'], [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3])\n"}︡
︠1d215ce5-b252-4a79-b5cb-c90481ce39ed︠
model.vi
︠141aa59b-8f56-4b6d-83f3-7ee41c02d42a︠
model.viterbi(['good morning', 'good morning', 'good morning' , 'must sleep', 'ha ha', 'ha ha', 'ha ha'])
︡e5966681-936f-4eeb-91b5-35331b6ba815︡{"stdout":"([1, 1, 1, 1, 2, 2, 2], -8.6273313699553)\n"}︡
︠5a1cbd3d-00ff-4df1-88d3-aa26fcfd747a︠
model.viterbi(['good morning', 'awesome!', 'zzz'])
︡390760d6-78bd-4190-b30c-29635906c8a5︡{"stdout":"([0, -1, 0], -inf)\n"}︡
︠cdf8ef1b-1bd5-4007-827c-dad1b274dcac︠
list(model.viterbi(['good morning', 'ha ha', 'must sleep', 'ha ha', 'must sleep', 'ha ha', 'must sleep', 'must sleep', 'must sleep', 'ha ha', 'must sleep', 'zzz', 'must sleep', 'good morning', 'good morning', 'ha ha', 'zzz', 'zzz', 'zzz', 'zzz'])[0])
︡9e5c734c-52de-48e0-a05a-bc7c2a19157b︡{"stdout":"[1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 1, 1, 2, 3, 0, 0, 0, 0]\n"}︡
︠d6ee8205-cb9c-4b7d-a23b-baab4cfd4001o︠
model.viterbi(['must sleep', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz', 'zzz'])
︡e472d613-8a6f-4e7d-9e19-7dd040b97997︡{"stdout":"([1, 0, 0, 0, 0, 0, 0, 0, 0, 0], -4.206685981353984)\n"}︡
︠b611ec2d-dc1b-4f1a-9912-535ecd85f0f8︠

︠85a97aca-8f39-4a96-bb1c-7c76b0aae2d6︠

︠3957695c-0f6d-4af8-a788-69e914ab5d75o︠
set_random_seed(1); v,w = model.generate_sequence(50)
for z in zip(v,w):
    print z
︡82b789c3-20e1-4ac0-b19e-cc462b959e65︡{"stdout":"('good morning', 1)\n('ha ha', 2)\n('good morning', 2)\n('ha ha', 2)\n('awesome!', 2)\n('ha ha', 2)\n('good morning', 2)\n('good morning', 2)\n('good morning', 2)\n('awesome!', 2)\n('good morning', 2)\n('good morning', 2)\n('must sleep', 3)\n('ha ha', 3)\n('must sleep', 3)\n('ha ha', 3)\n('must sleep', 3)\n('must sleep', 3)\n('must sleep', 3)\n('ha ha', 3)\n('ha ha', 3)\n('ha ha', 3)\n('ha ha', 3)\n('must sleep', 3)\n('zzz', 0)\n('zzz', 0)\n('zzz', 0)\n('must sleep', 1)\n('must sleep', 1)\n('must sleep', 1)\n('awesome!', 2)\n('must sleep', 3)\n('must sleep', 3)\n('must sleep', 3)\n('ha ha', 3)\n('ha ha', 3)\n('must sleep', 3)\n('must sleep', 3)\n('must sleep', 3)\n('must sleep', 3)\n('ha ha', 3)\n('ha ha', 3)\n('ha ha', 3)\n('ha ha', 3)\n('must sleep', 3)\n('must sleep', 3)\n('ha ha', 3)\n('must sleep', 3)\n('zzz', 0)\n('zzz', 0)\n"}︡
︠b1b1011e-e5e3-4b1b-8b61-5d7f5ef99e1boi︠
%md
## Baum-Welch: find a better model.

Say we observe this sequence from a morning person friend:

    obs = ['good morning', 'awesome!', 'awesome!','awesome!','awesome!','awesome!','awesome!','ha ha','must sleep','zzz','zzz''zzz''zzz]

The *Baum-Welch algorithm* will locally modify our model to find a model that is more likely to produce that sequence.  It's a clever and highly efficient optimization trick -- basically like Newton's method.
︡3b827954-9312-477e-a39f-461ae3efc0c4︡{"html":"<h2>Baum-Welch: find a better model.</h2>\n\n<p>Say we observe this sequence from a morning person friend:</p>\n\n<pre><code>obs = ['good morning', 'awesome!', 'awesome!','awesome!','awesome!','awesome!','awesome!','ha ha','must sleep','zzz','zzz''zzz''zzz'\n</code></pre>\n\n<p>The <em>Baum-Welch algorithm</em> will locally modify our model to find a model that is more likely to produce that sequence.  It&#8217;s a clever and highly efficient optimization trick &#8211; basically like Newton&#8217;s method.</p>\n"}︡
︠6ac0bd07-3a8d-46af-8a52-b225058c515do︠
model
︡c333db08-eca5-4299-8aeb-39bb661ec2bb︡{"stdout":"Discrete Hidden Markov Model with 4 States and 5 Emissions\nTransition matrix:\n[          0.97           0.03            0.0            0.0]\n[          0.05            0.7           0.25            0.0]\n[           0.0            0.0 0.655172413793 0.344827586207]\n[0.236220472441            0.0            0.0 0.763779527559]\nEmission matrix:\n[          0.03           0.97            0.0            0.0            0.0]\n[           0.5            0.0            0.5            0.0            0.0]\n[           0.0            0.0 0.333333333333 0.333333333333 0.333333333333]\n[           0.5            0.0            0.0            0.0            0.5]\nInitial probabilities: [0.0000, 1.0000, 0.0000, 0.0000]\nEmission symbols: ['must sleep', 'zzz', 'good morning', 'awesome!', 'ha ha']\n"}︡
︠6e04895b-c010-49cc-a6be-5b42026f9096o︠
obs = ['good morning', 'awesome!', 'awesome!','awesome!','awesome!','awesome!','awesome!',
       'ha ha','must sleep','zzz','zzz', 'zzz', 'zzz', 'zzz','good morning']
model.viterbi(obs)
︡42cbb96c-65f3-4741-ba88-c517dd36047a︡{"stdout":"([1, 2, 2, 2, 2 ... 0, 0, 0, 0, 1], -21.320463430347107)\n"}︡
︠b4d53e86-ac62-4069-b2cc-8926ba0be765︠
model.baum_welch(obs)
︡da085fe4-e787-4cd1-9b2a-ebe8756d4025︡{"stdout":"(-7.978049737953267, 15)\n"}︡
︠350bc728-9ce7-4a0c-9c34-789737af1c45︠

︠b851f56f-9db9-4505-880a-466497777080o︠
model
︡dc3a6137-90cc-46e8-b3ac-bcabe236cd7e︡{"stdout":"Discrete Hidden Markov Model with 4 States and 5 Emissions\nTransition matrix:\n[0.800001550251 0.199998449749            0.0            0.0]\n[           0.0            0.0            1.0            0.0]\n[           0.0            0.0 0.833337563711 0.166662436289]\n[0.500047768076            0.0            0.0 0.499952231924]\nEmission matrix:\n[7.75125403474e-06    0.999992248746               0.0               0.0               0.0]\n[              0.0               0.0               1.0               0.0               0.0]\n[              0.0               0.0               0.0    0.999974617731 2.53822689622e-05]\n[   0.500028387939               0.0               0.0               0.0    0.499971612061]\nInitial probabilities: [0.0000, 1.0000, 0.0000, 0.0000]\nEmission symbols: ['must sleep', 'zzz', 'good morning', 'awesome!', 'ha ha']\n"}︡
︠1d4a0c0e-f86d-4541-9b83-aea946e03848o︠
model.graph().plot(edge_labels=True, graph_border=True).show(figsize=5, svg=True)
︡c3a08a8f-a001-483f-9451-3d4bc0516008︡{"file":{"show":true,"uuid":"1ce430ba-71e1-409c-af01-d80181988708","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/28005/tmp_yG2n8n.svg"}}︡
︠1ff8ba15-d513-4cc6-927d-83a69a0e39a6i︠
%hide
%md

## HMM's in Sage

### Variants implemented in Sage

- Discrete distribution at each state (finite list of symbols)

- Normal distribution with some mean and standard deviation at each state: a 1-state model is *exactly* the same as basic stats!

- Arbitrary linear combination of normal distributions at each state: complicated, but can approximate any distribution.

### Implementation history

- I used Cython to wrap <http://ghmm.org/> back in 2007 (?)

- That had a lot of issues (e.g., memory leaks, segfaults, build problems), so I did a complete implementation from scratch in Cython of everything -- see [github](https://github.com/sagemath/sage/tree/master/src/sage/stats/hmm).

- Code hasn't been touched in a while.

︡4032c2ad-1145-4e1d-9e21-d25e90240539︡{"html":"<h2>HMM&#8217;s in Sage</h2>\n\n<h3>Variants implemented in Sage</h3>\n\n<ul>\n<li><p>Discrete distribution at each state (finite list of symbols)</p></li>\n<li><p>Normal distribution with some mean and standard deviation at each state: a 1-state model is <em>exactly</em> the same as basic stats!</p></li>\n<li><p>Arbitrary linear combination of normal distributions at each state: complicated, but can approximate any distribution.</p></li>\n</ul>\n\n<h3>Implementation history</h3>\n\n<ul>\n<li><p>I used Cython to wrap <a href=\"http://ghmm.org/\">http://ghmm.org/</a> back in 2007 (?)</p></li>\n<li><p>That had a lot of issues (e.g., memory leaks, segfaults, build problems), so I did a complete implementation from scratch in Cython of everything &#8211; see <a href=\"https://github.com/sagemath/sage/tree/master/src/sage/stats/hmm\">github</a>.</p></li>\n<li><p>Code hasn&#8217;t been touched in a while.</p></li>\n</ul>\n"}︡
︠09d6719f-5bb0-4fa3-be98-9c7c76098199i︠
%md

## Some Applications of HMM

- They were invented by [IDA](https://www.ida.org/) for **cryptoanalysis**.  (Before public key.)

- **Financial applications**: noted in an early paper introducing HMM.  Instead of writing a follow-up paper about financial applications, Simons founded [the most successful hedge fund of all time](https://www.renfund.com/vm/index.vm) and became the 31st wealthiest person in the country...

- [Wikipedia list](http://en.wikipedia.org/wiki/Hidden_Markov_model): "Cryptanalysis, Speech recognition,
Speech synthesis, Part-of-speech tagging,
Machine translation, Partial discharge, Gene prediction, Alignment of bio-sequences, Time Series Analysis,
Activity recognition, Protein folding, Metamorphic Virus Detection"

︡71db899f-acd7-4871-bbb0-3c4f7645e747︡{"html":"<h2>Some Applications of HMM</h2>\n\n<ul>\n<li><p>They were invented by <a href=\"https://www.ida.org/\">IDA</a> for <strong>cryptoanalysis</strong>.  (Before public key.)</p></li>\n<li><p><strong>Financial applications</strong>: noted in an early paper introducing HMM.  Instead of writing a follow-up paper about financial applications, Simons founded <a href=\"https://www.renfund.com/vm/index.vm\">the most successful hedge fund of all time</a> and became the 31st wealthiest person in the country&#8230;</p></li>\n<li><p><a href=\"http://en.wikipedia.org/wiki/Hidden_Markov_model\">Wikipedia list</a>: &#8220;Cryptanalysis, Speech recognition,\nSpeech synthesis, Part-of-speech tagging,\nMachine translation, Partial discharge, Gene prediction, Alignment of bio-sequences, Time Series Analysis,\nActivity recognition, Protein folding, Metamorphic Virus Detection&#8221;</p></li>\n</ul>\n"}︡
︠64106501-0bbe-407a-a626-b75b238405eci︠

%hide
%md

### Application: language detection

 - Make a 27-state model, one for each letter and for spaces.  You have to *somehow* decide on initial transition probabilities and emission probabilities...

 - Imnprove model by feeding it lots of text in English, running Baum-Welch to train model.

 - Do the same with another model, but in a different language.

 - Given text, you can ask how likely the text was to be generated using each of the two models.  In this way you can make an educated guess about the language.


It's often easy to come up with a basic idea of how to apply HMM in a given setting, but much, much harder to successfully do so.  Finding *the* optimal model with a given number of states is a very high-dimensional optimization problem.  Deciding on the number of states and what they should be is an art.
︡46ed7bbe-4dd8-4d34-9663-b33280491347︡{"html":"<h3>Application: language detection</h3>\n\n<ul>\n<li><p>Make a 27-state model, one for each letter and for spaces.  You have to <em>somehow</em> decide on initial transition probabilities and emission probabilities&#8230;</p></li>\n<li><p>Imnprove model by feeding it lots of text in English, running Baum-Welch to train model.</p></li>\n<li><p>Do the same with another model, but in a different language.</p></li>\n<li><p>Given text, you can ask how likely the text was to be generated using each of the two models.  In this way you can make an educated guess about the language.</p></li>\n</ul>\n\n<p>It&#8217;s often easy to come up with a basic idea of how to apply HMM in a given setting, but much, much harder to successfully do so.  Finding <em>the</em> optimal model with a given number of states is a very high-dimensional optimization problem.  Deciding on the number of states and what they should be is an art.</p>\n"}︡
︠cc9f2b9b-87d2-4063-88ba-7f477df96e3c︠



























