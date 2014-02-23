Program Videjais_aritmetiskais;
uses crt;
var b,c:real;
    a:byte;
begin
clrscr;
textcolor(10);
writeln('<< Si programma apreikinas videjo aritmetisko no 10 skaitliem >>');
writeln;
textcolor(7);
a:=1;
repeat
 Write('Ievadiet ',a,'. skaitli :');
 readln(c);
 b:=b+c;
 inc(a);
until a>10;
Writeln;
textcolor(10);
writeln('So skaitlu videjais aritmetiskais ir :',(b/10):1:3);
readkey;
end.
