︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md

# Lecture 16: More Cryptography

1. Remember to start G+ recorder
2. NOTE: new version of <https://cloud.sagemath.com>.   Interacts, faster, new Sage version.
3. Reminder: homework due Wednesday at 11:59pm; office hours tomorrow.
4. Questions?
5. RSA
6. Symmetric ciphers in Sage
︡0633385d-80e2-4eb8-b3f0-4c6d01c71600︡{"html":"<h1>Lecture 16: More Cryptography</h1>\n\n<ol>\n<li>Remember to start G+ recorder</li>\n<li>NOTE: new version of <a href=\"https://cloud.sagemath.com\">https://cloud.sagemath.com</a>.   Interacts, faster, new Sage version.</li>\n<li>Reminder: homework due Wednesday at 11:59pm; office hours tomorrow. </li>\n<li>Questions?</li>\n<li>RSA</li>\n<li>Symmetric ciphers in Sage</li>\n</ol>\n"}︡
︠55a03652-14bd-4c34-9a41-ad588b83f9fbi︠
%hide
%html

<h4>Recall... Nikita left a public key cryptosystem at Division before she escaped, so that her mole, Alex, could securely communicate with her.  How?</h4>

<img src="http://static.tvfanatic.com/images/gallery/dr-hanson-and-alex_500x332.jpg" class="img-rounded" style="width:30%;">&nbsp;&nbsp;
<img src="http://0.static.wix.com/media/3557ea_e15a7612089a99e9f628dd59c7751b23.jpg_1024" class="img-rounded" style="width:30%">
<img src="http://1.bp.blogspot.com/_9VadMyosXXU/TLauxaGDieI/AAAAAAAAAcY/mXfzrsEet1E/s1600/nikita+season+1+episode+6.jpg" class="pull-right img-rounded" style="width:30%;">
︡72be5fb0-a3b1-4f87-8525-0427f0aa0fee︡{"html":"\n<h4>Recall... Nikita left a public key cryptosystem at Division before she escaped, so that her mole, Alex, could securely communicate with her.  How?</h4>\n\n<img src=\"http://static.tvfanatic.com/images/gallery/dr-hanson-and-alex_500x332.jpg\" class=\"img-rounded\" style=\"width:30%;\">&nbsp;&nbsp;\n<img src=\"http://0.static.wix.com/media/3557ea_e15a7612089a99e9f628dd59c7751b23.jpg_1024\" class=\"img-rounded\" style=\"width:30%\">\n<img src=\"http://1.bp.blogspot.com/_9VadMyosXXU/TLauxaGDieI/AAAAAAAAAcY/mXfzrsEet1E/s1600/nikita+season+1+episode+6.jpg\" class=\"pull-right img-rounded\" style=\"width:30%;\">"}︡
︠803fafea-cddd-469c-ae25-d58ff16ca032i︠
%hide
%md

Diffie-Hellman has a very significant drawback.  It takes *active involvement* by both parties.

# The RSA public-key cryptosystem

Problem: Nikita wants to make it easy for Alex (who she has sent to infiltrate Division) to send her secret messages, even while she is out pulling various shenanigans (and her computer is off for security reasons).   What could she do (years earlier) that will make this possible?
︡53f8da05-099e-4857-bede-523e40fad8a8︡{"html":"<p>Diffie-Hellman has a very significant drawback.  It takes <em>active involvement</em> by both parties.</p>\n\n<h1>The RSA public-key cryptosystem</h1>\n\n<p>Problem: Nikita wants to make it easy for Alex (who she has sent to infiltrate Division) to send her secret messages, even while she is out pulling various shenanigans (and her computer is off for security reasons).   What could she do (years earlier) that will make this possible?</p>\n"}︡
︠d4674b52-f396-45da-9158-82c6b28943aci︠
%hide
%md

<div style="width:20%" class="pull-right img-rounded">
 <img src="http://1.bp.blogspot.com/_IBWTFjSJw9k/TM6rLOwEn0I/AAAAAAAAAHg/Bw9aNRJIsf4/s1600/Nikita-Dell-Computer.jpg">
 </div>


