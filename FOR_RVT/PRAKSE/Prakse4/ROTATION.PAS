Program Dam_Rotation_Prakse;
Uses Graph,Crt;
Const N=4;
      M:Array[1..N]of Record X,Y,Z:Shortint End=((X:100;Y:100;Z:0),(X:-100;Y:100;Z:0),(X:-100;Y:-100;Z:0),(X:100;Y:-100;Z:0));
Var X,Y,Z:Integer;
    p,a,b,c:Byte;
    Ang:real;

Procedure Turn_Draw;
Var X2,Y2,Z2:integer;
Begin
  p:=1-p;
  Setactivepage(p);
  cleardevice;
  Ang:=Ang+0.01;if ang>6.28 then ang:=0.01;
  Delay(100);
  X2:=Round(M[n].x*cos(ang) + M[n].z*sin(ang));
  Z2:=Round(M[n].z*cos(ang) - M[n].x*sin(ang));
  Y2:=Round(M[n].y);
  For a:=1 to N do
  Begin
    X:=Round(M[a].x*cos(ang) + M[a].z*sin(ang));
    Z:=Round(M[a].z*cos(ang) - M[a].x*sin(ang));
    Y:=Round(M[a].y);
    Line(x+320,y+175-z div 4,x2+320,y2+175-z2 div 4);
    x2:=x;y2:=y;z2:=z;
  End;
  Setvisualpage(p);
End;

Begin
  X:=3;Y:=1;
  Initgraph(x,y,'');
  While not keypressed do Turn_Draw;
  Closegraph;
End.