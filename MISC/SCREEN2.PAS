program Screen_save;
uses graph,crt;
const MaxPts = 30;
type PolygonType = array[1..MaxPts] of PointType;
var Poly,poly2,poly3,poly4,poly5: PolygonType;
    xe,ye,xx,yy: array[1..maxpts]of real;
    rrr,rrr1:array[1..maxpts]of integer;
    xg,yg,i,j,vid:integer;
    d:real;
begin
initgraph(xg,yg,'');
randomize;
d:=(maxpts-1)/(2*pi);
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
  xe[i]:=xe[i]+xx[i];
  ye[i]:=ye[i]+yy[i];
  rrr1[i]:=rrr1[i]+1;
  if rrr1[i]>rrr[i] then begin xx[i]:=-xx[i];yy[i]:=-yy[i];rrr1[i]:=0 end;
  with Poly[I] do
   begin
   x:=round(xe[i]);
   y:=round(ye[i]);
   if (i=maxpts)then begin x:=round(xe[1]); y:=round(ye[1]) end;
   end;
 end;
for i:= 1 to maxpts do vid:=vid+rrr1[i];
sound(100000 div (vid div maxpts));vid:=0;
setcolor(9);drawPoly(MaxPts, Poly);
{setcolor(0);drawPoly(MaxPts, Poly2);
setcolor(9);drawPoly(MaxPts, Poly4);}
setcolor(0);drawPoly(MaxPts, Poly5);
poly5:=poly4;
poly4:=poly3;
poly3:=poly2;
poly2:=poly;
until keypressed;
nosound;
closegraph;
end.
