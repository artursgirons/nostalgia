uses graph,crt;
var x,y,x2,y2,u,uu,u1:real;
    c,xg,yg,j:integer;
procedure solis;
   begin
   u:=0.8;uu:=0;
   for c:=-7 to 8 do
       begin
       x2:=320+sin(-c/10)*24;
       y2:=175+cos(-c/10)*20;
       u:=u-uu;uu:=uu+0.011;
       setcolor(10);
       line(320,175,round(x2),round(y2));
       line(320,175,round(320+sin(c/10)*48),round(175+cos(c/10)*40));
       line(round(x2),round(y2),round(x2+sin(u)*24),round(y2+cos(u)*20));
       SetWriteMode(XORPut);
       line(320,145,round(320+sin(c/10)*28),round(145+cos(c/10)*23));
       line(320,145,round(320+sin(-c/10)*28),round(145+cos(-c/10)*23));
       line(round(320+sin(-c/10)*28),round(145+cos(-c/10)*23),
       round(320+sin(-c/10-0.7)*28),round(145+cos(-c/10-0.7)*23));
       line(round(320+sin(c/10)*28),round(145+cos(c/10)*23),
       round(320+sin(c/10-0.7)*28),round(145+cos(c/10-0.7)*23));
       delay(50);
       line(320,145,round(320+sin(c/10)*28),round(145+cos(c/10)*23));
       line(320,145,round(320+sin(-c/10)*28),round(145+cos(-c/10)*23));
       line(round(320+sin(-c/10)*28),round(145+cos(-c/10)*23),
       round(320+sin(-c/10-0.7)*28),round(145+cos(-c/10-0.7)*23));
       line(round(320+sin(c/10)*28),round(145+cos(c/10)*23),
       round(320+sin(c/10-0.7)*28),round(145+cos(c/10-0.7)*23));
       SetWriteMode(0);
       setcolor(0);
       line(320,175,round(x2),round(y2));
       line(320,175,round(320+sin(c/10)*48),round(175+cos(c/10)*40));
       line(round(x2),round(y2),round(x2+sin(u)*24),round(y2+cos(u)*20));
       end;
   end;
begin
initgraph(xg,yg,'');
setcolor(10);
line(320,175,320,142);
circle(320,136,8);
repeat
solis;
until keypressed;
closegraph;
end.