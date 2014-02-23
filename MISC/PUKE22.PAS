Uses Graph,crt;
Var gm,gd,R,Rs,N,a:integer;
    x,y,AngB,AngE:integer;
    AngDo,AngD:Real;
Begin
  initgraph(gm,gd,'');
  N:=10;
  R:=100;
  AngD:=2*pi/N;
  AngDo:=360/N;
  Rs:=Round(sin(AngD/2)*R);
  Setcolor(10);
 { circle(320,200,R);}
  For a:=1 to N do
  Begin
      x:=Round(R*sin(AngD*a)/2);
      y:=Round(R*Sqr(cos(AngD*a/2)));
      AngB:=Round(AngDo*a/2-90);
      AngE:=Round(AngDo*a/2+90);
    Arc(320+x,200+y,AngB,AngE,Rs);
    circle(x+320,y+200,rs);
  End;
  readln;
End.