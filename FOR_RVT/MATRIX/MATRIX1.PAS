Program matrix;
Uses Crt,dos;
const n=40;
Var x,y,size,konec:array[2..79]of integer;
    a:byte;
Begin
Randomize;
clrscr;
Asm mov ah,$01;mov cx,$2000;int $10;End;
for a:=1 to n do y[a]:=26;
While not keypressed do
Begin
  delay(100);
  For a:=1 to n do
  Begin
    If (y[a]-size[a])>25 then
    Begin
      x[a]:=random(77)+2;
      y[a]:=random(20)+1;
      size[a]:=random(15)+1;
    End;
    Inc(y[a]);
    If (y[a]<25) then Begin Textcolor(Random(2)*8+2);Gotoxy(x[a],y[a]);Write(Chr(random(220)+33)) End;
    If (y[a]-size[a]<25)and(y[a]-size[a]>0) then Begin Gotoxy(x[a],y[a]-size[a]);Write(' ') End;
  End;
End;
End.
