Program Bumba;
uses graph,crt;
const max=25;
var x,y,g,x2:array[1..max]of real;
    a,b,xg,yg:integer;
    z:real;
begin
initgraph(xg,yg,'');
randomize;
for a:= 1 to max do
begin
g[a]:=random(64)/10;
y[a]:=random(100)+10;
end;
repeat
for b:= 1 to 314 do
begin
z:=b/50;
for a:=1 to max do
begin
x2[a]:=x[a];
x[a]:=50+sin(z+g[a])*45;
putpixel(round(x[a]),round(y[a]),10);
end;
for a:=1 to max do putpixel(round(x2[a]),round(y[a]),0);
end;
until keypressed;
closegraph;
end.