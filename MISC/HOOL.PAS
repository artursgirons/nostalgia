Program Bumba;
uses graph,crt;
const max=30;
var x,y,g,x2,y2:array[0..max]of real;
    a,b,xg,yg:integer;
    z:real;
begin
initgraph(xg,yg,'');
randomize;
repeat
for b:= 3 to 314 div 4 do
begin
circle(round(x[1]),round(y[1])+20,1);
setcolor(10);
z:=b/(50 div 4);
for a:=1 to max do
begin
x2[a]:=x[a];
y2[a]:=y[a];
x[a]:=320+sin(a/1+z)*(320/a);
y[a]:=175+cos(a/1+z)*(100/a)+(a*2);
lineto(round(x[a]),round(y[a])+20);
end;
setcolor(0);
circle(round(x[1]),round(y[1])+20,1);
for a:=1 to max do lineto(round(x2[a]),round(y2[a])+20);
end;
until keypressed;
closegraph;
end.