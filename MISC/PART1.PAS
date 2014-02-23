Program Planes;
uses crt,graph;
const l=100;
var x1,y1,x2,y2:array[1..l]of real;
    xx1,yy1,xx2,yy2,g1,g2,gg1,gg2:real;
    a,b,c,d,gm,gd:integer;
    ch:char;
Procedure Plane(const x,y,g:real;const co:byte);
var xz,yx:real;
    z,s:word;
begin
 setcolor(co);
 line(round(x),round(y),round(x+sin(g)*20),round(y+cos(g)*20));
 line(round(x+sin(g)*17),round(y+cos(g)*17),round(x+sin(g-0.8)*4),round(y+cos(g-0.8)*4));
 line(round(x),round(y),round(x-sin(g-0.7)*5),round(y-cos(g-0.7)*5));
 if co = 10 then
 for a:=1 to l do
  if sqrt(sqr(x+sin(g)*20)-sqr(x2[l]))<8 then begin outtext('Game Over!');readln;halt end
  else
 for a:=1 to l do
  if sqrt(sqr(x+sin(g)*20)-sqr(x1[l]))<8 then begin outtext('Game Over!');readln;halt end;
end;
begin
 gm:=3;gd:=1;
 initgraph(gm,gd,'');
 x1[1]:=20;y1[1]:=100;x2[1]:=20;y2[1]:=250;
 g1:=1.57;
 g2:=1.57;
while true do
begin
  Plane(x1[1],y1[1],g1,0);
  putpixel(round(x1[l]),round(y1[l]),00);
  putpixel(round(x1[1]),round(y1[1]),10);

  Plane(x2[1],y2[1],g2,0);
  putpixel(round(x2[l]),round(y2[l]),00);
  putpixel(round(x2[1]),round(y2[1]),12);
  g1:=g1+gg1;
  g2:=g2+gg2;
  xx1:=sin(g1);
  yy1:=cos(g1);
  xx2:=sin(g2);
  yy2:=cos(g2);
  x1[1]:=x1[1]+xx1;
  y1[1]:=y1[1]+yy1;
  x2[1]:=x2[1]+xx2;
  y2[1]:=y2[1]+yy2;
  Plane(x1[1],y1[1],g1,10);
  Plane(x2[1],y2[1],g2,12);
  if keypressed then
  begin
   ch:=readkey;
   Case ord(ch) of
    72:gg1:=gg1+0.01;
    80:gg1:=gg1-0.01;
    119:gg2:=gg2+0.01;
    115:gg2:=gg2-0.01;
   End;
  end;
   for a:=l downto 2 do
   begin
    x1[a]:=x1[a-1];
    y1[a]:=y1[a-1];
    x2[a]:=x2[a-1];
    y2[a]:=y2[a-1];
   end;
end;
end.


