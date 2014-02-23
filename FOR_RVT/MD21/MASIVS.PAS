Program Masiv;
Uses Crt;
Var a,b,c,d:byte;
const m:array[1..6,1..6]of byte=(
(1,1,1,1,1,1),
(1,2,2,2,2,2),
(1,0,0,5,0,0),
(1,2,5,2,0,0),
(1,0,0,0,0,0),
(1,0,0,0,0,0));
Begin
Clrscr;
Textmode(1110);
Randomize;
{For a:=1 to 6 do For b:=1 to 6 do m[a,b]:=random(10);}
m[1,4]:=1;
for a:=1 to 6 do
Begin
  c:=1;
  for b:=1 to 6 do
    If m[a,b]<>m[b,a] then Begin c:=0;Break End;
  If c=0 then Begin Textcolor(7);d:=a End Else Begin Textcolor(12);d:=1 End;
  for b:=d to 6 do
  Begin
    Gotoxy(36+b,22+a);Write(m[a,b]);
    Gotoxy(36+a,22+b);Write(m[b,a]);
  End;
End;
readkey;
End.


