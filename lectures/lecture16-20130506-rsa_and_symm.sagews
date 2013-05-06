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
︠1d0cae8b-b24c-4675-8271-c11bbca23c3c︠

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
3. Nikita computes an integer $d$ such that $ed\equiv 1\pmod{p-1}{q-1}$.
4. Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).
4. To send Nikita a secret message, Alex encodes it as an integer $m < n$, and send her $m^e\pmod{n}$.
5. Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \pmod{n}$.


This works because of the structure of the group $(\mathbb{Z}/ n\mathbb{Z})^*$.

This setup will last and all messages will stay "unbreakable" so long as nobody else ever figures out how to factor $n$.

<span class="lighten">(Note: on the first episode of *Nikita*, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!  Or maybe his bragging about what he couldn't actually do was in character.)</span>


︡f85cc5ea-97b4-4ead-a872-e0781b459cce︡{"html":"<div style=\"width:20%\" class=\"pull-right img-rounded\">\n <img src=\"http://1.bp.blogspot.com/_IBWTFjSJw9k/TM6rLOwEn0I/AAAAAAAAAHg/Bw9aNRJIsf4/s1600/Nikita-Dell-Computer.jpg\">\n </div>\n\n<h2>RSA!</h2>\n\n<ol>\n<li>Nikita chooses two random large prime numbers $p$ and $q$ and computes $n=pq$.</li>\n<li>Nikita computes a random integer $e &lt; n$.</li>\n<li>Nikita computes an integer $d$ such that $ed\\equiv 1\\pmod{p-1}{q-1}$.</li>\n<li>Nikita tells everybody $n$ and $e$, but deletes $p$ and $q$, and keeps $d$ secret (memorized).</li>\n<li>To send Nikita a secret message, Alex encodes it as an integer $m &lt; n$, and send her $m^e\\pmod{n}$.</li>\n<li>Nikita later decrypts a secret message $m$ by computing $m = (m^e)^d \\pmod{n}$.</li>\n</ol>\n\n<p>This works because of the structure of the group $(\\mathbb{Z}/ n\\mathbb{Z})^*$.</p>\n\n<p>This setup will last and all messages will stay &#8220;unbreakable&#8221; so long as nobody else ever figures out how to factor $n$.</p>\n\n<p><span class=\"lighten\">(Note: on the first episode of <em>Nikita</em>, a character named Birkhoff claims he can hack any encryption quickly, etc.,  but on many subsequent episodes he is completely unable to hack many different types of encryption.  Maybe the writers hired a less clueless technical consultant!  Or maybe his bragging about what he couldn&#8217;t actually do was in character.)</span></p>\n"}︡
︠2628f39c-2ac4-4c37-88cf-c372488e231d︠

# Let's implement this: how?















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
︡b1aa43dc-b99f-473e-8000-4c8cedc32eb0︡{"stdout":"'cebb15dffc6f22a5db3f353d25177656'"}︡{"stdout":"\n"}︡
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
︡bf13d0f8-19d5-472b-9c5e-4252b3a2e68d︡
︠8c7173a2-58da-4f01-9cce-5ead9863ff66︠
import Crypto.Cipher; help(Crypto.Cipher)
︡d7ad80f4-bce8-47ca-89ff-25087a3bf2ec︡
︠88ea835a-cf64-4043-90c5-76550362b3b2︠
from Crypto.Cipher import AES
obj   = AES.new('abcdefghijklmnop', AES.MODE_ECB)
plain = "Nikita, they are going to assassinate the Prince of Georgia at a museum gala!"
secret = obj.encrypt(plain)
︡3c00ea11-a1c7-4134-9936-9b0b3124f0a6︡{"stderr":"Error in lines 4-4\n"}︡{"stderr":"Traceback (most recent call last):\n"}︡{"stderr":"  File \"/mnt/home/D6VXKxGo/.sagemathcloud/sage_server.py\", line 412, in execute\n"}︡{"stderr":"    exec compile(block, '', 'single') in namespace, locals\n"}︡{"stderr":"  File \"\", line 1, in <module>\n"}︡{"stderr":"ValueError: Input strings must be a multiple of 16 in length\n"}︡
︠df91d35b-dbfc-4c18-83ce-fcc944695cb0︠
plain += " "*(16 - len(plain)%16)
len(plain)   # must be a multiple of 16
︡02942042-586a-4538-bcaa-bcf2f8c70dd2︡{"stdout":"80"}︡{"stdout":"\n"}︡
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
︠04378145-5326-4b64-84e7-f7c7bee10fd7︠


︠2a7e5b0c-c420-413c-ad34-e355f13c71f8︠
%hide
%md
## Example: Encrypt a Messge Using RSA

> "A problem: you my wnt encryption to communicte sensitive dt over n insecure chnnel, but how cn you tell your correspondent wht the key is? You cn't just e-mil it to her becuse the chnnel is insecure. One solution is to rrnge the key vi some other wy: over the phone or by meeting in person.  Another solution is to use public-key cryptogrphy."

︡08a98197-16ca-49a1-8853-d1e811ab9b1d︡
︠8c7173a2-58da-4f01-9cce-5ead9863ff66x︠
import Crypto.PublicKey; help(Crypto.PublicKey)
︠a28ac681-5ed0-4019-8922-aed608ac0995︠


















