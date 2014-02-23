uses crt,graph;
var a,b:real;
    x,y:array[1..2]of integer;
Begin
x[1]:=3;y[1]:=1;initgraph(x[1],y[1],'');
setcolor(10);
x[2]:=-238;
a:=-1;
repeat
x[1]:=Round(a*238);y[1]:=Round(sqrt(abs(1-a*a))*170);
line(320+x[2],175-y[2],320+x[1],175-y[1]);
line(320+x[2],175+y[2],320+x[1],175+y[1]);
x[2]:=x[1];y[2]:=y[1];
a:=a+0.01;
until a>1.01;
readkey;
end.