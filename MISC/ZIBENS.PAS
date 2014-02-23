uses graph,crt;
var x,y,x2,y2,k:array[1..16]of integer;
    xg,yg,a,c,b,xx,yy,g:integer;
begin
initgraph(xg,yg,'');
randomize;
repeat
cleardevice;
if random(2)=1 then setcolor(9) else setcolor(1);
b:=1;
k[1]:=12;g:=random(70)+50;
x[1]:=320;x2[1]:=320;y[1]:=0;y2[1]:=0;
for a:=1 to 200 do
for c:=1 to b do
begin
if (a=g) then
begin
b:=2;
x[2]:=x[1];x2[2]:=x2[1];
y[2]:=y[1];y2[2]:=y2[1];
k[2]:=9;
end;
yy:=random(5);xx:=random(k[c])-5;
x[c]:=x[c]+xx;y[c]:=y[c]+yy;
line(x2[c],y2[c],x[c],y[c]);
x2[c]:=x[c];y2[c]:=y[c];
end;
until keypressed;
readln;
closegraph;
end.