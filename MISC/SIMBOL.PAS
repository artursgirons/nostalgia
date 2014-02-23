Program Pumpainis;
uses graph,crt;
var a,b,c,gm,gd:integer;
    d,e,f:real;
begin
gm:=3;gd:=1;
initgraph(gm,gd,'');
f:=0.2;
repeat
f:=f+0.1;
a:=round(sin(f)*200);
e:=e+0.05;
for b:=0 to 15 do
begin
setfillstyle(1,2);
fillellipse(round(320+sin(b*4/10+e)*a),round(175+cos(b*4/10+e)*(a/1.4)),10,10);
setfillstyle(1,10);
fillellipse(round(323+sin(b*4/10+e)*a),round(178+cos(b*4/10+e)*(a/1.4)),6,6);
end;
until a<50;
readkey;
end.