︠c6aefda5-dcd9-411d-86e4-5b9742b8cae3︠
Mod(1234/4567,10^10)
︡befd95f1-46e1-42f3-80f8-d7c57a23814d︡{"stdout":"8171666302"}︡{"stdout":"\n"}︡
︠45d37ac6-b1a1-4fc8-ba90-69744df3d94e︠
10^10
︡55d27a86-644e-407a-9916-55cf71a49b75︡{"stdout":"10000000000"}︡{"stdout":"\n"}︡
︠f93b48a3-5892-43b2-afba-a6134c54b66e︠
p = next_probable_prime(ZZ.random_element(2^256))
q = next_probable_prime(p)
p, q
︡b87e72fa-233e-4022-8fe9-fde6ebf6a5c5︡{"stdout":"(68222080226222296181917368518534332259513625527062166102114730123514248558349, 68222080226222296181917368518534332259513625527062166102114730123514248558499)"}︡{"stdout":"\n"}︡
︠0412c136-5791-48c4-9e3d-60d84663f057︠
p*q
︡8a1c1297-2ada-4304-b0a1-4d727b6a64ef︡{"stdout":"4654252230393111226989449826741007006486078009450861095070222439898324342353927553909251532232407850265642079868425916328810273416481567992145162141358151"}︡{"stdout":"\n"}︡
︠2037b305-1f44-4cfb-8dae-c8d57a2b17aa︠
len((p*q).digits(2))
︡96aee415-b76e-434b-8671-9f180cb1c57c︡{"stdout":"511"}︡{"stdout":"\n"}︡
︠8ed5be3e-f797-469d-a8ce-f91c894770e0︠
%html
Thanks for the very helpful survey forms. &nbsp;Based on them, this is what we'll do.<br></span><div><br><div><div>&nbsp; &nbsp;1. Python/Cython -- a crash course</div><div>&nbsp; &nbsp;2. Computational number theory -- (maybe: continued fractions, exact linear algebra, arithmetic of elliptic curves)</div><div>&nbsp; &nbsp;3. Typesetting mathematics and sharing it on the web -- (maybe: creating latex documents; using MathJax; etc.)</div><div>&nbsp; &nbsp;4. Statistic/machine learning -- we'll do one solid topic: Hidden Markov Models</div><div>&nbsp; &nbsp;5. Public key cryptography -- Diffie-Hellman, RSA, El Gammal, elliptic curve crypto.</div><div><br></div><div><br></div></div></div>"
︡b9e90dec-b547-4aab-8fb6-75e9a0b77118︡{"html":"Thanks for the very helpful survey forms. &nbsp;Based on them, this is what we'll do.<br></span><div><br><div><div>&nbsp; &nbsp;1. Python/Cython -- a crash course</div><div>&nbsp; &nbsp;2. Computational number theory -- (maybe: continued fractions, exact linear algebra, arithmetic of elliptic curves)</div><div>&nbsp; &nbsp;3. Typesetting mathematics and sharing it on the web -- (maybe: creating latex documents; using MathJax; etc.)</div><div>&nbsp; &nbsp;4. Statistic/machine learning -- we'll do one solid topic: Hidden Markov Models</div><div>&nbsp; &nbsp;5. Public key cryptography -- Diffie-Hellman, RSA, El Gammal, elliptic curve crypto.</div><div><br></div><div><br></div></div></div>\""}︡
︠30ef5f15-ed16-452a-81f6-9cc86f3be726︠
R.<x> = QQ[]
f = x^3 - 3*x^2 - x + 9
f.factor()
︡72d6317d-8b3a-4ff9-ab89-a08122fbe21a︡{"stdout":"x^3 - 3*x^2 - x + 9"}︡{"stdout":"\n"}︡
︠7a445072-0f0d-40b2-bba2-af5af933f811︠
[f(n)%3 for n in [1..10]]
︡e91c22ee-dd47-42cf-afd8-119a7a70c7bf︡{"stdout":"[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]"}︡{"stdout":"\n"}︡
︠da9c23df-0792-4a5d-94be-3845f603e174︠
stats.TimeSeries([random() for _ in range(100)]).plot_histogram()
︡909d62e6-2707-4639-83be-30872c5c8c35︡{"file":{"show":true,"uuid":"74312c92-a06e-4bb2-8a03-a98d637ffbc0","filename":"/mnt/home/D6VXKxGo/.sage/temp/compute1a/22475/tmp_Nka9Vu.svg"}}︡{"stdout":"\n"}︡
︠7e228fc4-456c-474c-ba78-a5f1d862c12a︠
a = matrix(QQ,3)
︡549ba2db-1c65-45b4-9525-f2f504c9f565︡{}︡{"stdout":"","done":true}︡
︠651905b6-f392-4424-ac9d-4f4e343afc79︠
print a.
︠d7c254a3-a92b-4694-b13a-117a099c78c3︠
x = int(399339038902)

