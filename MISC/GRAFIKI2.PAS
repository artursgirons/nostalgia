Program Grafiki;
uses graph,crt;
const r=1.4285714286;
var a,gm,gd:integer;
    xa,ya:word;
    x,y,a2:real;
Procedure Net;
var b:word;
begin
 setcolor(8);
 for b:=0 to 64 do line(b*10,0,b*10,350);
 for b:=0 to 44 do line(0,b*8,640,b*8);
 line(638,0,638,350);
 setcolor(2);
 line(0,176,640,176);
 line(320,0,320,350);
 line(320,0,320,350);
 line(321,0,321,350);
 line(320,0,323,7);
 line(640,176,631,178);
 setcolor(7);
 Outtextxy(310,0,'y');
 Outtextxy(630,167,'x');
end;
begin
gm:=3;gd:=1;
initgraph(gm,gd,'');
setviewport(1,1,639,337,true);
Net;
moveto(-10,-10);
setcolor(0);
for a:=-320 to 320 do
begin
 if a=-320 then SetWriteMode(XORPut);
 a2:=a/10;
 x:=sin(a2)*20;
{if x<>0 then}
 y:=cos(a2)*sin(a2)*10;
 lineto(round(320+x*10),round(176-y*8));
 if a=-320 then
 begin
  SetWriteMode(XORPut);
  lineto(round(320+x*10),round(176-y*8));
  SetWriteMode(0);
  setcolor(10);
 end;
end;
setcolor(7);
outtextxy(2,329,'Press any key to continious.');
readkey;
closegraph;
end.