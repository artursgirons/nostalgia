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
for a:=1 to 10 do
begin
 Write('Ievadiet ',a,'. skaitli :');
 readln(c);
 b:=b+c;
end;
Writeln;
textcolor(10);
writeln('So skaitlu videjais aritmetiskais ir :',(b/10):1:3);
readkey;
end.
