program Sirds;
uses graph,crt;
var x,xx,xg,yg,a,b,c:integer;
    f,y,yy:real;
begin
initgraph(xg,yg,'');
repeat
inc(x,1);
if x>640 then begin x:=0;circle(-10,-10,1);end;
setcolor(12);
line(x,0,x,350);
f:=f+0.5;
case round(f) of
30:yy:=5;
40:begin yy:=-10;sound(100);delay(10);nosound;end;
50:begin yy:=5;sound(100);delay(10);nosound;end;
60:begin yy:=0;f:=0;end;
end;
y:=y+yy;
setcolor(0);
line(x-1,0,x-1,350);
setcolor(10);
lineto(x-2,round(y+175));
until keypressed;
readln;nosound;
closegraph;
end.