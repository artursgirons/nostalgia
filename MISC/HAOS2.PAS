Uses crt,dos;
var x,x2,y,y2,atr,ch:byte;
    l:integer;
    r:registers;
Begin
randomize;
l:=lastmode;
textmode(1);
textcolor(10);
gotoxy(13 ,3);Write('Simbol movement');
window(12,7,28,24);
for x:=33 to 253 do
Begin
case random(3)of
2:textcolor(7);
1:textcolor(8);
0:textcolor(15);
End;
write(chr(x));
End;
gotoxy(8,7);write(' ');
x2:=8;y2:=7;x:=8;y:=7;
r.ah:=01;r.cx:=$2000;intr($10,r);
repeat
case random(4) of
0:Begin x:=x+1 End;
1:Begin x:=x-1 End;
2:Begin y:=y+1 End;
3:Begin y:=y-1 End;
End;
 if (x<1)or(x>17)or(y<1)or(y>13) then Begin x:=x2;y:=y2 End;
  Gotoxy(x,y);
  r.ah:=08;r.bh:=$00;intr($10,r);
  ch:=r.al; atr:=r.ah;
  Gotoxy(x,y); textcolor(0); write('Û');
  gotoxy(x2,y2); Textcolor(atr mod 16);textbackground(atr div 16);
  write(chr(ch));
  delay(130);
  x2:=x;y2:=y;
until keypressed;
textmode(l);
End.
