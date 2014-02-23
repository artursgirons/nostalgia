Program MatriX_X;
uses crt;
var a:byte;
begin
randomize;
clrscr;
a:=2;
while not keypressed do
begin
 a:=3-a;
 gotoxy(random(77)+1,random(24)+1);
 textcolor(random(15)+1);
 if odd(a) then write(chr(random(206)+32)) else write(' ');
end;
end.