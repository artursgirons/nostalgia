Program Dam_Rotation_Prakse;
Uses Graph,Crt;
Const N=4;
{ M:Array[1..N]of Record X,Y,Z:Shortint End=((X:100;Y:100;Z:0),(X:-100;Y:100;Z:0),(X:-100;Y:-100;Z:0),(X:100;Y:-100;Z:0));}
      M:Array[1..N]of Record X,Y,Z:Shortint End=
((x:86 ;y:0 ;z:0 ),(X:0 ;Y:86 ;Z:0 ),(X: -86;Y:0 ;Z:0 ),(X:0 ;Y:-86 ;Z:0));
Var X,Y,Z:Integer;
    p,a,b,c:Byte;
    Ang:real;

Procedure Turn_Draw;
Var X2,Y2,Z2:integer;
    X3,Y3,Z3:integer;
Begin
  p:=1-p;
  Setactivepage(p);
  cleardevice;
  Ang:=Ang+0.01;if ang>6.28 then ang:=0.01;
  Delay(100);
  For a:=1 to N do
  Begin
    Z3:=Round(M[a].z*cos(ang) - M[a].x*sin(ang));
    X3:=Round(M[a].x*cos(ang) + M[a].z*sin(ang));
    Y3:=Round(M[a].y-z3/4);
    X:=round((x3*cos(0.78)+y3*sin(0.78))*1.4);
    Y:=round(y3*cos(0.78)-x3*sin(0.78));
    Line(x+320,y+175,x2+320,y2+175);
    x2:=x;y2:=y;
  End;
  Setvisualpage(p);
End;

Begin
  X:=3;Y:=1;
  Initgraph(x,y,'');
  While not keypressed do Turn_Draw;
  Closegraph;
End.
{    Z3:=Round(M[n].z*cos(ang) - M[n].x*sin(ang));
    X3:=Round(M[n].x*cos(ang) + M[n].z*sin(ang));
    Y3:=Round(M[n].y-z3/4);
    X2:=round((x3*cos(0.78)+y3*sin(0.78))*1.4);
    Y2:=round(y3*cos(0.78)-x3*sin(0.78));}
