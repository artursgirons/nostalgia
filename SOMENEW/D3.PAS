Program _3d;
uses graph,crt;
var x,y,z:array[1..5]of real;
    Si,Co:array[0..627]of real;
    Xo,Yo:Integer;
    a,b:Integer;
    c,d:real;
Procedure TurnY(const G:integer);
var r,K,H,l:real;
Begin
  r:=Sqrt(Sqr(z[a])+sqr(x[a]));
{  h:=r-z[a];}
  if r<>0 then
  Begin
  h:=z[a]/r*157;
  x[a]:=co[Round(h+1)]*r;
  z[a]:=si[Round(h+1)]*r;
  End;
End;

Begin
For b:=0 to 627 do
Begin
  Si[b]:=sin(b/100);
  Co[b]:=cos(b/100);
End;
b:=0;
Initgraph(a,b,'');
x[1]:= 100;y[1]:=   0;z[1]:=   0;
x[2]:=   0;y[2]:=   0;z[2]:= 100;
x[3]:=-100;y[3]:=   0;z[3]:=   0;
x[4]:=   0;y[4]:=   0;z[4]:=-100;
x[5]:=   0;y[5]:= -200;z[5]:=   0;

for b:=1 to 50 do
Begin
for a:=1 to 5 do
Begin
  TurnY(1);
  Xo:=Round(x[a])+320;
  Yo:=Round(y[a]+z[a]/2)+340;
  Circle(xo,yo,2);
End;
End;
Readln;

Closegraph;
End.