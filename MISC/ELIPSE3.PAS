Program Celipses;
uses graph,crt;
const f=150;
      n=5;
var rx,ry,gg,g,xx,yy:array[1..n]of real;
    co,t,t2,u:array[1..n]of integer;
    xg,yg:integer;
    x,y:array[1..n,1..f]of real;
    a,b,i,q:integer;
begin
randomize;
xg:=3;yg:=1;
initgraph(xg,yg,'');
setcolor(10);
moveto(320,175);
for q:=1 to n do
begin
 rx[q]:=random(2)+1;
 ry[q]:=random(2)+1;
 gg[q]:=random(20)/10;
 t2[q]:=20;
 co[q]:=random(5)+10;
end;
while not keypressed do
begin
Delay(100);
for q:=1 to n do
begin
t[q]:=t[q]+1;
if t[q]=t2[q] then
begin
     t[q]:=0;
     t2[q]:=random(100)+30;
     ry[q]:=random(300)/100+0.1;
     rx[q]:=random(300)/100+0.1;
     u[q]:=1-u[q];
     case u[q] of
     1:gg[q]:=-1;
     0:gg[q]:=1;
     end;
     gg[q]:=gg[q]/20
end;
g[q]:=g[q]+gg[q];
if g[q]>6.48 then g[q]:=0.02;
xx[q]:=sin(g[q]);
yy[q]:=cos(g[q]);
x[q,1]:=x[q,1]+xx[q]*rx[q];
y[q,1]:=y[q,1]+yy[q]*ry[q];
setcolor(co[q]);
line(round(320+x[q,1]),round(175+y[q,1]),round(320+x[q,2]),round(175+y[q,2]));
setcolor(0);
line(round(320+x[q,f-1]),round(175+y[q,f-1]),round(320+x[q,f]),round(175+y[q,f]));
if (x[q,1]>325) then x[q,1]:=-315;
if (x[q,1]<-325) then x[q,1]:=315;
if (y[q,1]>180) then y[q,1]:=-175;
if (y[q,1]<-180) then y[q,1]:=175;
for b:=f downto 2 do begin x[q,b]:=x[q,b-1];y[q,b]:=y[q,b-1] end;
end;
end;
end.