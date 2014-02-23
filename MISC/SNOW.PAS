uses graph,crt;
var x,y,x2,y2:array[1..2500]of real;
    k,g,a,b,t,d,xg,yg:integer;
begin
initgraph(xg,yg,'');
randomize;
t:=0;b:=1;
repeat
t:=t+1;
for a:=1 to b do
begin
if t=2 then
begin
t:=0;
b:=b+1;
g:=g+random(100)+10;
if g>660 then g:=-random(40);
x[b]:=g;y[b]:=1;
end;
x[a]:=x[a]+0.2;
{if x[a]>640 then x[a]:=1;}
y[a]:=y[a]+1;
putpixel(round(x[a]),round(y[a]),15);
putpixel(round(x2[a]),round(y2[a]),0);
x2[a]:=x[a];
y2[a]:=y[a];
if y[a]>310 then
begin
b:=b-1;
for k:=1 to b do
begin x[k]:=x[k+1];y[k]:=y[k+1];x2[k]:=x2[k+1];y2[k]:=y2[k+1] end;
end;
end;
until keypressed;
end.