uses graph,crt;
const MaxPts = 30;
type PolygonType = array[1..MaxPts] of PointType;
var Poly,poly2,poly3,poly4: PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of real;
    rrr,rrr1:array[1..maxpts]of integer;
    xg,yg,i,j,vid,xl,yl:integer;
    d:real;
begin
initgraph(xg,yg,'');
randomize;
d:=(maxpts-1)/(2*pi);
xl:=1;yl:=1;
while j<>0 do;
j:=round(random*8-4);
for i:= 1 to maxpts do begin
 xe[i] := round(320+sin(i/d)*50);
 ye[i] := round(175+cos(i/d)*(50/1.4));
 xx[i]:=(xe[i]-320)/10;
 yy[i]:=(ye[i]-175)/10;
 rrr[i]:=random(30)+5;
end;
repeat
for I := 1 to MaxPts do
 begin
  xe[i]:=xe[i]+xx[i]+xl;
  ye[i]:=ye[i]+yy[i]+yl;
  rrr1[i]:=rrr1[i]+1;
  if rrr1[i]>rrr[i] then begin xx[i]:=-xx[i];yy[i]:=-yy[i];rrr1[i]:=0 end;
  with Poly[I] do
   begin
   x:=round(xe[i]);
   y:=round(ye[i]);
   if (i=maxpts)then begin x:=round(xe[1]); y:=round(ye[1]) end;
   end;
 end;
if (xe[6]>639) or (xe[22]<0) then xl:=-xl;
if (ye[1]>339) or (ye[16]<0) then yl:=-yl;
setcolor(9);drawPoly(MaxPts, Poly);
setcolor(0);drawPoly(MaxPts, Poly4);
poly4:=poly3;
poly3:=poly2;
poly2:=poly;
until keypressed;
nosound;
closegraph;
end.
