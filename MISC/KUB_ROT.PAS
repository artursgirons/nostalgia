uses graph,crt;
const nx=10;
      ny=10;
var x,y,xx,yy:real;
    xg,yg,sizey,size,cx,cy,co:integer;
    xl:array[0..nx]of integer;
    yl:array[0..ny]of integer;
procedure col;
begin
case co of
7:  co:=15;
8:  co:=7;
15: co:=8;
end;
setcolor(co);
end;
begin
co:=7;
initgraph(xg,yg,'');
size:=round((640-nx)/nx/2);
sizey:=round((350-ny)/ny/2);
for cx:=0 to nx-1 do xl[cx]:=cx*size*2+size;
for cy:=0 to ny-1 do yl[cy]:=cy*sizey*2+sizey;
xx:=1;yy:=-1;
size:=size-2;
sizey:=sizey-2;
repeat
repeat
x:=x+xx;
for cx:=0 to nx-1 do
for cy:=0 to ny-1 do
line(xl[cx],yl[cy],xl[cx]+round(x),yl[cy]+round(y));
until (x<-size) or (x>size)or keypressed;
xx:=-xx;
col;
repeat
y:=y+yy;
for cx:=0 to nx-1 do
for cy:=0 to ny-1 do
line(xl[cx],yl[cy],xl[cx]+round(x),yl[cy]+round(y));
until (y<-sizey) or (y>sizey)or keypressed;
yy:=-yy;
col;
until keypressed;
closegraph;
end.
{line(xl[cx]+round(x),yl[cy]+round(y),xl[cx]-round(x),yl[cy]-round(y));}