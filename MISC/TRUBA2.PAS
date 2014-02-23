Program Bumba;
uses graph,crt;
const max=50;
var x,y,g,l:array[1..max]of real;
    a,c,b,xg,yg:integer;
    d,z:real;
begin
initgraph(xg,yg,'');
for a:= 1 to max do
begin
g[a]:=random(648)/100;
y[a]:=random(40)+1;
end;
repeat
z:=z+0.1;
for a:=1 to max do
begin
x[a]:=320+sin(z+g[a])*(20/y[a]*50);
putpixel(round(x[a]),round(y[a]+155),10);
end;
for a:= 1 to max do putpixel(round(x[a]),round(y[a]+155),0);
until keypressed;
closegraph;
end.