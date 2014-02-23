uses graph,crt;
const MaxPts = 50;
type PolygonType = array[1..MaxPts] of PointType;
var Poly,poly2: PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of integer;
    xg,yg,i,j:integer;
    d:real;
begin
initgraph(xg,yg,'');
randomize;
d:=(maxpts-1)/(2*pi);
while j<>0 do;
j:=1;
for i:= 1 to maxpts do begin
 xe[i] := round(320+sin(i/d)*200);
 ye[i] := round(175+cos(i/d)*143);
 xx[i]:=j;
 yy[i]:=j;
end;
repeat
for I := 1 to MaxPts do
 begin
  xe[i]:=xe[i]+xx[i];
  ye[i]:=ye[i]+yy[i];
  if (xe[i]>639) or (xe[i]<0) then xx[i]:=-xx[i];
  if (ye[i]>349) or (ye[i]<0) then yy[i]:=-yy[i];
  with Poly[I] do
   begin
   x:=xe[i];
   y:=ye[i];
   end;
 end;
SETCOLOR(2);DRAWPoly(MaxPts, Poly);
SETCOLOR(0);DRAWPoly(MaxPts, Poly2);
poly2:=poly;
until keypressed;
closegraph;
end.
