︠d29f5555-88a9-4e03-b167-55ddcd1857fdi︠
%hide
%md

# Lecture 15: Some Public-Key Cryptography

1. Remember to start G+ recorder
2. Questions?
3. public-key crypto
︡e1d69277-66ea-4ca5-a465-675e55f0e5df︡{"html":"<h1>Lecture 15: Some Public-Key Cryptography</h1>\n\n<ol>\n<li>Remember to start G+ recorder</li>\n<li>Questions?</li>\n<li>public-key crypto</li>\n</ol>\n"}︡
︠a7f27611-4038-4708-8dbd-a2ccc6c49e48oi︠
%hide
%md

### Different style today

- I'm going to describe the Diffie-Hellman key exchange mathematically, then together we
  will step-by-step figure out how to implement this from scratch in Sage.

- Then we'll do the same with RSA.
︡97cd447e-f75c-4ee5-9e74-bc4e242a99d8︡{"html":"<h3>Different style today</h3>\n\n<ul>\n<li><p>I&#8217;m going to describe the Diffie-Hellman key exchange mathematically, then together we\nwill step-by-step figure out how to implement this from scratch in Sage.</p></li>\n<li><p>Then we&#8217;ll do the same with RSA.</p></li>\n</ul>\n"}︡
︠dd49a57a-f6a0-486c-a6de-a5d5ee3debb3︠
2+2
︡d139a2b6-eb43-4b24-8054-666ae0da66f5︡{"stdout":"4"}︡{"stdout":"\n"}︡
︠a5c18630-1c5a-4778-b4c4-99adacd653f3i︠
%hide
%md
# The Diffie-Hellman key exchange

- Diffie-Hellman is a seemingly trivial observation that *changed the world*.

- It shocked people.  It was at first not believed possible!

- For many millenia, people have used a vast range of methods for sharing secrets, political intrigue, shaved/tatooed heads, ciphers, enigma machines, couriers, etc....

- Today, one little observation involving arithmetic with numbers modulo $n$ completely renders all of that defunct.

- This little idea makes buying things on a computer *possible*.   If you visit a URL that has "https:" in it, then you probably using either Diffie-Hellman (or RSA).  See <http://security.stackexchange.com/questions/20803/how-does-ssl-work>.


︡92b4f1f9-3cf0-4124-950b-56471d298a1a︡{"html":"<h1>The Diffie-Hellman key exchange</h1>\n\n<ul>\n<li><p>Diffie-Hellman is a seemingly trivial observation that <em>changed the world</em>.</p></li>\n<li><p>It shocked people.  It was at first not believed possible!</p></li>\n<li><p>For many millenia, people have used a vast range of methods for sharing secrets, political intrigue, shaved/tatooed heads, ciphers, enigma machines, couriers, etc&#8230;.</p></li>\n<li><p>Today, one little observation involving arithmetic with numbers modulo $n$ completely renders all of that defunct.</p></li>\n<li><p>This little idea makes buying things on a computer <em>possible</em>.   If you visit a URL that has &#8220;https:&#8221; in it, then you probably using either Diffie-Hellman (or RSA).  See <a href=\"http://security.stackexchange.com/questions/20803/how-does-ssl-work\">http://security.stackexchange.com/questions/20803/how-does-ssl-work</a>.</p></li>\n</ul>\n"}︡
︠5b561bba-8f02-46d7-98c0-e16732b5560ci︠
%hide
%html
<img src="http://images.buddytv.com/articles/Nikita%203-16.jpg" class="pull-right img-rounded" style="width:30%;">

︡13b8254c-25cd-45b7-97cd-8ec08954949e︡{"html":"<img src=\"http://images.buddytv.com/articles/Nikita%203-16.jpg\" class=\"pull-right img-rounded\" style=\"width:30%;\">"}︡
︠0564e221-dbd2-4db6-ad0b-86d52c941eebi︠
%hide
%md
## Diffie-Hellman: here it is


