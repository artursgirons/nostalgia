Program Crach;
Uses Crt,Graph;
Var x,y:array[0..16]of real;
    c,F,fx,fy,An,x1,x2,y1,y2:real;
    Ip,gm,gd,a,b,dx,dy,dz:integer;
Begin
InitGraph(gm,gd,'');
Dz:=20;
Dx:=40;
Dy:=240;
Setcolor(2);
for a:=0 to 15 do
Begin
  x[a]:=Dz+a*40;
  y[a]:=Dy;
  Setcolor(2);
  If a<15 then Line(Round(x[a]),Dy,Round(x[a]+dx),Dy);
  Setcolor(10);
  Circle(Round(x[a]),Dy,1);
End;
An:=45; {Iidarbes Lenkis}
Ip:=0; {Iedarbes Punkts(Tikai viens)}
F:=200; {Iedarbibas speks(Nosaciti)}
Setcolor(10);
While F>0 do
Begin
  Delay(1000);
  Cleardevice;
  x[0]:=x[0]+0.5;
  y[0]:=y[0]+0.1;
  Moveto(Round(x[0]),Round(y[0]));
  For  a:=0 to 14 do
  Begin
    c:=Sqrt(Sqr(x[a]-x[a+1])+sqr(y[a]-y[a+1]));
    x[a+1]:=x[a]+((x[a+1]-x[a])/c)*dx;
    y[a+1]:=y[a]+((y[a+1]-y[a])/c)*dx;
    lineto(Round(x[a]),Round(y[a]));
    circle(Round(x[a]),Round(y[a]),1);
  End;
f:=f-0.1;
End;
Closegraph;
End.