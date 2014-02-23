Uses Graph,Crt;
Var p,e,a,N:integer;
    Ang:real;
    c:ArcCoordstype;
Begin
  p:=9;e:=1;
  initgraph(p,e,'');
  N:=7;
  Ang:=360/n;
  While not keypressed do
  Begin
    p:=p+1;if p=360 then p:=0;
    e:=1-e;
    setactivepage(e);
    Cleardevice;
    for a:=1 to n do
    Begin
      SetColor(0);
      Arc(320,175,Round((a-1)*Ang+p),Round(a*ang+p),100);
      GeTArcCoords(c);
      Setcolor(10);
      Line(c.xstart,c.ystart,c.xend,c.yend);
    End;
    Setvisualpage(e);
    delay(100);
  End;
End.