isinstance(x, (int, long, Integer))abs
︡9c0a38a2-b747-4479-9af0-54f3e25523c0︡{}︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠aab03296-475b-4270-9c73-29c8be0b1727︠
type(x) == type(4r)
︡c12e4801-02c1-4f12-93eb-d6602af9e909︡{}︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠907534de-75a3-461f-ab44-df92d815248a︠
type(x) is int
︡019a40db-7aa4-46c2-a23f-92734b0fb62f︡{}︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠ed449f45-7ab8-46e2-84e1-2ccce7791297︠

for r in [0..28]:
    print r, N(0.2*exp(2*r))
︡d69e7ca5-043f-4a31-93fb-4aeeef785a1c︡{"stdout":"0"}︡{"stdout":" "}︡{"stdout":"0.200000000000000"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":" "}︡{"stdout":"1.47781121978613"}︡{"stdout":"\n"}︡{"stdout":"2"}︡{"stdout":" "}︡{"stdout":"10.9196300066288"}︡{"stdout":"\n"}︡{"stdout":"3"}︡{"stdout":" "}︡{"stdout":"80.6857586985470"}︡{"stdout":"\n"}︡{"stdout":"4"}︡{"stdout":" "}︡{"stdout":"596.191597408346"}︡{"stdout":"\n"}︡{"stdout":"5"}︡{"stdout":" "}︡{"stdout":"4405.29315896134"}︡{"stdout":"\n"}︡{"stdout":"6"}︡{"stdout":" "}︡{"stdout":"32550.9582838008"}︡{"stdout":"\n"}︡{"stdout":"7"}︡{"stdout":" "}︡{"stdout":"240520.856832955"}︡{"stdout":"\n"}︡{"stdout":"8"}︡{"stdout":" "}︡{"stdout":"1.77722210410157e6"}︡{"stdout":"\n"}︡{"stdout":"9"}︡{"stdout":" "}︡{"stdout":"1.31319938274661e7"}︡{"stdout":"\n"}︡{"stdout":"10"}︡{"stdout":" "}︡{"stdout":"9.70330390819581e7"}︡{"stdout":"\n"}︡{"stdout":"11"}︡{"stdout":" "}︡{"stdout":"7.16982569226318e8"}︡{"stdout":"\n"}︡{"stdout":"12"}︡{"stdout":" "}︡{"stdout":"5.29782442596869e9"}︡{"stdout":"\n"}︡{"stdout":"13"}︡{"stdout":" "}︡{"stdout":"3.91459218857678e10"}︡{"stdout":"\n"}︡{"stdout":"14"}︡{"stdout":" "}︡{"stdout":"2.89251412858295e11"}︡{"stdout":"\n"}︡{"stdout":"15"}︡{"stdout":" "}︡{"stdout":"2.13729491630489e12"}︡{"stdout":"\n"}︡{"stdout":"16"}︡{"stdout":" "}︡{"stdout":"1.57925920365361e13"}︡{"stdout":"\n"}︡{"stdout":"17"}︡{"stdout":" "}︡{"stdout":"1.16692348505491e14"}︡{"stdout":"\n"}︡{"stdout":"18"}︡{"stdout":" "}︡{"stdout":"8.62246309423039e14"}︡{"stdout":"\n"}︡{"stdout":"19"}︡{"stdout":" "}︡{"stdout":"6.37118635142275e15"}︡{"stdout":"\n"}︡{"stdout":"20"}︡{"stdout":" "}︡{"stdout":"4.70770533674040e16"}︡{"stdout":"\n"}︡{"stdout":"21"}︡{"stdout":" "}︡{"stdout":"3.47854988304100e17"}︡{"stdout":"\n"}︡{"stdout":"22"}︡{"stdout":" "}︡{"stdout":"2.57032002287186e18"}︡{"stdout":"\n"}︡{"stdout":"23"}︡{"stdout":" "}︡{"stdout":"1.89922388412049e19"}︡{"stdout":"\n"}︡{"stdout":"24"}︡{"stdout":" "}︡{"stdout":"1.40334718241953e20"}︡{"stdout":"\n"}︡{"stdout":"25"}︡{"stdout":" "}︡{"stdout":"1.03694110571741e21"}︡{"stdout":"\n"}︡{"stdout":"26"}︡{"stdout":" "}︡{"stdout":"7.66201600143315e21"}︡{"stdout":"\n"}︡{"stdout":"27"}︡{"stdout":" "}︡{"stdout":"5.66150660654939e22"}︡{"stdout":"\n"}︡{"stdout":"28"}︡{"stdout":" "}︡{"stdout":"4.18331899202599e23"}︡{"stdout":"\n"}︡
︠94b6cc36-d247-43cd-a97e-3dfaea7505d3︠

N(log(2)/2.)
︡504f180d-b60f-4bec-9ea2-8c7f35d39dff︡{"stdout":"0.346573590279973"}︡{"stdout":"\n"}︡
︠66b6d7a9-80d4-4b76-80e9-a79718d43ffd︠











