uses graph,crt;
var x,y,x2,y2,k:array[1..3]of integer;
    r,xg,yg,a,c,b,xx,yy,g,g2:integer;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
randomize;
repeat
r:=1-r;
setactivepage(r);
cleardevice;
if random(2)=1 then setcolor(9) else setcolor(1);
b:=1;
k[1]:=11;g:=random(70)+50;g2:=random(30)+30;
x[1]:=320;x2[1]:=320;y[1]:=0;y2[1]:=0;
for a:=1 to 200 do
for c:=1 to b do
begin
if (a=g) then
begin
b:=2;
x[2]:=x[1];x2[2]:=x2[1];
y[2]:=y[1];y2[2]:=y2[1];
k[2]:=8;k[1]:=13;
end;
if (a=g+g2) then
begin
b:=3;
x[3]:=x[2];x2[3]:=x2[2];
y[3]:=y[2];y2[3]:=y2[2];
k[3]:=11;
end;
yy:=random(5);xx:=random(k[c])-5;
x[c]:=x[c]+xx;y[c]:=y[c]+yy;
line(x2[c],y2[c],x[c],y[c]);
x2[c]:=x[c];y2[c]:=y[c];
end;
setvisualpage(r);
Delay(4000);
until keypressed;
readln;
closegraph;
end.