Program Matrix;
Uses Crt,dos;
var a,x,y:integer;
    r:registers;
    ch:char;
Begin
Randomize;
Textcolor(10);
ClrScr;x:=2;y:=24;
Asm mov ah,$01;mov cx,$2000;int $10;End;
While True do
begin
  gotoxy(x,y);
  r.ah:=08;r.bh:=00;intr($10,r);
  If keypressed then halt;
  if (y=24) and(r.al<>32) then halt;
  if (r.al=32)and(y>0) then
    Begin gotoxy(x,y);Write(ch);gotoxy(x,y+1);Write(' '); dec(y);End
  else
    Begin {gotoxy(x,y+1);Write(ch);}x:=random(78)+2;y:=24;ch:=Chr(random(220)+34) End;
End;
End.