## RSA!

1. Nikita chooses two random large prime numbers $p$ and $q$ and computes $n=pq$.
2. Nikita computes a random integer $e < n$.
3. Nikita computes an integer $d$ such that $ed\equiv 1\pmod{(p-1)(q-1)}$.
4. Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).
4. To send Nikita a secret message, Alex encodes it as an integer $m < n$, and send her $m^e\pmod{n}$.
5. Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \pmod{n}$.


This works because of the structure of the group $(\mathbb{Z}/ n\mathbb{Z})^*$.

This setup will last and all messages will stay "unbreakable" so long as nobody else ever figures out how to factor $n$.

<span class="lighten">(Note: on the first episode of *Nikita*, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!  Or maybe his bragging about what he couldn't actually do was in character.)</span>


︡dfd39fd7-6aec-4a15-bca9-916ea8a64f19︡{"html":"<div style=\"width:20%\" class=\"pull-right img-rounded\">\n <img src=\"http://1.bp.blogspot.com/_IBWTFjSJw9k/TM6rLOwEn0I/AAAAAAAAAHg/Bw9aNRJIsf4/s1600/Nikita-Dell-Computer.jpg\">\n </div>\n\n<h2>RSA!</h2>\n\n<ol>\n<li>Nikita chooses two random large prime numbers $p$ and $q$ and computes $n=pq$.</li>\n<li>Nikita computes a random integer $e &lt; n$.</li>\n<li>Nikita computes an integer $d$ such that $ed\\equiv 1\\pmod{(p-1)(q-1)}$.</li>\n<li>Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).</li>\n<li>To send Nikita a secret message, Alex encodes it as an integer $m &lt; n$, and send her $m^e\\pmod{n}$.</li>\n<li>Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \\pmod{n}$.</li>\n</ol>\n\n<p>This works because of the structure of the group $(\\mathbb{Z}/ n\\mathbb{Z})^*$.</p>\n\n<p>This setup will last and all messages will stay &#8220;unbreakable&#8221; so long as nobody else ever figures out how to factor $n$.</p>\n\n<p><span class=\"lighten\">(Note: on the first episode of <em>Nikita</em>, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!  Or maybe his bragging about what he couldn&#8217;t actually do was in character.)</span></p>\n"}︡
︠2628f39c-2ac4-4c37-88cf-c372488e231d︠

# Let's implement this: how?
︠fca8f3be-d11d-4a08-9397-2d2b2a240a08︠
import random
p = next_probable_prime(random.randint(0,10^20)); p
︡39881fb3-8e53-4245-82b6-7256a9d52344︡{"stdout":"959157273809290579\n"}︡
︠921804df-1732-4472-886d-559be26764c5︠
q = next_probable_prime(random.randint(0,10^20)); q
︡cee514b3-5b48-46d7-aec3-4f9b980e1166︡{"stdout":"15430579968999736811\n"}︡
︠f2c54ea8-4247-4531-a438-c1f392bf4317︠
n = p*q; n
︡7fe80956-59ad-4a76-8ed4-bb2ed03e78c2︡{"stdout":"14800353016362035094774075457621803569\n"}︡
︠d953d2a6-9356-44b4-9e69-b1a066efed9f︠
factor(n)
︡bab2cd5f-25f3-4dd4-9bd6-51e74205ea5c︡{"stdout":"959157273809290579 * 15430579968999736811\n"}︡
︠2cb14fcc-35e5-4188-bad8-8e2e9dd49ae2︠
e = random.randint(0,n); e
︡45490f99-f773-4d30-b0f8-4ab97f07a464︡{"stdout":"11993200601992637799154177222176339731L\n"}︡
︠a0363b64-1991-4148-be72-03812a237a46︠
phi_n = (p-1)*(q-1); phi_n
︡964e6286-8a47-4bf0-a952-a7c48eb6e309︡{"stdout":"14800353016362035078384338214812776180\n"}︡
︠7f4525a1-04be-4893-9a8a-7f7b73ce6ea4︠
d = int(Mod(e, phi_n)^(-1)); d
︡1bc07329-f7aa-4591-99f9-74a44d289b6e︡{"stdout":"8424061086750187365745922783058859091L\n"}︡
︠39e393c5-3398-4e56-aec2-4f19534a8908︠
e*d % phi_n
︡0fc7728d-833a-4146-ac4f-2aefc40d047c︡{"stdout":"1\n"}︡
︠43556ae5-9680-46e3-adc7-d7fed7666ab5︠
(n,e)
︡2c8d2889-b60d-4cf1-8de9-8587b2c1aaa0︡{"stdout":"(14800353016362035094774075457621803569, 11993200601992637799154177222176339731L)\n"}︡
︠cabaf9c4-b5c6-4f7a-b8c4-4f9d645f1606︠
m = 1234567
cipher = Mod(m, n)^e; cipher
︡b237d011-94b0-4d72-8343-27e83ac97243︡{"stdout":"13466136204973946434125177853984454800\n"}︡
︠339127e6-f7db-49c5-be88-be69099113cf︠
cipher ^ d
︡2e2b4a77-240b-4df7-8116-b9df7877f955︡{"stdout":"1234567\n"}︡
︠75c91531-f22e-498f-856e-40c13953c3d8︠

︠e33d30d9-fb32-494f-96a7-c7d47ccac6b5︠




︠33e38485-847f-4076-9c6d-69bb4db7d4db︠

︠6d712f28-4ce6-460b-8616-103d280f4134i︠
%hide
%md

# Overview of Cryptography in Sage

 1. It is easy to implement standard public-key systems, but whatever you do is likely to have subtle issues, so watch out.  Use these to learn and understand, not for real life applications.

 2. There are 10 publications with the word "cryptography" involving Sage here: <http://www.sagemath.org/library-publications.html>.

 3. Sage ships with [PyCrypto](https://www.dlitz.net/software/pycrypto/), whose goal is: "The Python cryptography toolkit is intended to provide a reliable and stable base for writing Python programs that require cryptographic functions."  Thus PyCrypto is optimized and meant for serious work -- it's *not* a toy.




︡358f64dc-033b-46b4-b7ae-8c93a8557ed8︡{"html":"<h1>Overview of Cryptography in Sage</h1>\n\n<ol>\n<li><p>It is easy to implement standard public-key systems, but whatever you do is likely to have subtle issues, so watch out.  Use these to learn and understand, not for real life applications.</p></li>\n<li><p>There are 10 publications with the word &#8220;cryptography&#8221; involving Sage here: <a href=\"http://www.sagemath.org/library-publications.html\">http://www.sagemath.org/library-publications.html</a>.</p></li>\n<li><p>Sage ships with <a href=\"https://www.dlitz.net/software/pycrypto/\">PyCrypto</a>, whose goal is: &#8220;The Python cryptography toolkit is intended to provide a reliable and stable base for writing Python programs that require cryptographic functions.&#8221;  Thus PyCrypto is optimized and meant for serious work &#8211; it&#8217;s <em>not</em> a toy.</p></li>\n</ol>\n"}︡
︠a404c405-ed3a-4e86-86a1-1d93c99e54c7i︠
%hide
%md
# PyCrypto (comes with Sage!)
### by Dwayne C. Litzenberger
### <https://www.dlitz.net/software/pycrypto/>



#### Some Author Warnings:

 - "Many of these algorithms are patented. Before using any of them in a commercial product, consult a patent attorney; you may have to arrange a license with the patent holder."
 - "Unfortunately, cryptography software is still governed by arms control regulations in Canada, the United States, and elsewhere..."

 #### What it Does

  - Implements RSA and some other public-key algorithms.  This is meant to be used.
  - Implements cryptographic hash functions, e.g., SHA1, MDA5, etc.
  - Implements symmetric ciphers such as Blowfish, DES3, AES, etc.

Let's take it for a while and see how to really encrypt actual sentences...
︡17122bcd-e66a-4733-a7e9-e299d2635315︡{"html":"<h1>PyCrypto (comes with Sage!)</h1>\n\n<h3>by Dwayne C. Litzenberger</h3>\n\n<h3><a href=\"https://www.dlitz.net/software/pycrypto/\">https://www.dlitz.net/software/pycrypto/</a></h3>\n\n<h4>Some Author Warnings:</h4>\n\n<ul>\n<li>&#8220;Many of these algorithms are patented. Before using any of them in a commercial product, consult a patent attorney; you may have to arrange a license with the patent holder.&#8221;</li>\n<li><p>&#8220;Unfortunately, cryptography software is still governed by arms control regulations in Canada, the United States, and elsewhere&#8230;&#8221;</p>\n\n<h4>What it Does</h4>\n\n<ul>\n<li>Implements RSA and some other public-key algorithms.  This is meant to be used.</li>\n<li>Implements cryptographic hash functions, e.g., SHA1, MDA5, etc.</li>\n<li>Implements symmetric ciphers such as Blowfish, DES3, AES, etc.</li>\n</ul></li>\n</ul>\n\n<p>Let&#8217;s take it for a while and see how to really encrypt actual sentences&#8230;</p>\n"}︡
︠eaebed32-8b47-417f-9a6e-8ba91efd2403i︠
%hide
%md
## Example: Computing an MD5 Hash

> "Hash functions take arbitrary strings as input, and produce an output of fixed size that is dependent on the input.  Hash functions can be used simply as a checksum, or, in association with a public-key algorithm, can be used to implement digital signatures."

︡c79e360a-609c-40dc-854d-ba0e1ceefcdf︡{"html":"<h2>Example: Computing an MD5 Hash</h2>\n\n<blockquote>\n  <p>&#8220;Hash functions take arbitrary strings as input, and produce an output of fixed size that is dependent on the input.  Hash functions can be used simply as a checksum, or, in association with a public-key algorithm, can be used to implement digital signatures.&#8221;</p>\n</blockquote>\n"}︡
︠44169469-73e5-42ea-b9df-10de35981773︠
import Crypto.Hash; help(Crypto.Hash)
︡83b27958-f42c-4029-99e1-bb82e2e20501︡{"stdout":"Help on package Crypto.Hash in Crypto:\n\nNAME\n    Crypto.Hash - Hashing algorithms\n\nFILE\n    /usr/local/sage/sage-5.9/local/lib/python2.7/site-packages/Crypto/Hash/__init__.py\n\nDESCRIPTION\n    Hash functions take arbitrary strings as input, and produce an output\n    of fixed size that is dependent on the input; it should never be\n    possible to derive the input data given only the hash function's\n    output.  Hash functions can be used simply as a checksum, or, in\n    association with a public-key algorithm, can be used to implement\n    digital signatures.\n    \n    The hashing modules here all support the interface described in PEP\n    247, \"API for Cryptographic Hash Functions\".\n    \n    Submodules:\n    Crypto.Hash.HMAC          RFC 2104: Keyed-Hashing for Message Authentication\n    Crypto.Hash.MD2\n    Crypto.Hash.MD4\n    Crypto.Hash.MD5\n    Crypto.Hash.RIPEMD160\n    Crypto.Hash.SHA\n\nPACKAGE CONTENTS\n    HMAC\n    MD2\n    MD4\n    MD5\n    RIPEMD\n    RIPEMD160\n    SHA\n    SHA256\n\nDATA\n    __all__ = ['HMAC', 'MD2', 'MD4', 'MD5', 'RIPEMD', 'RIPEMD160', 'SHA', ...\n    __revision__ = '$Id$'\n\n"}︡{"stdout":"\n"}︡
︠8d9383de-3090-4086-bfac-07e7b789f359︠
from Crypto.Hash import MD5
m = MD5.new()
m.update('Nikita, they are going to assassinate the Prince of Georgia at a museum gala!')
m.hexdigest()
︡1a094072-89fd-47a8-9c5b-fc9a9045e55e︡{"stdout":"'cebb15dffc6f22a5db3f353d25177656'\n"}︡
︠e034ec08-2f11-47a6-b208-800d8a3d3222︠
m.digest()
︡79bd2d76-9e9a-4f33-abfa-ff8bb81672fd︡{"stdout":"'\\xce\\xbb\\x15\\xdf\\xfco\"\\xa5\\xdb?5=%\\x17vV'\n"}︡
︠0ec7859d-038a-4a68-af5b-8223d82d853a︠

︠2cd50066-eba1-4676-ad07-a61cbe8e92b7︠
%timeit
m = MD5.new()
m.update('Nikita, they are going to assassinate the Prince of Georgia at a museum gala!')
m.hexdigest()
︡547dd208-2822-49df-b24a-bb0f0bdbb492︡{"stdout":"625 loops, best of 3: 2.83 µs per loop"}︡{"stdout":"\n"}︡
︠2a7e5b0c-c420-413c-ad34-e355f13c71f8i︠

%hide
%md
## Example: Encrypt a Message Using AES

> "Encryption algorithms transform their input data, or plaintet, in some way that is dependent on a variable key, producing ciphertet. This transformation can easily be reversed, if (and, hopefully, only if) one knows the key. "

Also:

> "AES, the Advanced Encryption Standard, was chosen by the US National Institute of Standards and Technology from among 6 competitors, and is probably your best choice. It runs at 7060 K/sec, so it's among the faster algorithms around."
︡34b7f8e7-5b58-41b4-b775-411c374b6a30︡{"html":"<h2>Example: Encrypt a Message Using AES</h2>\n\n<blockquote>\n  <p>&#8220;Encryption algorithms transform their input data, or plaintet, in some way that is dependent on a variable key, producing ciphertet. This transformation can easily be reversed, if (and, hopefully, only if) one knows the key. \"</p>\n</blockquote>\n\n<p>Also:</p>\n\n<blockquote>\n  <p>&#8220;AES, the Advanced Encryption Standard, was chosen by the US National Institute of Standards and Technology from among 6 competitors, and is probably your best choice. It runs at 7060 K/sec, so it&#8217;s among the faster algorithms around.&#8221;</p>\n</blockquote>\n"}︡
︠8c7173a2-58da-4f01-9cce-5ead9863ff66︠
import Crypto.Cipher; help(Crypto.Cipher)
︡1a65d49d-b433-4c94-9d93-8d16649b48fa︡{"stdout":"Help on package Crypto.Cipher in Crypto:\n\nNAME\n    Crypto.Cipher - Secret-key encryption algorithms.\n\nFILE\n    /usr/local/sage/sage-5.9/local/lib/python2.7/site-packages/Crypto/Cipher/__init__.py\n\nDESCRIPTION\n    Secret-key encryption algorithms transform plaintext in some way that\n    is dependent on a key, producing ciphertext. This transformation can\n    easily be reversed, if (and, hopefully, only if) one knows the key.\n    \n    The encryption modules here all support the interface described in PEP\n    272, \"API for Block Encryption Algorithms\".\n    \n    If you don't know which algorithm to choose, use AES because it's\n    standard and has undergone a fair bit of examination.\n    \n    Crypto.Cipher.AES         Advanced Encryption Standard\n    Crypto.Cipher.ARC2        Alleged RC2\n    Crypto.Cipher.ARC4        Alleged RC4\n    Crypto.Cipher.Blowfish\n    Crypto.Cipher.CAST\n    Crypto.Cipher.DES         The Data Encryption Standard.  Very commonly used\n                              in the past, but today its 56-bit keys are too small.\n    Crypto.Cipher.DES3        Triple DES.\n    Crypto.Cipher.XOR         The simple XOR cipher.\n\nPACKAGE CONTENTS\n    AES\n    ARC2\n    ARC4\n    Blowfish\n    CAST\n    DES\n    DES3\n    XOR\n\nDATA\n    __all__ = ['AES', 'ARC2', 'ARC4', 'Blowfish', 'CAST', 'DES', 'DES3', '...\n    __revision__ = '$Id$'\n\n\n"}︡
︠88ea835a-cf64-4043-90c5-76550362b3b2︠
from Crypto.Cipher import AES
obj   = AES.new('abcdefghijklmnop', AES.MODE_ECB)
plain = "Nikita, they are going to assassinate the Prince of Georgia at a museum gala!"
secret = obj.encrypt(plain)
︡59670f08-7c3d-4fc9-9f57-b5000235901f︡{"stderr":"Error in lines 4-4\nTraceback (most recent call last):\n  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n    exec compile(block, '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\nValueError: Input strings must be a multiple of 16 in length\n"}︡
︠df91d35b-dbfc-4c18-83ce-fcc944695cb0︠
plain += " "*(16 - len(plain)%16)
len(plain)   # must be a multiple of 16
︡81fdbc38-9ed8-4be8-9cbf-ea12e378b307︡{"stdout":"80\n"}︡
︠6c10fbe3-3f04-45fa-b760-c39241b79138︠
ciph = obj.encrypt(plain); ciph
︡103de8bd-dd56-4d0d-a982-5e902283a8fa︡{"stdout":"'@\\xd5\\x94\\xc1?Q\\x8dQDw\\xba\\x90\\xd9o\\xec\\xb9E}\\x84\\xb3\\xaa\\xd0\\xc7\\xa4g\\x95\\xb0\\xdeR7-\\x0b\\x19\\xac\\x94\\xc9\\xcaPfVu\\xc6\\t\\xb0Bn\\xc4\\xf9\\x03m\\x06\\x99!\\xd0\\xd8\\x10v}\\xc7\\xa5\\x98IDS\\x03\\xd6\\x82_\\xa0\\xed\\xc3w7\\x9c6\\x1d\\xe8\\xcc\\xd5m'"}︡{"stdout":"\n"}︡

︠afee0c10-335c-42b0-86d6-8a37ce2de878︠
len(ciph)
︡6348f7e8-aa35-4825-ab1a-405f2721b011︡{"stdout":"80"}︡{"stdout":"\n"}︡
︠66dbdd23-7ff4-4da3-83d9-6066a411eb96︠
obj.decrypt(ciph)
︡9edc41d6-eff7-4433-8245-e8f0206fdb99︡{"stdout":"'Nikita, they are going to assassinate the Prince of Georgia at a museum gala!   '"}︡{"stdout":"\n"}︡
︠944a08df-2180-4cc2-bd44-175d6da64b67︠
type(ciph)
︡be3061fb-8094-4ac6-b5cd-3fc8348eebef︡{"stdout":"<type 'str'>"}︡{"stdout":"\n"}︡
︠04378145-5326-4b64-84e7-f7c7bee10fd7i︠
%md
## Encrypt using RSA
︡bbb9ceee-395e-4314-88be-bf9949cdab14︡{"html":"<h2>Encrypt using RSA</h2>\n"}︡
︠c242e57e-594a-47fa-9e13-4ff5c1df0110︠

from Crypto.PublicKey import RSA
rsa = RSA.generate(int(2048))
rsa
︡b6c66d7a-c55b-4234-8cc1-d5ef5882680a︡{"stdout":"<_RSAobj @0x62093b0 n(2048),e,d,p,q,u,private>\n"}︡
︠48478c76-6b64-4a77-9b18-ced60067d8cc︠
rsa.e
︡fcf42ca5-c475-42b4-9a04-87454eea09ab︡{"stdout":"65537L\n"}︡
︠852f7d87-5050-4a60-8ebb-c72596b415b7︠
rsa.d
︡a475b9b7-b925-43d4-82dd-cfe836a3aba7︡{"stdout":"8346685133844443041796624308981933905385200816198658354040547064679592685484287047168016642660156836563198196812826092554682408853322603345010930084541997098499486012302104197878226903820991185233575645730604084422376173753723313230700054549648037540326255673338233312785695612779519474174468460351859709696379484518776807289036523166781575414441825310486925604870941358405690738057005067867388835163107776928192654679377469096228990108155753403609144562781386754693793397563026155751974693584832099656286043971202987573915438706579946972164382602354488946394241058764631316840143276099028934000847504529380142269889L\n"}︡
︠4b884efc-5edd-425c-9e16-0b6f01720985︠
rsa.p
︡29b05741-6fbd-4872-91fd-48e348516584︡{"stdout":"100949641525458239997865258236836129778911244544437801870282083647069561072728093853026580058295882176531155460947069154011353221166127012108804759578368653142797574158360043323685919728406084290592507249597143916252635081552877461733877040897577906108096465247047329839914783298955146577252832840234572839649L\n"}︡
︠80e54e0f-bcf8-4cd3-9f9a-33569bbd1893︠
rsa.q
︡9a2027fd-fc5b-467e-a707-e86037493cc7︡{"stdout":"166676329133269262066533920981488505146325351031393682268574740013854853496874452121638519081074421580689444758574727764283577861223738540688592634687728583365264196653945869800808338616401605542731397754941513291272748073324466334755752867839357849461567538725532925318755818321107578830643719205108209252237L\n"}︡
︠1666582e-474a-498f-a9f5-e5338f5a5e63︠
plain
︡21d17483-37b1-46b9-8c38-67b0f0caa4e1︡{"stdout":"'Nikita, they are going to assassinate the Prince of Georgia at a museum gala!   '\n"}︡
︠174ee5d1-0a69-4678-99b1-89d3684d0fb4︠
ciph = rsa.encrypt(plain, 0); ciph
︡e50a7028-30b3-46e2-8c5a-d0367233cfd1︡{"stdout":"('U\\xfa:\\x0b\\xd2\\xf5)\\x1dn|$\\x8c0\\xdc\\x83\\x11\\xecgm.\\xed\\x14\\x17\\x19\\xd5\\xce9\\xd8%\\xaf\\xb5xN\\xe0\\x99T\\xf5\\xfdx\\xad\\xafS&b\\xc6\\x830\\xa6\\x98\\xce\\xef\\x14\\x86\\x00\\xe5\\x05\\x87N\\x1a\\x11\\x01\\xce\\xdb\\x08\\x82\\x01Y\\x9a\\xb4\\xd4\\xaa\\xa13\\xae\\x94cg\\xe7\\xfe\\n\\xcc\\x13\\xf7\\x92\\xe8\\x87\\xb4O\\x9f\\xa8\\xb9A\\x9e\\x0f\\x8e\\xe8\\xc9\\x92\\xc3\\\\\\x8c\\x1a\\xe0\\xfa1\\xdd\\xe8h\\xae\\xd8\\x82\\xac\\xba(V?k\\x95\\x84\\xeaF\\xcb1\\xc3EC\\t\\xcaMF[~c\\x8c\\x04\\x08p\\x8a\\xf2\\x85\\x91\\xcdp\\x06\\x12<\\x8a9\\xc6/\\xb3\\xf8\\xa8g\"\\xe5\\xceKP\\x03zl\\x8eMs\\x9f\\xf8[vP$^\\x8f\\xfdI\\xb5\\x91\\xb4\\x92\\x0fM&U\\x89\\xa7\\xa0\\xbeyBt6\\xab\\x98\\xcb\\xaa\\x82*\\xd0sK\\x82Y\\xa1T\\x98V\\xa1\\x0f\\xbf\\x91\\xee\\xa4\\xdf\\x92\\x99\\x06V\\x9a\\xaa\\xefGKX9\\xa8\\x8e\\n\\xb5\\x89\\xac\\xc5\\xa2\\x89\\x1cI\\xd1\\r_E6\\xc0\\x99\\x8d>6\\x191\\x83\\x07\\xdb\\xee1\\n\\xce.8',)\n"}︡
︠021a4598-6640-414d-8ba2-7c06232ed5ee︠
rsa.decrypt(ciph)
︡b0699ccf-6871-4f1b-a175-01b07fca4100︡{"stdout":"'Nikita, they are going to assassinate the Prince of Georgia at a museum gala!   '\n"}︡
︠139c9730-d5fb-44fe-bc63-fef9dacb7068︠


