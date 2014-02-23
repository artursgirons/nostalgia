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
    X3,Y3:integer;
    z3:real;
    x,y:array[1..n]of integer;
    put:array[1..n]of boolean;
Begin
  p:=1-p;
  Setactivepage(p);
{  clearviewport;}
  Ang:=Ang+0.01;if ang>6.28 then ang:=0.01;
  For a:=1 to N do
  Begin
    Z3:=(M[a].z*cos(ang) - M[a].x*sin(ang));
    X3:=Round(M[a].x*cos(ang) + M[a].z*sin(ang));
    Y3:=Round(M[a].y);
    If (z3>-72) then Put[a]:=true else put[a]:=false;
    X[a]:=round((x3*cos(0.78)+y3*sin(0.78))*1.4)+320;
    Y[a]:=round(y3*cos(0.78)-x3*sin(0.78))+175;
  End;
  delay(500);
  Cleardevice;
  if Put[1]and put[4] then  Setcolor(10) else setcolor(8);Line(x[1],y[1],x[4],y[4]);
  if Put[8]and put[7] then  Setcolor(10) else setcolor(8);Line(x[8],y[8],x[7],y[7]);
  if Put[3]and put[2] then  Setcolor(10) else setcolor(8);Line(x[3],y[3],x[2],y[2]);
  if Put[5]and put[6] then  Setcolor(10) else setcolor(8);Line(x[5],y[5],x[6],y[6]);
  if Put[4]and put[5] then  Setcolor(10) else setcolor(8);Line(x[4],y[4],x[5],y[5]);
  if Put[5]and put[3] then  Setcolor(10) else setcolor(8);Line(x[5],y[5],x[3],y[3]);
  if Put[3]and put[8] then  Setcolor(10) else setcolor(8);Line(x[3],y[3],x[8],y[8]);
  if Put[8]and put[4] then  Setcolor(10) else setcolor(8);Line(x[8],y[8],x[4],y[4]);
  if Put[1]and put[6] then  Setcolor(10) else setcolor(8);Line(x[1],y[1],x[6],y[6]);
  if Put[6]and put[2] then  Setcolor(10) else setcolor(8);Line(x[6],y[6],x[2],y[2]);
  if Put[2]and put[7] then  Setcolor(10) else setcolor(8);Line(x[2],y[2],x[7],y[7]);
  if Put[7]and put[1] then  Setcolor(10) else setcolor(8);Line(x[7],y[7],x[1],y[1]);
  Setvisualpage(p);
End;

Begin
  X:=3;Y:=1;
  Initgraph(x,y,'');
  While not keypressed do Turn_Draw;
  Closegraph;
End.
