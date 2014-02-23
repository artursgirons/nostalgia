uses dos,crt,graph;
var s,m,se,me:word;
    sw,mw,sew,mew:string[2];
    tim,tim2:string[8];
    x,y,x2,y2,xx,yy,xg,yg:integer;
begin
initgraph(xg,yg,'');
settextstyle(5,0,3);
x:=100;
y:=100;
xx:=-1;
yy:=-1;
while not(keypressed) do
begin
GetTime(s,m,se,me);
str(s,sw);
str(m,mw);
str(se,sew);
tim:=sw+':'+mw+':'+sew;
x:=x+xx;
y:=y+yy;
if (x>550)or(x<5)then xx:=-xx;
if (y>320)or(y<5)then yy:=-yy;
setcolor(0);
outtextxy(x2,y2,tim2);
setcolor(10);
outtextxy(x,y,tim);
tim2:=tim;
x2:=x;
y2:=y;
end;
closegraph;
end.
