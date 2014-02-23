uses graph,crt;
const MaxPts = 50;
type PolygonType = array[1..MaxPts] of PointType;
var Poly: PolygonType;
    poly2:array[1..10]of PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of integer;
    xg,yg,i,j,l:integer;
    d:real;
begin
initgraph(xg,yg,'');
randomize;
d:=(maxpts-1)/(2*pi);
j:=round(random*8-4);
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
   if (i=maxpts)then begin x:=xe[1]; y:=ye[1] end;
   end;
 end;
poly2[1]:=poly;
setcolor(10);drawPoly(MaxPts, Poly2[1]);
setcolor(0);drawPoly(MaxPts, Poly2[10]);
for l:=10 downto 2 do poly2[l]:=poly2[l-1];
until keypressed;
closegraph;
end.
