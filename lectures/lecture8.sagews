︠341045b5-1dd8-4640-af41-14076c8c5e96i︠
%hide
%md
# Lecture 8: Cython Examples -- part 2

Reminder -- start G+ hangout!!

(First, quickly go through the sum example from lecture 6.)

## GCD -- using [binary GCD](http://en.wikipedia.org/wiki/Binary_GCD_algorithm) or "Stein's algorithm"
(no relation to me!)

︡f4537ea2-101e-4be8-b181-1ae5d193aacc︡{"html":"<h1>Lecture 8: Cython Examples &#8211; part 2</h1>\n\n<p>Reminder &#8211; start G+ hangout!!</p>\n\n<p>(First, quickly go through the sum example from lecture 6.)</p>\n\n<h2>GCD &#8211; using <a href=\"http://en.wikipedia.org/wiki/Binary_GCD_algorithm\">binary GCD</a> or &#8220;Stein&#8217;s algorithm&#8221;</h2>\n\n<p>(no relation to me!)</p>\n"}︡
︠480cbd09-c751-435c-bb68-0b942b178636︠

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
︡2660467d-fb56-4bd3-a81e-ddf6e24d9c64︡{}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠12ef7c20-e42e-4260-84c6-a931e0484855︠
%timeit gcd(n,m) # uses MPIR, prob optimal and a DIFFERENT algorithm (!)
%timeit gcd1(n,m)
︡20c45467-3587-4893-a006-7f6c4d587b0e︡{}︡{"stdout":"625 loops, best of 3: 14.2 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"625 loops, best of 3: 237 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠5461f005-60dc-48e4-b0a1-a459bf9f7b69︠
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
︡53fafae8-8cdd-454a-9af8-c24fe60185ce︡{}︡{"stdout":"625 loops, best of 3: 52.5 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠4cc836a7-4341-432b-87b6-c7b7280e14c5︠

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
︡26cee5f0-5297-47ad-b8e4-ee1707b719a1︡{}︡{"file":{"show":false,"uuid":"0c05d35a-c6b4-4c69-ac37-5e187d6f3701","filename":"/home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_qnQTwt_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_qnQTwt_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_qnQTwt_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_qnQTwt_a_pyx_0.html?uuid=0c05d35a-c6b4-4c69-ac37-5e187d6f3701' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠9fd57428-d30f-4a1b-bc04-d69dc39a1b06︠
%timeit gcd1(n,m)
︡0cc7050e-1f86-4adc-93ac-deedefd11da4︡{}︡{"stdout":"625 loops, best of 3: 29.3 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠9adae1be-8ab0-4abb-bd6a-badc4d6816ac︠

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
︡0f92ed60-712d-4516-a748-6081ebd991dd︡{}︡{"file":{"show":false,"uuid":"b106c0e3-2659-4f9d-b345-baa54b9e4023","filename":"/home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_WbCNvs_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_WbCNvs_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_WbCNvs_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_WbCNvs_a_pyx_0.html?uuid=b106c0e3-2659-4f9d-b345-baa54b9e4023' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠13ca431f-9cab-4211-a82b-0a37af0e74e9︠
%timeit gcd1(n,m)
︡67251a49-1524-4392-b394-b3a4032c6a0b︡{}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 406, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_server.py\", line 439, in execute_with_code_decorators\n"}︡{"stderr":"    code = code_decorator(code)\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_salvus.py\", line 1282, in timeit\n"}︡{"stderr":"    go(*args)\n"}︡{"stderr":"  File \"/home/wstein/.sagemathcloud/sage_salvus.py\", line 1278, in go\n"}︡{"stderr":"    print sage.misc.sage_timeit.sage_timeit(code, globals_dict=salvus.namespace, **kwds)\n"}︡{"stderr":"  File \"/home/wstein/sage/sage-5.9.rc0/local/lib/python2.7/site-packages/sage/misc/sage_timeit.py\", line 236, in sage_timeit\n"}︡{"stderr":"    if timer.timeit(number) >= 0.2:\n"}︡{"stderr":"  File \"/home/wstein/sage/sage-5.9.rc0/local/lib/python/timeit.py\", line 195, in timeit\n"}︡{"stderr":"    timing = self.inner(it, self.timer)\n"}︡{"stderr":"  File \"<magic-timeit>\", line 6, in inner\n"}︡{"stderr":"  File \"_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.pyx\", line 6, in _home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.gcd1 (_home_wstein__sage_temp_localhost_15309_dir_RtssyM_a_pyx_0.c:557)\n"}︡{"stderr":"OverflowError: value too large to convert to int\n"}︡{"stdout":"","done":true}︡
︠2ed1b361-c939-4d6b-b9b8-7cc305d5cb9d︠
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
︡7927a016-89f8-410e-910e-17c1085ab1c0︡{}︡{"file":{"show":false,"uuid":"0714303a-fc3c-4e4f-a408-de7934777548","filename":"/home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_MzP_0h_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_MzP_0h_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_MzP_0h_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_MzP_0h_a_pyx_0.html?uuid=0714303a-fc3c-4e4f-a408-de7934777548' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠f0a2cd3a-ae89-4b1d-958d-98934dc86873︠
%timeit gcd1(n,m)
︡c05ed080-c4f0-4ddd-b4ff-5f49c84f03e2︡{}︡{"stdout":"625 loops, best of 3: 14.1 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠af71feff-3d99-492f-9678-c88a4ef4f77d︠
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
︡08c3981e-b5c0-47f0-8ada-728e3bd1c295︡{}︡{"file":{"show":false,"uuid":"73387ca9-3f33-4aa3-9ad1-45c4b3dfe9e3","filename":"/home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_B406RD_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_B406RD_a_pyx_0.html"}}︡{"html":"<a href='/blobs//home/wstein/.sage/temp/localhost/16814/spyx/_home_wstein__sage_temp_localhost_16814_dir_B406RD_a_pyx/_home_wstein__sage_temp_localhost_16814_dir_B406RD_a_pyx_0.html?uuid=73387ca9-3f33-4aa3-9ad1-45c4b3dfe9e3' target='_new' class='btn btn-small '>Show auto-generated code >> </a>"}︡{"stdout":"","done":true}︡
︠94561093-22a6-49b6-b00b-96cb23b38909︠
%timeit gcd1(n,m)
︡2ad0c400-b546-4c5c-b448-c10f755a074e︡{}︡{"stdout":"625 loops, best of 3: 1.14 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠82cdbe15-d2b0-4ae3-87b0-eed6131679d7︠
237/1.14
︡7b8f056e-7bae-4f1c-9164-363b005aadc1︡{}︡{"stdout":"207.894736842105"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠47e5ebe9-0b0e-46fb-a1f7-14cc2beb3b3d︠
gcd1(n,m)
︡220ad762-29c9-41f7-80cb-f0c53e1fff1f︡{}︡{"stdout":"2012"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠19b13249-8cf4-4a6d-99b9-683312841a1d︠
# I'm *very* surprised that we just beat the builtin GCD by that much
# Is it doing something really stupid (?!) -- somebody should open a ticket.
%timeit gcd??(n,m)
︡d5dac761-81eb-4ca4-8c3b-a20e84f15c19︡{}︡{"stdout":"625 loops, best of 3: 14 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠64e35436-9cfa-4919-9997-78cab86617f8︠
nn = ZZ(n)
mm = ZZ(m)
%timeit nn.gcd(mm)  # fast code path to MPIR
︡967d51b8-cf22-4ae4-b923-ee7e8f670610︡{}︡{"stdout":"625 loops, best of 3: 584 ns per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠f62df6c8-3734-47e5-9fa4-9588bc2d5025︠
%timeit gcd(nn,mm)
︡c653acba-ad2e-4ae3-a317-55d5bb5b8832︡{}︡{"stdout":"625 loops, best of 3: 5.1 µs per loop"}︡{"stdout":"\n"}︡{"stdout":"","done":true}︡
︠a860a36f-da9d-43e0-877d-b46e0b5a0d8f︠
nn.gcd??
