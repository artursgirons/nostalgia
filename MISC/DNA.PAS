uses graph,crt;
const r1=80;
      r2=15;
      ro=10;
var a,xg,yg:integer;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
setcolor(10);
textcolor(0);
window(40-(r1 div  7),2,40+(r1 div 7),25);
repeat
for a:=1 to 628 div ro do
    begin
    writeln;
    line (round(320+sin(a/(100/ro))*r1),round(330+cos(a/(100/ro))*r2),round(320-sin(a/(100/ro))*r1),
    round(330-cos(a/(100/ro))*r2));
    circle(round(320+sin(a/(100/ro))*r1),round(330+cos(a/(100/ro))*r2),2);
    circle(round(320-sin(a/(100/ro))*r1),round(330-cos(a/(100/ro))*r2),2);
    end;
until keypressed;
closegraph;
end.