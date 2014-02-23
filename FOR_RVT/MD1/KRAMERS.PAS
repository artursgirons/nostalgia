Program Kramera_formula;
uses crt;
var a1,b1,c1,a2,b2,c2,D,Dx,Dy:real;
begin
clrscr;
gotoxy(18,2);
Writeln('<< Programma, kas atrisina sekojosu sistemu >>');
gotoxy(32,4);
textcolor(10);
Writeln('a1x + b1y = c1');
gotoxy(32,5);
Writeln('a2x + b2y = c2');
writeln;
textcolor(7);
write('Ludzu ievadiet a1 b1 c1, paradita forma:');
readln(a1,b1,c1);
write('Ludzu ievadiet a2 b2 c2, paradita forma:');
readln(a2,b2,c2);
textcolor(12);
if ((a1/a2)=(b1/b2)) and ((b1/b2)=(c1/c2)) then
begin Writeln('Saj sistemai ir bezgaligi daudz atrisinajumu.');readkey;exit end;
if ((a1/a2)=(b1/b2)) and ((b1/b2)<>(c1/c2)) then
begin Writeln('Saj sistemai nav atrisinajuma.');readkey;exit end;
textcolor(10);
D:=a1*b2-a2*b1;
Dx:=c1*b2-c2*b1;
Dy:=a1*c2-c1*a2;
gotoxy(34,13);
Writeln('X = ',(Dx/D):1:3);
gotoxy(34,14);
Writeln('Y = ',(Dy/D):1:3);
readkey;textcolor(7);
end.