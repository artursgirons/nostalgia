USES crt,dos;
VAR
priem,k : longint;
antw : boolean;
m,h,s,hund,m2,s2,hund2,h2 : word;
tot,tot2 : real;
txtfile : text;
FUNCTION multi(mste,mde : string) : string;
LABEL
1;
VAR
ma,mb,mc : array[0..400] of integer;
md,mi,mj,mn,msom,mk,mt,mlen,mercode,moordra,mf,me : integer;
mstr1,msti,mmulti1,mmulti2 : string;
BEGIN
  mt := 400;
  WHILE mt > 0 DO BEGIN
    ma[mt] := 0;
    mb[mt] := 0;
    mc[mt] := 0;
    mt := mt - 1;
  END;
  {cleens the arrays so it can be used next time}
  msti := '';
  msti := mste;
  IF length(mde) > length(mste) THEN
  BEGIN
    mste := mde;
    mde := msti;
  END;
  {Takes the larger number of the two and stores it in mste}
  mlen := length(mste);
  IF length(mde) > mlen THEN
  mlen := length(mde);
  {Gets the length of the largest number}
  mn := mlen;
  {Assigns the length that represents the length of the answer}
  mercode := -16;
  md := 1;
  me := 0;
  IF (mste = '0') OR (mde  = '0') THEN
  BEGIN
    me := 1;
    goto 1;
  END;
 {If one of the numbers are zero a special if stelling is used}
  mstr1 := '';
  WHILE mlen > 0 DO BEGIN
    mstr1 := copy(mste,mlen,1);
    mlen := mlen - 1;
    val(mstr1,ma[md],mercode);
    md := md + 1;
  END;
{Copies the largest number to a variable(in small parts) and swithces
it to an integer and stores it in an array}
  md := 1;
  mlen := length(mde);
  WHILE mlen > 0 DO BEGIN
    mstr1 := copy(mde,mlen,1);
    mlen := mlen - 1;
    val(mstr1,mb[md],mercode);
    md := md + 1;
  END;
{Copies the smallest number to a variable(in small parts) and swithces
it to an integer and stores it in an array}
  mi := 0;
  msom := 0;
  FOR mi := 0 TO 2*mn DO
  BEGIN
    IF mi <= mn THEN
    BEGIN
      FOR mj := mn DOWNTO mn - mi DO
      BEGIN
        msom := msom + ma[2*mn-mi-mj+1] * mb[mj];
      END;
    END
    ELSE
    BEGIN
    FOR mj :=  2*mn-mi DOWNTO 1 DO
    BEGIN
       msom := msom + ma[2*mn-mi-mj+1] * mb[mj];
    END;
    END;
    mc[mi] := msom;
    msom := 0;
  END;
{Multiplies the two arrays by findig their colomn adresses,instead
of computing numbers in rows(long multiplication) it multiplies num-
bers in colomns. It computes all the numbers of each column as well as
the sum of that column before moving on to the next colomn(no carrying
over takes place}
   mk := mI;
   WHILE mi > 0 DO BEGIN
     IF mc[mi] >= 10 THEN BEGIN
       moordra := mc[mi] div 10;
       mc[mi] := mc[mi] mod 10;
       mi := mi - 1;
       mc[mi] := mc[mi] + moordra;
       mi := mi + 1;
     END;
{Carries over tens if the number in the array is = or > than 10}
     mi := mi - 1;
   END;
   mf := 0;
   mmulti2 := '';
   mmulti1 := '';
   WHILE mi < mk DO BEGIN
     IF mc[mi] <> 0 THEN
     mf := 1;
     IF (mc[mi] <> 0) OR (mf = 1) THEN
     BEGIN
       str(mc[mi],mmulti1);
       mmulti2 := mmulti2 + mmulti1;
     END;
{stops the zeros in the array before the first number}
     mi := mi + 1;
{writes the array to the screen}
   END;
   multi := mmulti2;
   1 : IF me = 1 THEN
   BEGIN
     multi := '0';
{if the answer is zero - the if-statements function}
   END;
END;
FUNCTION modul(ste3,de3 : string): string;
LABEL
1;
VAR
ste,de,str1,modul1,modul2 : string;
len,h,d,i,k,e,f,g,len2,len3,j : longint;
s,t : integer;
ercode : integer;
a,b,c : array[1..1000] of integer;
kans : boolean;
BEGIN
  t := 1000;
  i := 0;
  j := 0;
  WHILE t > 0 DO BEGIN
    a[t] := 0;
    b[t] := 0;
    c[t] := 0;
    t := t - 1;
  END;
{cleens the array before using it}
  ste := ste3;
  de := de3;
  ercode := -1;
  len := length(ste);
  d := 1;
  WHILE len > 0 DO BEGIN
    str1 := copy(ste,len,1);
    len := len - 1;
    val(str1,a[d],ercode);
    d := d + 1;
  END;
  e := d;
{Copies the largest number to a variable(in small parts) and swithces
it to an integer and stores it in an array}
  d := 1;
  len := length(de);
  len2 := len;
  len3 := len;
  WHILE len > 0 DO BEGIN
    str1 := copy(de,len,1);
    len := len - 1;
    val(str1,b[d],ercode);
    d := d + 1;
  END;
{Copies the smallest number to a variable(in small parts) and swithces
it to an integer and stores it in an array}
  REPEAT
    j := j + 1;
    FOR k := 1 TO e DO BEGIN
      IF a[k] < b[k] THEN BEGIN
        k := k + 1;
        IF a[k] = 0 THEN BEGIN
          REPEAT
            i := i + 1;
          UNTIL a[k + i] <> 0;
          a[k + i] := a[k + i] - 1;
          i := i - 1;
          WHILE i > 0 DO BEGIN
            a[k + i] := 9;
            i := i - 1;
          END;
          a[k] := 9;
          k := k - 1;
          a[k] := 10 + a[k];
          END
          ELSE
          BEGIN
            a[k] := a[k] - 1;
            k := k - 1;
            a[k] := a[k] + 10;
          END;
        END;
        c[k] := a[k] - b[k];
     END;
{This part subtracts two arrays from eachother,it has if-statements
for lending tens as well as changing a 0 into a 9 if lending 10's from
numbers further in the array}
     f := 0;
     e := k;
     g := 0;
     h := 0;
     modul1 := '';
     modul2 := '';
    WHILE k >= 1 DO
    BEGIN
{stops the first 0's in the array}
    IF (c[k] <> 0) OR (f = 1) THEN
      BEGIN
        h := h + 1;
        a[e] := c[k];
        str(a[e],modul1);
        modul2 := modul2 + modul1;
{converts answers in array to a string}
        f := 1;
      END;
      k := k - 1;
      e := e - 1;
    END;
    e := h;
{These if-statements desides if the mod of the two numbers has been
found}
{For two number strings to be compared they have to be the same length}
    IF length(modul2) = length(de) THEN
    BEGIN
      IF modul2 = de THEN
      BEGIN
{If these numbers are = the loop must stop, the mod is 0}
        kans := false;
        j := j + 1;
        modul2 := '0';
        goto 1;
      END;
      IF modul2 > de THEN
      BEGIN
{If the one number > than the other the mod has not been found and the
loop must continue}
        kans := true;
        goto 1
      END;
      IF modul2 < de THEN
      BEGIN
{If the one number is < than the other the mod has been found and the
loop
must stop}
        kans := false;
        goto 1;
      END;
    END;
{If the one length is greater than the second one the mod has not been
found}
{If the one length is less then the second one the mod has been found}
    IF length(modul2) > length(de) THEN
    BEGIN
      kans := true;
      goto 1;
    END;
    IF length(modul2) < length(de) THEN
    BEGIN
      kans := false;
      goto 1;
    END;
1:UNTIL kans = false;
modul := modul2;
END;
FUNCTION modul_hoof(ste4,de4 : string) : string;
LABEL
1,2,3;
VAR
ste2,de2,antw,deel,de3,deel2 : string;
len4,len5,x : integer;
BEGIN
{The following program works on the principal of long divisian}
{The smallest number is used, The largest number is divided by the
smallest number using long divisian. The largest number is broken into
the smallest part that the smallest number can divide into. Using the
modul function the mod is computed between these two numbers. The mod
is added to the next number in the largest number and the mod of the two

numbers that was formed is computed. and this is repeated until the
mod of the entire calculation is found}
ste2 := ste4;
de2 := de4;
len4 := length(de2);
deel := copy(ste2,1,len4);
{copies the first element of the largest number}
len4 := len4 + 1;
len5 := length(ste2);
{computes the length of both numbers}
{The if statements are divided into three parts :}
{1 : If the lengths are the same Then another two if-statements are
made active :
a : if the one is bigger or = than the second one then the modul
function is actvated}
{b : if the one is smaller than the other one then another piece of the
largest number must be copied(if you want to use this for long divisian
here must come a write 0 an the j counter in the modul function must be
written to the screen)
2 : If the one length is smaller than the other length then the same
must be done as in b
3 : If the one length is larger than the other one then the modul
function
must be activated}
IF (length(deel) = length(de2)) OR (length(deel) = 0) THEN BEGIN
  IF deel < de2 THEN BEGIN
    {The first element is to small that is why there nust be carried
over}
  END;
  IF deel >= de2 THEN BEGIN
    deel := modul(deel,de2);
    IF deel = '0' THEN deel := '';
  END;
END;
IF length(deel) > length(de2) THEN BEGIN
  deel := modul(deel,de2);
  IF deel = '0' THEN deel := '';
END;
len4 := len4 + 1;
IF deel = '0' THEN deel := '';
len4 := len4 - 1;

WHILE len4 <= len5 DO
BEGIN
  {This works exacttly the same but a number is carried over after every
loop}
  IF deel = '0' THEN deel := '';
  antw := copy(ste2,len4,1);
  deel := deel + antw;
  IF length(deel) < length(de2) THEN BEGIN
    {write('0');}
  END;
  IF length(deel) = length(de2) THEN BEGIN
    IF deel < de2 THEN BEGIN
      {write('0');}
    END;
    IF deel >= de2 THEN BEGIN
      deel := modul(deel,de2);
      IF deel = '0' THEN deel := '';
    END;
  END;
  IF length(deel) > length(de2) THEN BEGIN
    deel := modul(deel,de2);
    IF deel = '0' THEN deel := '';
  END;
  len4 := len4 + 1;
END;
IF deel = '' THEN
deel := '0';
modul_hoof := deel;
END;
FUNCTION maal_mod(x,y,z : longint) : longint;
VAR
einde,x1,y1,z1 : string;
ercode : integer;
get : longint;
BEGIN
{converts longint to strings}
  str(x,x1);
  str(y,y1);
  str(z,z1);
  einde := multi(x1,y1);
{multiplies the two numbers}
  einde := modul_hoof(einde,z1);
{mod the two numbers that was formed}
  ercode := -1;
  val(einde,get,ercode);
{converts to longint}
  maal_mod := get;
END;
FUNCTION Fastexp(a,z,n:longint) : longint;
VAR
x,a1,z1 : longint;
BEGIN
{fastexp - a^z mod n, this fuction reduces the number of operations
needed to find the answer for the above mentioned formula(it works out
this formula in a shorter time frame).}
  a1 := a;
  z1 := z;
  x := 1;
  WHILE z1 <> 0 DO
  BEGIN
    WHILE z1 mod 2 = 0 DO
    BEGIN
      z1 := z1 div 2;
{checks if the answer will overflow -if overflows it is bypassed by
the maal_mod function}
      IF a1 > 40000 THEN
      BEGIN
        IF (a1 mod n) > 40000 THEN
        a1 := maal_mod(a1,a1,n)
        ELSE
        a1 := ((a1 mod n) * (a1 mod n)) mod n;
      END
      ELSE
      a1 := (a1 * a1) mod n;
      END;
      z1 := z1 - 1;
{checks if the answer will overflow}
      IF (x > 40000) OR (a1 > 40000) THEN
      BEGIN
        IF ((x mod n) > 40000) OR ((a1 mod n) > 40000) THEN
        x := maal_mod(x,a1,n)
        ELSE
        x := ((x mod n) * (a1 mod n)) MOD n;
      END
      ELSE
      x := (x * a1) mod n;
      END;
      fastexp := x;
  END;
FUNCTION fermats(s : longint) : boolean;
VAR
t,k : longint;
CONST
a = 2;
BEGIN
IF s = 5 THEN BEGIN fermats := true; exit; END;
IF s = 2 THEN BEGIN fermats := true; exit; END;
IF s = 3 THEN BEGIN fermats := true; exit; END;
IF s = 7 THEN BEGIN fermats := true; exit; END;
IF s MOD 2 = 0 THEN BEGIN fermats := FALSE; Exit; END;
IF s MOD 3 = 0 THEN BEGIN fermats := FALSE; Exit; END;
IF s MOD 5 = 0 THEN BEGIN fermats := FALSE; Exit; END;
IF s MOD 7 = 0 THEN BEGIN fermats := FALSE; Exit; END;
t := s - 1;
{sends to exponentiatian function}
k := fastexp(a,t,s);
{tests if number may be prime or not}
IF k = 1 THEN BEGIN fermats := TRUE; Exit; END;
IF k <> 1 THEN BEGIN fermats := FALSE; Exit; END;
END;
FUNCTION primechk(num : longint) : boolean;
VAR x : longint;
y,t : integer;
BEGIN
x := -1;
y := 0;
t := 0;
IF num = 5 THEN BEGIN primechk := true; exit; END;
IF num = 2 THEN BEGIN primechk := true; exit; END;
IF num = 3 THEN BEGIN primechk := true; exit; END;
IF num = 1 THEN BEGIN primechk := false; exit; END;
WHILE (x <= sqrt(NUM)) AND (y < 2) DO
BEGIN
  t := t + 1;
  CASE t OF
  1 : x := x + 2;
  2 : BEGIN x := x + 4; t := 0; END;
  END;
  IF (num MOD x) = 0 THEN y := y + 1;
END;
IF y <> 1 THEN primechk := false ELSE primechk := true;
END;
BEGIN
assign(txtfile,'Fermat.txt');
rewrite(txtfile);
writeln('Between x and what border must the primes be : ');
readln(priem);
writeln('Gee ''n waarde vir x');
readln(k);
GetTime(h,m,s,hund);
WHILE priem > k DO BEGIN
antw := fermats(priem);
IF antw = true THEN
antw := primechk(priem);
IF antw = true THEN
BEGIN
  write(priem,' ');
  writeln(txtfile,priem);
END;
priem := priem - 1;
END;
close(txtfile);
GetTime(h2,m2,s2,hund2);
tot := m * 60 + s + h * 60 * 60 + hund / 100;
tot2 := m2 * 60 + s2 + h2 * 60 * 60 + hund2 / 100;
tot := tot2 - tot;
writeln;
writeln('Time : ',tot:1:2);
readln;
end.
{aan die DRIE EENIGHEID}
