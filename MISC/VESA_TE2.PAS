Uses graph,vesa2,crt;
var x,y,c:integer;
    r,g,b:Byte;
Begin
  SetVesa;
  SetGraphMode(_320x200x256);
  initmouse;
for c:=32 to 103 do
  Begin
  setfillstyle(1,c);
  bar(c-10,10,c+1-10,110);
  End;
  showcursor;
  readln;

     For c:= 62 downto 1 do
     Begin
     for x:=32 to 103 do
     Begin
       getrgbcolor(x,r,g,b);
       if r>0 then dec(r);
       if g>0 then dec(g);
       if b>0 then dec(b);
       setRGbpalette(x,r,g,b);
     End;
     Delay(500);
     End;
  Closegraph;
  VesaDone;
End.