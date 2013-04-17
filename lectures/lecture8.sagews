︠341045b5-1dd8-4640-af41-14076c8c5e96r︠
%md

# Lecture 8: Cython Examples -- part 2

(First, quickly go through the sum example from lecture 6.)

## GCD -- using [binary GCD](http://en.wikipedia.org/wiki/Binary_GCD_algorithm) or "Stein's algorithm"
(no relation to me!)
︡eff6ec13-8ce7-44ac-8246-e8e07f11d67a︡{}︡{"html":"<h1>Lecture 8: Cython Examples -- part 2</h1>\n\n<p>(First, quickly go through the sum example from lecture 6.)</p>\n\n<h2>GCD -- using <a href=\"http://en.wikipedia.org/wiki/Binary_GCD_algorithm\">binary GCD</a> or \"Stein's algorithm\"</h2>\n\n<p>(no relation to me!)</p>\n"}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"cell.hide('editor')"},"once":true}︡{"stdout":"","done":true}︡
︠480cbd09-c751-435c-bb68-0b942b178636r︠

# Straightforward Sage implementation

def gcd1(u, v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)

n = int(2012*next_prime(2^40)); m = int(2012*next_prime(2^41))
gcd(n,m)
gcd1(n,m)
︡c12e763b-94a4-4b03-81a5-88b38fba6b7f︡{}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠12ef7c20-e42e-4260-84c6-a931e0484855r︠
%timeit gcd(n,m)     # uses MPIR, prob optimal and a DIFFERENT algorithm (!)
%timeit gcd1(n,m)
︡2aeaabd6-5892-48de-92d5-d90e68385840︡{}︡{"stdout":"625 loops, best of 3: 13.1 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 221 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠5461f005-60dc-48e4-b0a1-a459bf9f7b69r︠
%python
def gcd1(u, v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)

%timeit gcd1(n,m)
︡e44ee21e-f5ab-4c4f-9029-50f3e808c8c7︡{}︡{"stdout":"625 loops, best of 3: 50.9 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠4cc836a7-4341-432b-87b6-c7b7280e14c5r︠

%cython
def gcd1(u, v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)
︡ce370813-62a7-4bcd-a88e-9c999aa3e6f5︡{}︡{"file":{"show":false,"uuid":"d6a1d39e-0e5f-4c39-9292-78b6f3106362","filename":"/home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_vmsY3s_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_vmsY3s_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_vmsY3s_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_vmsY3s_a_pyx_0.html?uuid=d6a1d39e-0e5f-4c39-9292-78b6f3106362' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠9fd57428-d30f-4a1b-bc04-d69dc39a1b06r︠
%timeit gcd1(n,m)
︡239b33ea-1a34-472c-9d7e-6543c6a6ec39︡{}︡{"stdout":"625 loops, best of 3: 29.1 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠9adae1be-8ab0-4abb-bd6a-badc4d6816acr︠

%cython
def gcd1(int u, int v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)
︡3f7572c2-3597-40d7-b22d-d6aa222d7ba7︡{}︡{"file":{"show":false,"uuid":"e4bdd1ef-7f25-4b76-b73e-bed4fdcf261b","filename":"/home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.html?uuid=e4bdd1ef-7f25-4b76-b73e-bed4fdcf261b' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠13ca431f-9cab-4211-a82b-0a37af0e74e9r︠
%timeit gcd1(n,m)
︡67251a49-1524-4392-b394-b3a4032c6a0b︡{}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 439, in execute_with_code_decorators\n"}︡{"stderr":"    code = code_decorator(code)\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_salvus.py\", line 1282, in timeit\n"}︡{"stderr":"    go(*args)\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_salvus.py\", line 1278, in go\n"}︡{"stderr":"    print sage.misc.sage_timeit.sage_timeit(code, globals_dict=salvus.namespace, **kwds)\n"}︡{"stderr":"  File \"/home/wstein/sage/sage-5.9.rc0/local/lib/python2.7/site-packages/sage/misc/sage_timeit.py\", line 236, in sage_timeit\n"}︡{"stderr":"    if timer.timeit(number) >= 0.2:\n"}︡{"stderr":"  File \"/home/wstein/sage/sage-5.9.rc0/local/lib/python/timeit.py\", line 195, in timeit\n"}︡{"stderr":"    timing = self.inner(it, self.timer)\n"}︡{"stderr":"  File \"<magic-timeit>\", line 6, in inner\n"}︡{"stderr":"  File \"_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.pyx\", line 6, in _home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.gcd1 (_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.c:557)\n"}︡{"stderr":"OverflowError: value too large to convert to int\n"}︡{"stdout":"","done":true}︡
︠2ed1b361-c939-4d6b-b9b8-7cc305d5cb9dr︠
%cython
def gcd1(long u, long v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)
︡0758fb07-b43f-40a8-a7de-a59fdf1d987f︡{}︡{"file":{"show":false,"uuid":"a8d31845-15d3-4e66-a8f5-f227824eb6e1","filename":"/home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_pzq4JR_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_pzq4JR_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_pzq4JR_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_pzq4JR_a_pyx_0.html?uuid=a8d31845-15d3-4e66-a8f5-f227824eb6e1' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠f0a2cd3a-ae89-4b1d-958d-98934dc86873r︠
%timeit gcd1(n,m)
︡8592a1a2-1956-4786-b6c1-60eb08afc65e︡{}︡{"stdout":"625 loops, best of 3: 12.3 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠af71feff-3d99-492f-9678-c88a4ef4f77dr︠
# Here we use cpdef to eliminate Python function call overhead.

%cython
cpdef gcd1(long u, long v):
    if u == v: return u
    if u == 0: return v
    if v == 0: return u
    if u%2 == 0:    # u is even
        if v%2: # v is odd
            return gcd1(u >> 1, v)
        else:    # both u and v are even
            return gcd1(u >> 1, v >> 1) << 1
    if v%2 == 0:   # u is odd, v is even
        return gcd1(u, v >> 1)
    if u > v:    # reduce larger
        return gcd1((u - v) >> 1, v)
    return gcd1((v - u) >> 1, u)
︡c379c745-4e11-45a4-bbb0-911d2ebd6a2f︡{}︡{"file":{"show":false,"uuid":"de416a14-ea8d-4395-ab41-9e390180a07c","filename":"/home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_xI2DMk_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_xI2DMk_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/15309/spyx/_home_wstein__sage_temp_localhost_15309_dir_xI2DMk_a_pyx/_home_wstein__sage_temp_localhost_15309_dir_xI2DMk_a_pyx_0.html?uuid=de416a14-ea8d-4395-ab41-9e390180a07c' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠94561093-22a6-49b6-b00b-96cb23b38909r︠
%timeit gcd1(n,m)
︡4c6714fb-2556-4ca9-891a-3f83966eb7d9︡{}︡{"stdout":"625 loops, best of 3: 1.13 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠47e5ebe9-0b0e-46fb-a1f7-14cc2beb3b3dr︠
gcd1(n,m)
︡220ad762-29c9-41f7-80cb-f0c53e1fff1f︡{}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠19b13249-8cf4-4a6d-99b9-683312841a1dr︠
# I'm *very* surprised that we just beat the builtin GCD by that much
# Is it doing something really stupid (?!) -- somebody should open a ticket.
%timeit gcd(n,m)
︡ddcf8732-83cf-48b7-ad12-9a85adf87167︡{}︡{"stdout":"625 loops, best of 3: 13.6 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠64e35436-9cfa-4919-9997-78cab86617f8r︠
nn = ZZ(n)
mm = ZZ(m)
%timeit nn.gcd(mm)  # fast code path to MPIR
︡0ec0753a-ae3d-4d3e-8b75-1935cf469cc0︡{}︡{"stdout":"625 loops, best of 3: 296 ns per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠a860a36f-da9d-43e0-877d-b46e0b5a0d8f︠
nn.gcd??
