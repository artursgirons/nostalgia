uses graph,crt;
var x,y,a:real;
    xg,yg,c,b,d,g:integer;
begin
initgraph(xg,yg,'');
setcolor(8);
for b:=0 to 60 do line(b*14-2,5,b*14-2,345);
for d:=0 to 35 do line(12,d*10-5,628,d*10-5);
setcolor(2);line(12,175,628,175);
setcolor(10);
line(320,5,320,345);line(320,5,317,13);line(628,175,618,173);
g:=1;
for c:=-2200 to 2200 do
begin
a:=c/100;
x:=a;
if a<>0 then y:=14/a else g:=1;
if((round(x*14+320))>12) and ((round(x*14+320))<628) and ((y*10+175)>5) and ((y*10+175)<345) then
begin
if g=1 then begin g:=0;setcolor(0);circle(round(x*14+320),round(-y*10+175),1);setcolor(10) end;
lineto(round(x*14+320),round(-y*10+175));
end;
end;
readkey;
closegraph;
end.