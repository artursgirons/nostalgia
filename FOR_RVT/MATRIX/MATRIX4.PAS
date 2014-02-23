Program matrix;
Uses Crt,dos;
Var y,size,konec:array[2..79]of integer;
    a:byte;
    s:string;
Begin
Randomize;
clrscr;
s:='The Matrix';
for a:=1 to 10 do Begin gotoxy(35+a,12);textcolor(10);write(s[a]);Delay(200);gotoxy(35+a,12);textcolor(2);write(s[a])End;
delay(1000);for a:=1 to 10 do begin gotoxy(46-a,12);write(' ');delay(200) end;Delay(1000);
Asm mov ah,01;mov cx,$2000;int $10;End;
for a:=2 to 79 do y[a]:=26;
While not keypressed do
Begin
  delay(100);
  For a:=2 to 79 do
  Begin
    If (y[a]-size[a])>konec[a] then
    Begin
      y[a]:=random(15)+1;
      size[a]:=random(15)+1;
      konec[a]:=random(10)+16;
    End;
    Inc(y[a]);
    If (y[a]<konec[a])and(y[a]<25) then Begin Textcolor(Random(2)*8+2);Gotoxy(a,y[a]);Write(Chr(random(220)+33)) End;
    If (y[a]-size[a]<konec[a])and(y[a]-size[a]>0) then Begin Gotoxy(a,y[a]-size[a]);Write(' ') End;
  End;
End;
End.
