uses graph,crt;
const g=9.8;
      v=11;
      vej=0.05;
      gr=50;
var a,h,s,vx,vy,v0,t:real;
    xg,yg,c:integer;
begin
initgraph(xg,yg,'');
a:=pi/180*gr;vx:=v*cos(a);v0:=v*sin(a);
setcolor(7);line(0,300,640,300);
for c:=0 to 34 do line(c*20,300,c*20-20,316);
circle(10,300,1);setcolor(2);
  repeat
  t:=t+0.01;
  vy:=v0-g*t;
  h:=h+vy;
  vx:=vx-vej;
  s:=s+vx;
  lineto(round(10+s),round(300-(h/1.4)));
  until (h=0)or (h<0);
readln;
closegraph;
end.