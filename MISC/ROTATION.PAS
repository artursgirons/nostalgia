Program KubeRotation;
uses graph,crt;
const p1=100;
      n=4;
      r=100;
var s1,s2,c1,c2:array[0..p1,1..(n+1)]of integer;
    i,p,y1,y2,gm,gd,a,b,c:integer;
    d,o,q:real;
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
y1:=(330-r div 2) div 2;
y2:=y1+r;
gd:=3;gm:=1;
initgraph(gd,gm,'');
setcolor(10);
while true do
begin
for a:=1 to p1 do
begin
i:=1-i;
setactivepage(i);
cleardevice;
for b:=1 to n do
begin
   line(320+s1[a,b],y1+c1[a,b],320+s1[a,b+1],y1+c1[a,b+1]);{Augsa}
   line(320+s1[a,b],y2+c1[a,b],320+s1[a,b+1],y2+c1[a,b+1]);{Apaksa}
   line(320+s1[a,b],y1+c1[a,b],320+s1[a,b],y2+c1[a,b]);{Sani}
   line(320+s1[a,b],y1+c1[a,b],320+s2[a,b],y1-round(sqrt(sqr(r/2)/2))+c2[a,b]);{Adatas up}
   line(320+s1[a,b],y2+c1[a,b],320+s2[a,b],y2+round(sqrt(sqr(r/2)/2))+c2[a,b]);{Adatas down}
   if keypressed then exit;
end;
setvisualpage(i);
end;
end;
readkey;
end.
