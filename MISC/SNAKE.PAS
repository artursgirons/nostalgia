program Snake;
uses crt,graph;
const s=8;
var x,y:array[1..100] of integer;
    xx,yy,xx2,yy2,xg,yg,a,f,dx,dy,xp,yp:integer;
    ch:char;
procedure Over;
begin
 textcolor(0);
 clrscr;
 setcolor(12);
 Outtextxy(300,170,'Game over');
 readln;
 closegraph;
end;
Procedure Poga;
Begin
 xx2:=xx;yy2:=yy;
  Case ord(ch) of
  77:if xx2=0 then begin yy:=0;xx:=s end;
  75:if xx2=0 then begin yy:=0;xx:=-s end;
  80:if yy2=0 then begin xx:=0;yy:=s end;
  72:if yy2=0 then begin xx:=0;yy:=-s end;
  End;
End;
BEGIN
 initgraph(xg,yg,'');
 randomize;
 f:=2;
 xx:=s;
 x[1]:=s;
 y[1]:=s;
 dy:=345 div s;
 dx:=635 div s;
 setcolor(11);
 rectangle(0,0,s*dx,s*dy);
 xp:=(random(dx-1)+1)*s;
 yp:=(random(dy-1)+1)*s;
 setcolor(12);
 circle(xp,yp,s div 2-1);
repeat
 delay(55-(f div 2));
 if keypressed then
 begin
   ch:=readkey;
   ch:=readkey;
   poga;
 end;
 for a:= f downto 2 do
 begin
   if ((x[1]=x[a])and(y[1]=y[a])) then
   begin
     over;
     exit;
   end;
   x[a]:=x[a-1]; y[a]:=y[a-1];
 end;
 if (x[1]=xp) and (y[1]=yp) then
 begin
   setcolor(0);circle(xp,yp,s div 2-1);
   xp:=(random(dx-1)+1)*s;yp:=(random(dy-1)+1)*s;
   setcolor(12);circle(xp,yp,s div 2-1);
   f:=f+10;
   if f>100 then
   begin
     over;
     exit;
   end;
 end;
 x[1]:=x[1]+xx;
 y[1]:=y[1]+yy;
 if (x[1]>s*dx-s) or (x[1]<s) or (y[1]>s*dy-s) or (y[1]<s) then
 begin
   over;
   exit;
 end;
 setcolor(10);
 circle(x[1],y[1],s div 2);
 setcolor(0);
 circle(x[f],y[f],s div 2);
until ch=chr(27);
END.

