{$N+}
uses graph,crt;
var x,y,x2,y2:array[1..200]of real;
    k,g,a,b,t,d,xg,yg:integer;
procedure egle(const xc:integer;yc:integer;const ups:integer);
var h,d,ex,ey,esx,esy:integer;
begin
yc:=yc+75;
setcolor(2);
line(xc,yc,xc,yc-ups*15);
for h:=0 to ups do
    begin
    setcolor(2);
    line(xc-4*(d-1),yc-4*(d-1)-h*15,xc,yc-h*15);
    line(xc+(xc-(xc-4*(d-1))),yc-4*(d-1)-h*15,xc,yc-h*15);
    for d:=0 to ups-h do
        begin
        line(xc-4*d,yc-4*d-h*15,xc-4*d-1,yc-4*d-5-h*15);
        line(xc-4*d,yc-4*d-h*15,xc-4*d-5,yc-4*d-1-h*15);
        line(xc+(xc-(xc-4*d)),yc-4*d-h*15,xc+(xc-(xc-4*d-1)),yc-4*d-5-h*15);
        line(xc+(xc-(xc-4*d)),yc-4*d-h*15,xc+(xc-(xc-4*d-5)),yc-4*d-1-h*15);
        line(xc-4*d+1,yc-4*d-h*15,xc+1-4*d-1,yc-4*d-5-h*15);
        line(xc-4*d+1,yc-4*d-h*15,xc+1-4*d-5,yc-4*d-1-h*15);
        line(xc+1+(xc-(xc-4*d)),yc-4*d-h*15,xc+1+(xc-(xc-4*d-1)),yc-4*d-5-h*15);
        line(xc+1+(xc-(xc-4*d)),yc-4*d-h*15,xc+1+(xc-(xc-4*d-5)),yc-4*d-1-h*15);
        end;
    end;
    SetFillStyle(1, 0);
    setcolor(0);
    Bar3D(xc-100,yc,xc+100,yc-75,0,topoff);
end;

procedure Put_up;
begin
b:=b-1;
  for k:=1 to b do
  begin x[k]:=x[k+1];y[k]:=y[k+1];x2[k]:=x2[k+1];y2[k]:=y2[k+1] end;
end;

procedure Put_up2;
begin
b:=b-1;
  for k:= a to b do
  begin x[k]:=x[k+1];y[k]:=y[k+1];x2[k]:=x2[k+1];y2[k]:=y2[k+1] end;
end;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
randomize;
t:=0;b:=1;
  egle(610,344,20);
  egle(100,344,15);
  egle(480,344,13);
  setcolor(9);
  line(0,343,640,343);
  Settextstyle(7,0,5);
   Outtextxy(65,130,'Marry Cristmas people.');
   Outtextxy(65,131,'Marry Cristmas people.');
   Outtextxy(66,130,'Marry Cristmas people.');
   Outtextxy(66,131,'Marry Cristmas people.');
setcolor(15);
repeat
t:=t+1;
for a:=1 to b do
begin
    if t=2 then
    begin
       t:=0;
       b:=b+1;
       g:=g+random(100)+10;
       if g>640 then g:=-random(40);
       x[b]:=g;y[b]:=-5;
    end;
    x[a]:=x[a]+0.2;
    y[a]:=y[a]+1;
    if (y[a] > 20) and (getpixel(round(x[a]),round(y[a])) <> 0) then
    begin
         x[a]:=x[a]-0.2;
         if (getpixel(round(x[a]+1),round(y[a]))<>0) and (getpixel(round(x[a]-1),round(y[a]))<>0)
         then Put_up2
         else
         begin
         if (getpixel(round(x[a]+1),round(y[a]))=0)
         then x[a]:=x[a]+1
         else
         if (getpixel(round(x[a]-1),round(y[a]))=0)
         then x[a]:=x[a]-1;
         end;
    End;
      putpixel(round(x[a]),round(y[a]),15);
      putpixel(round(x2[a]),round(y2[a]),0);
      x2[a]:=x[a];
      y2[a]:=y[a];
{    if y[a]>340 then Put_up;}
end;
until keypressed;
end.