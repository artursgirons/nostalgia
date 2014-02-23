Program Dam_Rotation_Prakse;
Uses Graph,Crt;
Const N=8;
{ M:Array[1..N]of Record X,Y,Z:Shortint End=((X:100;Y:100;Z:0),(X:-100;Y:100;Z:0),(X:-100;Y:-100;Z:0),(X:100;Y:-100;Z:0));}
      M:Array[1..N]of Record X,Y,Z:Shortint End=
((x:86 ;y:0 ;z:0 ),(X:0 ;Y:86 ;Z:0 ),(X: -86;Y:0 ;Z:0 ),(X:0 ;Y:-86 ;Z:0),
(x:-43 ;y:-43 ;z:71 ),(x:43;y:43 ;z:71 ),(x:43 ;y:43 ;z:-71 ),(x:-43 ;y:-43 ;z:-71 ));
Var X,Y,Z:Integer;
    p,a,b,c:Byte;
    Ang:real;
    s:string;

Procedure Turn_Draw;
Var X2,Y2,Z2:integer;
    X3,Y3,Z3:integer;
    x,y:array[1..n]of integer;
Begin
  p:=1-p;
  Setactivepage(p);
  {clearviewport;}
  Ang:=Ang+0.05;if ang>6.28 then ang:=0.05;
  For a:=1 to N do
  Begin
    Z3:=Round(M[a].z*cos(ang) - M[a].x*sin(ang));
    X3:=Round(M[a].x*cos(ang) + M[a].z*sin(ang));
    Y3:=Round(M[a].y);
    X[a]:=round((x3*cos(0{.78})+y3*sin(0{.78}))*1.4)+320;
    Y[a]:=round(y3*cos(0{.78})-x3*sin(0{.78}))+175;
  End;
  delay(500);
  Cleardevice;
  Line(x[1],y[1],x[4],y[4]);
  Line(x[8],y[8],x[7],y[7]);
  Line(x[3],y[3],x[2],y[2]);
  Line(x[5],y[5],x[6],y[6]);
  Line(x[4],y[4],x[5],y[5]);
  Line(x[5],y[5],x[3],y[3]);
  Line(x[3],y[3],x[8],y[8]);
  Line(x[8],y[8],x[4],y[4]);
  Line(x[1],y[1],x[6],y[6]);
  Line(x[6],y[6],x[2],y[2]);
  Line(x[2],y[2],x[7],y[7]);
  Line(x[7],y[7],x[1],y[1]);
  Setvisualpage(p);
End;

Begin
  X:=3;Y:=1;
  Initgraph(x,y,'');
  While not keypressed do Turn_Draw;
  Closegraph;
End.
