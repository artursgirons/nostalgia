uses graph,crt;
var xgp2,ygp2,xg,yg:integer;
Procedure Labirints(xgp,ygp:integer);
var xp,yp,x2p,y2p,dp,fxp,fyp,jp:integer;
begin
cleardevice;
setcolor(10);
rectangle(2,2,xgp-(xgp mod 10) +12,ygp-(ygp mod 8)+10);
repeat;
xp:= round(random*INT((xgp/10-1)))*10+12;
yp:= round(random*INT((ygp/8-1)))*8+10;
dp:= round(random(4)+1);fxp:=0;fyp:=0;
CASE dp of
1: begin x2p:=xp+10;y2p:=yp;fxp:=5 end;
2: begin x2p:=xp-10;y2p:=yp;fxp:=-5 end;
3: begin y2p:=yp+8;x2p:=xp;fyp:=4 end;
4: begin y2p:=yp-8;x2p:=xp;fyp:=-4 end;
end;
IF not((getpixel(xp, yp) = 10) AND (getpixel(x2p, y2p) = 10) AND ((getpixel(x2p - 10, y2p - fyp) = 10)
OR (getpixel(x2p + 10, y2p - fyp) = 10))AND ((getpixel(x2p - fxp, y2p - 8) = 10)OR(getpixel(x2p - fxp, y2p + 8) = 10))) THEN
begin LINE (xp,yp,x2p,y2p);jp:=0;end;
jp:=jp+1;
until (jp>20);
end;
begin;
initgraph(xg,yg,'');
xgp2:=625;ygp2:=320;
labirints(xgp2,ygp2);
setcolor(7);
outtextxy(5,335,'Press any key to continious.');
Readkey;
closegraph;
end.
