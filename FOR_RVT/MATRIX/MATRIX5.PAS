Program matrix;
Uses Crt,dos;
Var y,size,konec:array[2..79]of integer;
    a:byte;
    s:string;
Begin
Randomize;
clrscr;
Textmode(1110);
Asm mov ah,01;mov cx,$2000;int $10;End;
for a:=2 to 79 do y[a]:=26;
While not keypressed do
Begin
  delay(10);
  For a:=2 to 79 do
  Begin
    If (y[a]-size[a])>konec[a] then
    Begin
      y[a]:=random(25)+1;
      size[a]:=random(30)+1;
      konec[a]:=random(30)+16;
    End;
    Inc(y[a]);
    If (y[a]<konec[a])and(y[a]<45) then Begin Textcolor(Random(2)*8+2);Gotoxy(a,y[a]);Write(Chr(random(220)+33)) End;
    If (y[a]-size[a]<konec[a])and(y[a]-size[a]>0) then Begin Gotoxy(a,y[a]-size[a]);Write(' ') End;
  End;
End;
End.
