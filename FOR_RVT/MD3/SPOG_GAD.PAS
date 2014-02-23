Program Spogulainie_gadi;
uses crt;
var a,b,c:integer;
begin
clrscr;
a:=1;
repeat
  write(' ',a,a,' ');
  inc(a);
until a>9;

a:=1;
repeat
  b:=0;
  repeat
    write(' ',a,b,a,' ');
    inc(b);
  until b>9;
  inc(a);
until a>9;

a:=1;
repeat
  b:=0;
  repeat
    write('  ',a,b,b,a,'  ');
    inc(b);
  until b>9;
  inc(a);
until a>2;
end.
