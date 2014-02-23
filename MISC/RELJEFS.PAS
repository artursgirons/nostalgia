Program RELJEFS;
uses crt,graph;
var x,y:array[0..10,0..50]of real;
    a1,a2,xg,yg:integer;
begin
initgraph(xg,yg,'');
setcolor(2);
outtextxy(290,170,'Loading...');
setactivepage(1);
for a1:=1 to 10 do
begin
setcolor(0);
circle(round(10+(a1*10)+(1*10)),round(100+sin(1/5)*(cos((5-a1)/3.5)*50)+(a1*15)),0);
setcolor(10);
for a2:=1 to 50 do
begin
y[a1,a2]:=100+sin(a2/5)*(cos((5-a1)/3.5)*50)+(a1*15);
x[a1,a1]:=10+(a1*10)+(a2*10);
lineto(round(x[a1,a1]),round(y[a1,a2]));
end;
end;
for a2:=1 to 50 do
begin
setcolor(0);
circle(round((10+(1*10)+(a2*10))),-1+round(100+sin(a2/5)*(cos((5-1)/3.5)*50)+(1*15)),0);
setcolor(10);
for a1:=1 to 10 do
begin
y[a1,a2]:=100+sin(a2/5)*(cos((5-a1)/3.5)*50)+(a1*15);
x[a1,a1]:=10+(a1*10)+(a2*10);
lineto(round(x[a1,a1]),round(y[a1,a2]));
end;
end;
setvisualpage(1);
readkey;
end.