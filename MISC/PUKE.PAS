uses graph,crt;
var x2,y2,x,y,xg,yg,a,c:integer;
    l,g,rr,r:real;
    P: Pointer;
    Size: Word;
begin
initgraph(xg,yg,'');
randomize;
r:=21;rr:=2.75;
setcolor(0);
circle(140,115,1);
setcolor(10);
for c:=1 to 627 do begin
lineto(round(142+sin(c/100)*r),round(100+cos(c/100)*(r/1.4)));
r:=r+rr;
if r<20 then rr:=-rr;
if r>140 then rr:=-rr;
end;
Size := ImageSize(0, 0, 280, 200);
GetMem(P, Size);
getimage(1,1,280,200,P^);
ClearDevice;
x2:=-100;
repeat
x:=round(random*530+5);
y:=round(random*230+5);
PutImage(x2, y2, P^, xorput);
PutImage(x, y, P^, xorput);
x2:=x;y2:=y;
until keypressed;
readln;
closegraph;
end.