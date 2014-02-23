uses graph,crt;
const MaxPts = 6;
type PolygonType = array[1..MaxPts] of PointType;
var Poly,poly2 : PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of integer;
    xg,yg,g,i:integer;
begin
initgraph(xg,yg,'');
setcolor(0);
randomize;
for g:= 1 to maxpts do begin
 Xe[g] := Random(130)+5;
 Ye[g] := Random(90)+5;
 xx[g]:=random(10)-5;
 yy[g]:=random(10)-5;
end;
repeat
g:=0;
 for g := 1 to MaxPts do
 begin
   Xe[g] := xe[g]+xx[g];
   Ye[g] := ye[g]+yy[g];
   if (xe[g]>140) or (xe[g]<0) then xx[g]:=-xx[g];
   if (ye[g]>100) or (ye[g]<0) then yy[g]:=-yy[g];
 end;
 for I := 1 to MaxPts do
 with Poly[I] do
   begin
   x:=xe[i];
   y:=ye[i];
   if (i=maxpts)then begin x:=xe[1]; y:=ye[1] end;
   end;
setfillstyle(5,2);
fillPoly(MaxPts, Poly);
setfillstyle(5,0);
fillPoly(MaxPts, Poly);
poly2:=poly;
until KeyPressed;
closegraph;
end.

