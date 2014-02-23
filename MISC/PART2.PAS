Program Planes;
uses crt,graph;
const l=100;
var x1,y1,x2,y2:array[1..l]of real;
    xx1,yy1,xx2,yy2:real;
    a,b,d,gm,gd:integer;
    s,c:array[0..649]of real;
    ch:char;
    g1,g2,gg1,gg2:integer;
Procedure Plane(const x,y:real;const g:integer;const co:byte);
var xz,yx:real;
    z:word;
begin
 setcolor(co);
 line(trunc(x),trunc(y),trunc(x+s[g]*20),trunc(y+c[g]*20));
 line(trunc(x+s[g]*17),
 trunc(y+c[g]*17),
 trunc(x+s[g-80]*4),
 trunc(y+c[g-80]*4));
 line(trunc(x),trunc(y),trunc(x-s[g-70]*5),trunc(y-c[g-70]*5));
 if co = 10 then
 for a:=1 to l do
  if sqrt(sqr(x+s[g]*20)-sqr(x2[l]))<8 then begin outtext('Game Over!');readln;halt end
  else
 for a:=1 to l do
  if sqrt(sqr(x+s[g]*20)-sqr(x1[l]))<8 then begin outtext('Game Over!');readln;halt end;
end;
begin
 gm:=3;gd:=1;
 initgraph(gm,gd,'');
 x1[1]:=20;y1[1]:=100;x2[1]:=20;y2[1]:=250;
 g1:=157;
 g2:=157;
 for a:=0 to 649 do
 begin
  c[a]:=cos(a/100);
  s[a]:=sin(a/100);
 end;
while true do
begin
  Plane(x1[1],y1[1],g1,0);
  Plane(x2[1],y2[1],g2,0);
  putpixel(trunc(x1[l]),trunc(y1[l]),00);
  putpixel(trunc(x1[1]),trunc(y1[1]),10);
  putpixel(trunc(x2[l]),trunc(y2[l]),00);
  putpixel(trunc(x2[1]),trunc(y2[1]),12);
  g1:=g1+gg1;
  g2:=g2+gg2;
  xx1:=s[g1];
  yy1:=c[g1];
  xx2:=s[g2];
  yy2:=c[g2];
  x1[1]:=x1[1]+xx1;
  y1[1]:=y1[1]+yy1;
  x2[1]:=x2[1]+xx2;
  y2[1]:=y2[1]+yy2;
  Plane(x1[1],y1[1],g1,10);
  Plane(x2[1],y2[1],g2,12);
  if g1>648 then g1:=1;
  if g2>648 then g2:=1;
  if keypressed then
  begin
   ch:=readkey;
   Case ord(ch) of
    72:gg1:=gg1+1;
    80:gg1:=gg1-1;
    119:gg2:=gg2+1;
    115:gg2:=gg2-1;
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


