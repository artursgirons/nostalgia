uses graph;
var xg,yg:integer;
procedure egle(const xc:integer;yc:integer;const ups:integer);
var h,d,ex,ey,esx,esy:integer;
begin
yc:=yc+75;
setcolor(10);
line(xc,yc,xc,yc-ups*15);
for h:=0 to ups do
    begin
    setcolor(10);
    line(xc-4*(d-1),yc-4*(d-1)-h*15,xc,yc-h*15);
    line(xc+(xc-(xc-4*(d-1))),yc-4*(d-1)-h*15,xc,yc-h*15);
    for d:=0 to ups-h do
        begin
        line(xc-4*d,yc-4*d-h*15,xc-4*d-1,yc-4*d-5-h*15);
        line(xc-4*d,yc-4*d-h*15,xc-4*d-5,yc-4*d-1-h*15);
        line(xc+(xc-(xc-4*d)),yc-4*d-h*15,xc+(xc-(xc-4*d-1)),yc-4*d-5-h*15);
        line(xc+(xc-(xc-4*d)),yc-4*d-h*15,xc+(xc-(xc-4*d-5)),yc-4*d-1-h*15);
        end;
    end;
    SetFillStyle(1, 0);
    setcolor(0);
    Bar3D(xc-100,yc,xc+100,yc-75,0,topoff);
end;
begin
initgraph(xg,yg,'');
setcolor(10);
egle(100,350,20);
egle(300,350,16);
egle(440,350,12);
egle(530,350,10);
readln;
end.