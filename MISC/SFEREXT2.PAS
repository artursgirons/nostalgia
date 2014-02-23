uses graph,crt;
const MaxPts = 50;
type PolygonType = array[1..MaxPts] of PointType;
var Poly: PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of integer;
    h,de,xg,yg,i,j,fg:integer;
    d:real;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
randomize;
d:=(maxpts)/(2*pi);
fg:=25;
while j<>0 do;
j:=1;
for i:= 1 to maxpts do begin
 xe[i] := round(320+sin(i/d)*150);
 ye[i] := round(175+cos(i/d)*(150/1.4));
 xx[i]:=j;
 yy[i]:=j;
end;
repeat
h:=1-h;
setactivepage(h);
cleardevice;
for I := 1 to 50 do
 begin
  xe[i]:=xe[i]+xx[i];
  ye[i]:=ye[i]+yy[i];
   if (xe[i]>639) or (xe[i]<0) then xx[i]:=-xx[i];
  if (ye[i]>349) or (ye[i]<0) then yy[i]:=-yy[i];
  end;
for I := 1 to 26 do
begin
   if fg = 25 then begin de:=25;fg:=0 end else begin fg:=25;de:=0 end;
   with Poly[I] do
   begin
   x:=xe[i+de];
   y:=ye[i+de];
   end;
end;
SETCOLOR(9);DRAWPoly(MaxPts, Poly);
SETVISUALPAGE(h);
delay(500);
until keypressed;
closegraph;
end.
