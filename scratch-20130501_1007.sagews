︠8582e226-2993-4b9d-a769-9380e953f0e5︠
def prime_factors(x):
    count = 2
    factors = []
        while count <= x:
            if x % count == 0:
                x /= count
                factors.append[count]
            else:
                count += 1
    return factors
︡92443ca1-66c6-4dca-aeb8-77512a25c54a︡{"stderr":"Error in lines 1-10\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"<string>\", line 4\n"}︡{"stderr":"    while count <= x:\n"}︡{"stderr":"   ^\n"}︡{"stderr":"IndentationError: unexpected indent\n"}︡
︠42d1ec34-4971-49ea-8731-d3355b9cd556︠
def foo():
    func = x^2+x
    for i in range (100):
        if is_prime(func(i)):
            return "yes"
        else:
            return "no"

foo()
︡b3616bdf-0212-4fc8-bdba-32643e4ec301︡{"stderr":"<string>:1: DeprecationWarning: Substitution using function-call syntax and unnamed arguments is deprecated and will be removed from a future release of Sage; you can use named arguments instead, like EXPR(x=..., y=...)\nSee http://trac.sagemath.org/5930 for details.\n"}︡{"stdout":"'no'"}︡{"stdout":"\n"}︡
︠178d0913-b125-4837-bb4c-1fc6e2a9eaef︠
is_prime(0)
︡d2bf3717-7c5b-429c-903d-da3a13f42121︡{"stdout":"False"}︡{"stdout":"\n"}︡
︠88485364-fee7-475c-aee5-4e136c3f76e8︠
def foo():
    func = x^2+x
    for i in range (100):
        if is_prime(func(i)):
            return "yes"
        else:
            return "no"n = 4654252230393111226989449826741007006486078009450861095070222439898324342353927553909251532232407850265642079868425916328810273416481567992145162141358151
︡1fb63d83-1fff-46a6-8f58-9385d8d53625︡
︠06a9552b-34ce-4692-aedb-1ad3bba7130d︠
is_pseudoprime(n)
︡036ed653-71f6-4fbc-b557-c1f2757b8966︡{"stdout":"False"}︡{"stdout":"\n"}︡
︠7ea314f4-1971-466e-9696-68e13873cd67︠
Mod(2,n)^(n-1)
︡0b9422f4-9ebf-44b4-be10-892c22d47c52︡{"stdout":"1631275335353718272688521136992205307778996921510751912836784958121590177271097904110560032076219875741821572502979807785676850802289166219856576501165317"}︡{"stdout":"\n"}︡
︠7b241428-0d1a-418d-81f3-827fbe8c1cd8︠
factor(n)
︡e1f4e23f-ccac-4702-a98d-6e2367d9ed75︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"/usr/local/sage/sage-5.8/local/lib/python2.7/site-packages/sage/rings/arith.py\", line 2464, in factor\n"}︡{"stderr":"    int_ = int_, verbose=verbose)\n"}︡{"stderr":"  File \"integer.pyx\", line 3459, in sage.rings.integer.Integer.factor (sage/rings/integer.c:21779)\n"}︡{"stderr":"  File \"factorint.pyx\", line 258, in sage.rings.factorint.factor_using_pari (sage/rings/factorint.c:6826)\n"}︡{"stderr":"  File \"factorint.pyx\", line 299, in sage.rings.factorint.factor_using_pari (sage/rings/factorint.c:6381)\n"}︡{"stderr":"  File \"gen.pyx\", line 8572, in sage.libs.pari.gen.gen.factor (sage/libs/pari/gen.c:43192)\n"}︡{"stderr":"KeyboardInterrupt\n"}︡
︠00b991b1-73e0-47e0-a917-597767ddbaaa︠
n = 4654252230393111226989449826741007006486078009450861095070222439898324342353927553909251532232407850265642079868425916328810273416481567992145162141358151
︡a2aed683-b7d1-4156-a39d-0ce5c4a4b60a︡
︠3e9bba63-8b0d-4d23-8fd0-2c7697630d1c︠
k = int(sqrt(n))
︡ae7eecdc-30d2-46f3-9b0d-4c8419d226b1︡
︠16208f5c-9852-4fa5-9358-e5aab6b8267b︠
n%k
︡2aa5f21a-6313-4d42-bd89-71baf3d95649︡{"stdout":"68222080226222296181917368518534332259513625527062166102114730123514248552799"}︡{"stdout":"\n"}︡
︠fc3487ab-e9b8-4bfd-bec0-c26b05d92a0b︠
p = next_probable_prime(k)
︡b7b8893e-bf39-47ef-805f-b4f5404cdc62︡
︠c00ef068-5c09-4039-954c-bd70b3145fdb︠
n%p
︡ea898d88-82b1-4cf8-afc0-31b7d1fa1a7f︡{"stdout":"0"}︡{"stdout":"\n"}︡
︠b17b9f07-0dc9-4221-a4ab-305ed70aba80︠
len(str(n))
︡0c6c0a32-5272-4f7c-a0f9-0e926722ed7b︡{"stdout":"154"}︡{"stdout":"\n"}︡
︠484f4256-e2fb-48e8-9e5d-6dc6179a3d71︠

