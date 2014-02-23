Uses crt,dos;
var x,x2,y,y2,atr,ch:byte;
    r:registers;
Begin
randomize;
gotoxy(1,1);write(' ');
x2:=40;y2:=12;x:=40;y:=12;
r.ah:=01;r.cx:=$2000;intr($10,r);
repeat
case random(4) of
0:Begin x:=x+1 End;
1:Begin x:=x-1 End;
2:Begin y:=y+1 End;
3:Begin y:=y-1 End;
End;
 if (x<1)or(x>79)or(y<1)or(y>25) then Begin x:=x2;y:=y2 End;
  Gotoxy(x,y);
  r.ah:=08;r.bh:=$00;intr($10,r);
  ch:=r.al; atr:=r.ah;
  Gotoxy(x,y); textcolor(0); write('Û');
  gotoxy(x2,y2); Textcolor(atr mod 16);textbackground(atr div 16);
  write(chr(ch));
  x2:=x;y2:=y;
until keypressed;
End.
