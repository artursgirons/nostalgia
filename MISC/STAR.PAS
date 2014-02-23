Program StarMovement;
uses graph,crt;
var x,y,x2,y2:word;
    xx,yy:shortint;
    ch:char;
    xg,yg:integer;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
x:=100;y:=100;xx:=1;
while true do
begin
   if keypressed then
   begin
      ch:=readkey;
      ch:=readkey;
      case ord(ch) of
        77:begin yy:=0;xx:= 1 end;
        75:begin yy:=0;xx:=-1 end;
        80:begin xx:=0;yy:= 1 end;
        72:begin xx:=0;yy:=-1 end;
        27:halt;
      end;
   end;
   x:=x+xx;
   y:=y+yy;
   if (x<0)or(x>630) then begin x:=x-xx;xx:=0 end;
   if (y<0)or(y>340) then begin y:=y-yy;yy:=0 end;
   setcolor(0);
   Outtextxy(x2,y2,'*');
   setcolor(10);
   Outtextxy(x,y,'*');
   delay(10);
   x2:=x;
   y2:=y;
end;
end.
