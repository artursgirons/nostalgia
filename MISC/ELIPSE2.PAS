Program Celipses;
uses graph,crt;
const f=100;
var rx,ry,gg,g,xx,yy:real;
    i,u,t,t2,a,b,xg,yg:integer;
    x,y:array[1..f]of real;
begin
randomize;
xg:=3;yg:=1;
initgraph(xg,yg,'');
setcolor(10);
moveto(320,175);
rx:=2;
ry:=1;
gg:=0.1;
t2:=100;
while not keypressed do
begin
t:=t+1;
if t=t2 then
begin
     t:=0;
     t2:=random(150)+10;
     ry:=random(300)/100+0.1;
     rx:=ry;
     u:=1-u;
     case u of
     1:gg:=-1;
     0:gg:=1;
     end;
     gg:=gg/20
end;
g:=g+gg;
if g>6.48 then g:=0.02;
xx:=sin(g);
yy:=cos(g);
x[1]:=x[1]+xx*rx;
y[1]:=y[1]+yy*ry;
setcolor(10);
line(round(320+x[1]),round(175+y[1]),round(320+x[2]),round(175+y[2]));
setcolor(0);
line(round(320+x[f-1]),round(175+y[f-1]),round(320+x[f]),round(175+y[f]));
if (x[1]>325) then x[1]:=-315;
if (x[1]<-325) then x[1]:=315;
if (y[1]>180) then y[1]:=-175;
if (y[1]<-180) then y[1]:=175;
for b:=f downto 2 do begin x[b]:=x[b-1];y[b]:=y[b-1] end;
end;
end.