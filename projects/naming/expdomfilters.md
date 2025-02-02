Domain Name Pattern Filter Explained
Explanation on how the Domain Name Pattern Filter works
Introduction
The pattern filter can be a very powerful tool in finding good domains. It uses regular expressions to find domains that match your specified pattern without you having to try out every possible combination yourself. You can use it to find pronounceable domains, similar domains to a name you like or repetitions of characters and numbers.

The domain name has to match your pattern 100%. The pattern filter does NOT do starts with / ends with or contains searches! If you enter a 4 letter pattern, you will only see domains with a length that is exactly 4!

You can use "^" somewhere in your pattern to switch the search mode to starts with. A pattern like "^CVCV" would find Rare.com and RareSomethingElse123.com. The position of the "^" doesn't matter. "^CVCV" works the same as "CVCV^" or "CV^CV".

You can use the allowlist filter to find domains matching your pattern, but you can also use the blocklist filter to define pattern for domains you do not want to see. Both filter fields can handle up to 15 pattern at a time, separated with a space. i.e. "CVCV CVVC CCVV" without the quotes. The pattern are combined with an OR, so you will see all domains matching one of your pattern.

Regular expressions are a mighty set of functions, but they are extremely hard to read and write. That is why the pattern filter uses a fixed set of characters, representing groups of letters and numbers. When you combine them together you get a pattern. The pattern represents all possible combinations and it will show you all matching domains currently in the list.

Possible characters representing character groups
These are the possible characters you can use in a pattern. Every character you use represents one character of the specific group of characters, so if you use a V for example it can represent an A, E, I, O or U.

C = Consonant (BCDFGHJKLMNPQRSTVWXYZ)
V = Vowel (AEIOU)
L = Letter (Any Letter)
N = Number (0123456789)
P = ChiP - Chinese Premium (All Letters except V and Vowels A, E, I, O, U)
W = Western Premium (All Letters except J, K, Q, U, V, W, X, Y and Z)
- = Hyphen
* = Anything (Letter or Number or Hyphen)
A, B, H, K = Letter Repetition (ABCDEFGHIJKLMNOPQRSTUVWXYZ)
D, E, F, G = Number Repetition (0123456789)
M, O = Vowel Repetition (AEIOU)
U, X = Consonant Repetition (BCDFGHJKLMNPQRSTVWXYZ)
^ = Switch Pattern Search to "Starts With Pattern" Mode
Examples
CVCV -> Rare.com, Dude.com, More.com
CVCVC -> Carol.com, Wonos.com, Japan.com
CVVCCV -> Google.com, Course.com, Lounge.com
CVCVNN -> Name24.com, Live12.com, Zero11.com
NNN -> 123.com, 888.com, 178.com
L*-N* -> Fr-44.com, G1-2a.com, Aa-88.com
Defining exact letters or numbers at specific positions
The pattern characters have to be UPPER CASE to represent a character from the character group. If you use lower case letters or numbers in your pattern, you specify the exact letter or number at this position.

CoCCo -> Fordo.com, Bommo.com, Porto.com
CoCCoN0 -> Fordo20.com, Bommo30.com, Porto40.com
CooCCe -> Google.com, Foodle.com, Toogle.com
8N8N -> 8187.com, 8289.com, 8888.com
wVVCo2N -> Woomo24.com, Waibo21.com, Wuado29.com
Number Repetition
As you probably know, numeric domains are a big thing in China. If you didn't know that and you want to know more, just google "Chinese numbers domain name". Repeating numbers can be very valuable and the 4 letter D, E, F, G can help you find them. There are 4 characters, because if you combine them in one pattern, every character can only represent one specific number that can't be represented by any other following character.

An example might help to understand this crazy sentence. Lets say you have the pattern DEDFF. D could stand for 8, so E and F can't be 8. E can be 2 and that means that F now can't be 8 or 2. It can be any other number except 8 or 2.

If you only want combinations of 2 different numbers, you can use only 2 of these letters. It doesn't matter which 2 you choose. If you are looking for combinations of 3 numbers, you can use 3 and the same goes for 4. The order of the letters doesn't matter. The pattern FGFDD would produce the same results as DEDFF.

Number Repetition Pattern Examples
DEE -> 133.com, 388.com, 299.com
DED -> 131.com, 818.com, 727.com
DEED -> 1881.com, 8118.com, 7227.com
DEDE -> 1818.com, 2626.com, 8383.com
DEFFD -> 18331.com, 71887.com, 81338.com
DDEEFF -> 336688.com, 117733.com, 882211.com
DEDDED -> 818818.com, 181181.com, 262662.com
DDDEEE -> 888111.com, 111888.com, 444777.com
Of course you can also mix in other pattern character groups.
The exclusion of numbers, only effects the repetition groups (D, E, F, G).

DEEDNN -> 188118.com, 188188.com, 188172.com
DEDE0 -> 18180.com, 26260.com, 83830.com
8DEFF -> 81288.com, 81277.com, 81244.com
abcDDFF -> Abc1188.com, Abc2266.com, Abc3399.com
DENNDE -> 816781.com, 819181.com, 812281.com
Letter Repetition
The same works also with letters. You can use A, B, H, K if you want letter repetition somewhere in your pattern.

ABABA -> Fifif.com, Ghghg.com, Klklk.com
woAABB -> Woffaa.com, Woeeii.com, Woddzz.com
CAACBB -> Gaanbb.com, Loopuu.com, Rzzpkk.com
Vowel and Consonant Repetition
This works the same as the letter repetition except the group of letters is limited to vowels or consonants. You can use M, O representing vowels and U, X representing consonants.

MUMUM -> Obobo.com, Imimi.com, Ugugu.com
VUMUM -> Etata.com, Anunu.com, Ibaba.com
CMMCV -> Guumi.com, Guuma.com, Koodu.com
UMMUV -> Moomi.com, Kaako.com, Soosu.com
Combining the Pattern Filter with other Filter
You can of course combine the pattern filter with any other filter you like. For example you can use the Domain Name (un) wanted Chars filter to further limit the possible letters or numbers you want to see. For example if you want numeric repetition DEDEDE, but you do not want any 4 or 7, you can just block these 2 numbers by putting them into the (un) wanted Chars filter blocklist ("47" without the quotes). If you only want combinations or 8, 4 and 1, you can allowlist only these 3 numbers ("841" without the quotes).