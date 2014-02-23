Program Skaitl_diagnostika;
uses crt;
var a,b:byte;
    c:real;
begin
clrscr;
textcolor(10);
writeln('<< Si programma nosaka cik no 10 sk. bija pozitivi >>');
writeln;
textcolor(7);
a:=1;
While a<11 do
begin
 Write('Ievadiet ',a,'. skaitli :');
 readln(c);
 if c>0 then b:=b+1;
 inc(a);
end;
Writeln;
textcolor(10);
write('No ievaditiem skaitliem ',b,' bija pozitivi.');
readkey;
end.
