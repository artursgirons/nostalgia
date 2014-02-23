Program Matrix;
Uses Crt,dos;
var a,x,y:integer;
    r:registers;
    ch:char;
Procedure de;
Var p:byte;
Begin
a:=0;p:=0;
While True do
begin
  While true do
  Begin
    x:=random(78)+2;y:=1;
    inc(a);
    gotoxy(x,y);r.ah:=08;r.bh:=00;intr($10,r);
    if r.al<>32 then
    while true do
    Begin
      if keypressed then halt;
      inc(y);
      gotoxy(x,y);
      r.ah:=08;r.bh:=00;intr($10,r);
    if (r.al=32) then Begin p:=1;break;End;
    End;
    if p=1 then break;
    if a>70 then break;
  End;
  if a>70 then break;
  if r.al=32 then
  Begin
  ch:=chr(r.al);
  a:=0;p:=0;
{  While true do
    Begin}
{      if y<1 then break;}
      Gotoxy(x,y-1);
      Write(' ');
{      dec(y);}
{    End;}
  End;
End;
End;
Begin
Randomize;
ClrScr;x:=1;y:=24;
Asm mov ah,$01;mov cx,$2000;int $10;End;
While True do
begin
  if keypressed then halt;
  gotoxy(x,y);
  r.ah:=08;r.bh:=00;intr($10,r);
  if (y=24) and(r.al<>32) then Begin de;x:=2;y:=24;r.al:=32;End;
  if (r.al=32)and(y>0) then
    Begin {gotoxy(x,y+1);Write(' ');} dec(y);End
  else
    Begin Textcolor(random(2)*8+2);gotoxy(x,y+1);Write(ch);x:=random(78)+2;y:=24;ch:=Chr(random(220)+34) End;
End;
End.
