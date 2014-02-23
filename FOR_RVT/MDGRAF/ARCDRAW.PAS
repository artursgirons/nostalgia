Uses Crt,graph;
var x,y,a,r:integer;
Begin
  initgraph(x,y,'');a:=360;
  Setcolor(8);circle(320,240,200);
  While not keypressed do
  Begin
    dec(a);
    if a=0 then a:=360;
    setcolor(10);
    Arc(320,240,a,a+30,200);
    Setcolor(8);
    Arc(320,240,a+30,a+32,200);
    delay(400);
  end;
end.
