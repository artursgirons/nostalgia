Program KubeRotation;
uses graph,crt;
const p1=100;
      n=4;
      r=400;
var s1,s2,c1,c2:array[0..p1,1..(n+1)]of integer;
    i,p,y1,y2,gm,gd,a,b,c:integer;
    rr,d,o,q:real;
begin
d:=pi*2/n;
clrscr;gotoxy(36,12);textcolor(140);Writeln('Loading...');
for a:=1 to p1 do
for b:=1 to (n+1) do
begin
   q:=d*b+(pi*2/p1)*a;
   s1[a,b]:=round(cos(q)*r);
   s2[a,b]:=round(cos(q)*(r*1.5));
   c1[a,b]:=round(sin(q)*(r/4));
   c2[a,b]:=round(sin(q)*((r/4)*1.5));
end;
y1:=(330-round(r / 1.4)) div 2;
y2:=y1+r;
gd:=3;gm:=1;
initgraph(gd,gm,'');
setcolor(10);
while true do
begin
rr:=0;
for a:=1 to p1 do
begin
i:=1-i;
setactivepage(i);
cleardevice;
if a>(p1/2) then rr:=rr-0.01
else rr:=(a/100);
y1:=(330-round(r*rr / 1.4)) div 2;
y2:=round(y1+r*rr);
for b:=1 to n do
begin
   line(320+round(s1[a,b]*rr),y1+round(c1[a,b]*rr),320+round(s1[a,b+1]*rr),y1+round(c1[a,b+1]*rr));{Augsa}
   line(320+round(s1[a,b]*rr),y2+round(c1[a,b]*rr),320+round(s1[a,b+1]*rr),y2+round(c1[a,b+1]*rr));{Apaksa}
   line(320+round(s1[a,b]*rr),y1+round(c1[a,b]*rr),320+round(s1[a,b]*rr),y2+round(c1[a,b]*rr));{Sani}
end;
if keypressed then exit;
setvisualpage(i);
end;
end;
readkey;
end.
