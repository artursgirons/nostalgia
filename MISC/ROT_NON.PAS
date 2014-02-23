Program KubeRotation;
uses graph,crt;
const p1=100;
      n=4;
      r=100;
var s1,s2,c1,c2:array[0..p1,1..(n+1)]of integer;
    ss,i,p,y1,y2,gm,gd,a,b,c:integer;
    d,o,q:real;
begin
d:=pi*2/n;
for a:=1 to p1 do
for b:=1 to (n+1) do
begin
   q:=d*b+(pi*2/p1)*a;
   s1[a,b]:=round(cos(q)*r);
   s2[a,b]:=round(cos(q)*(r*1.5));
   c1[a,b]:=round(sin(q)*(r/4));
   c2[a,b]:=round(sin(q)*((r/3)*1.5));
end;
y1:=(330-r div 2) div 2;
y2:=y1+r;
gd:=3;gm:=1;
initgraph(gd,gm,'');
setcolor(10);
settextstyle(9,0,3);
ss:=350;
while true do
begin
for a:=1 to p1 do
begin
i:=1-i;
setactivepage(i);
cleardevice;
for b:=1 to n do
begin
   q:=d*b+(pi*2/p1)*a;
   line(320+s1[a,b],y1+c1[a,b],320+s1[a,b+1],y1+c1[a,b+1]);{Augsa}
   if (sin(q+(d/2))>sin(d*2)) then
   line(320+s1[a,b],y2+c1[a,b],320+s1[a,b+1],y2+c1[a,b+1]);
   if sin(q)>sin(d*2+d/2) then
   line(320+s1[a,b],y1+c1[a,b],320+s1[a,b],y2+c1[a,b]);{Sani}
{  line(320+s1[a,b],y1+c1[a,b],320+s2[a,b],y1-round(sqrt(sqr(r/2)/2))+c2[a,b]);
   if sin(q)>sin(d*2+d/2) then
   line(320+s1[a,b],y2+c1[a,b],320+s2[a,b],y2+round(sqrt(sqr(r/2)/2))+c2[a,b]);
}  if keypressed then exit;
end;
setcolor(12);
ss:=ss-2;
if ss<-45 then ss:=350;
outtextxy(210,ss,'It''s 3D cube.');
setcolor(10);
setvisualpage(i);
end;
end;
readkey;
end.