Problem: Suppose Michael and Nikita would like to both know a shared random number, which they can both use to encrypt messages to each other.  Unfortunately, **all** of their communications are being closely watched.

1. Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)

2. Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number
$2^m\pmod{p}$.

3. Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\pmod{p}$.

4. Both Michael and Nikita can now **easily** compute $2^{mn}\pmod{p}$, but nobody else can.  This
is because $2^{mn} = (2^m)^n = (2^n)^m$.




That nobody else can compute $2^{mn} \pmod{p}$ easily is an "article of faith among cryptographers".  This is the discrete log problem: given $2^n\pmod{p}$, find $n = \log_2(2^n\pmod{p})$.







︡b40f3860-6dec-4927-9dd9-be1e55ab8354︡{"html":"<h2>Diffie-Hellman: here it is</h2>\n\n<p>Problem: Suppose Michael and Nikita would like to both know a shared random number, which they can both use to encrypt messages to each other.  Unfortunately, <strong>all</strong> of their communications are being closely watched.</p>\n\n<ol>\n<li><p>Michael and Nikita agree on a large random prime number $p$.  (Everybody knows $p$.)</p></li>\n<li><p>Michael secretly generates a random number $m$ and computes then messages Nikita (and hence everybody) the number\n$2^m\\pmod{p}$.</p></li>\n<li><p>Nikita secretly generates a random number $n$ and computes then messages Michael (hence everybody) the number $2^n\\pmod{p}$.</p></li>\n<li><p>Both Michael and Nikita can now <strong>easily</strong> compute $2^{mn}\\pmod{p}$, but nobody else can.  This\nis because $2^{mn} = (2^m)^n = (2^n)^m$.</p></li>\n</ol>\n\n<p>That nobody else can compute $2^{mn} \\pmod{p}$ easily is an &#8220;article of faith among cryptographers&#8221;.  This is the discrete log problem: given $2^n\\pmod{p}$, find $n = \\log_2(2^n\\pmod{p})$.</p>\n"}︡
︠9e6764d8-5e9d-4b48-b407-c5b5520e1c18︠
p = next_probable_prime(10^70)
factor(p-1)
︡40b6bb0e-f62f-4712-b985-2a72040bf811︡{"stdout":"2^5 * 3 * 11 * 89 * 251 * 162054121 * 746079353 * 125460772595441 * 27945976855626188512571872291931"}︡{"stdout":"\n"}︡
︠165f8ab3-0b72-4a56-96a1-eb42485f0efa︠
# Let's implement this: how?

p = 169743212279
is_prime(p)
︡82393ec3-a731-4791-8d52-7ce63048970c︡{"stdout":"True"}︡{"stdout":"\n"}︡
︠4d9ecea2-2839-46b0-8f01-9c136bcdc467︠
m = 9234809
step2 = Mod(2,p)^m; step2
︡d08ed72c-0f9a-4bc8-ae16-c307128daf93︡{"stdout":"47624385116"}︡{"stdout":"\n"}︡
︠e50a9124-35b2-4fbf-aa05-7de973d6f88d︠
n = 298374
step3 = Mod(2,p)^n; step3
︡ed95796a-f0af-4911-95a4-dcf79ea7a15c︡{"stdout":"123072258681"}︡{"stdout":"\n"}︡
︠5b038534-4944-44d0-8cad-727d9541f968︠
step4_m = step3^m
step4_n = step2^n
︡71b6526c-d2e2-410a-8f6e-559c487673c5︡
︠095f3dc6-0a24-4e4b-b7ee-1604496b917d︠
step4_m
step4_n
︡368de1cd-8dc1-4dd1-9411-578ce6cf76f0︡{"stdout":"19250149929"}︡{"stdout":"\n"}︡{"stdout":"19250149929"}︡{"stdout":"\n"}︡
︠6d6f9bfe-b9bb-4a01-a1d3-4b550eeca25a︠





︠3304677b-4ec5-4069-8245-594a146e9a8b︠











