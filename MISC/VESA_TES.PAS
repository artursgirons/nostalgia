Uses graph,vesa2,crt;
var x,y,c:integer;
Begin
  SetVesa;
  SetGraphMode(_800x600x256);
  for x:=1 to 63  do
  Begin
     setRGbpalette(x,x,0,0);
     Setfillstyle(1,x);
     Bar(x*12,150,x*12+12,160);

     setRGbpalette(x+63,0,x,0);
     Setfillstyle(1,x+63);
     Bar(x*12,161,x*12+12,171);

     setRGbpalette(x+63*2,0,0,x);
     Setfillstyle(1,x+63*2);
     Bar(x*12,172,x*12+12,182);
  End;
  Readkey;
  Closegraph;
  VesaDone;
End.