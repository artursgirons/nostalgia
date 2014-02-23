program Snake;
uses crt,graph;
const s=7;
var x,y:array[1..10000] of integer;
    sc,score,xx,yy,xx2,yy2,xg,yg,a,f,dx,dy,xp,yp:integer;
    ch:char;
    st:string[10];
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
 initgraph(xg,yg,'');randomize;
 setfillstyle(1,7);bar(7,8,629,335);
 setfillstyle(1,0);bar(14,14,622,328);
 f:=2;xx:=7;
 x[1]:=14;y[1]:=14;
 dy:=300 div s;dx:=600 div s;
 xp:=(random(dx-1)+3)*s;yp:=(random(dy-1)+3)*s;
 setfillstyle(1,12);bar(xp,yp,xp+6,yp+6);
 outtextxy(14,0,'Score :');outtextxy(75,0,'0');
repeat
 delay(60-(f div 200));
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
   sc:=sc+1;score:=score+sc;str(score,st);
   setfillstyle(1,0);bar(70,0,100,7);outtextxy(75,0,st);
   xp:=(random(dx-1)+3)*s;yp:=(random(dy-1)+3)*s;
   setfillstyle(1,12);bar(xp,yp,xp+6,yp+6);
   f:=f+10;
   if f>9990 then
   begin
     over;
     exit;
   end;
 end;
 x[1]:=x[1]+xx;
 y[1]:=y[1]+yy;
 if (x[1]>622) or (x[1]<14) or (y[1]>328) or (y[1]<14) then
 begin
   over;
   exit;
 end;
 setfillstyle(1,2);
 bar(x[1],y[1],x[1]+6,y[1]+6);
 setfillstyle(1,0);
 bar(x[f],y[f],x[f]+6,y[f]+6);
until ch=chr(27);
END.

