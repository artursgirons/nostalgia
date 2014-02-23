Program KubeRotation;
uses graph,crt;
const p1=100;
      n=4;
      r=100;
var s1,s2,c1,c2:array[0..p1,1..(n+1)]of integer;
    yy,xxx,yyy,i,p,y1,y2,gm,gd,a,b,c:integer;
    rr,d,o,q:real;
    xx:word;
begin
d:=pi*2/n;
xxx:=1;yyy:=1;
xx:=320;yy:=50;
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
sound(1000);delay(10);nosound;
for a:=1 to p1 do
begin
i:=1-i;
setactivepage(i);
cleardevice;
if a=(p1 div 2) then begin sound(1000);delay(10);nosound end;
if a>(p1/2) then rr:=rr-0.01
else rr:=(a/100)+0.2;
y1:=(330-round(r*rr / 1.4)) div 2;
y2:=round(y1+r*rr);
for b:=1 to n do
begin
   line(xx+round(s1[a,b]*rr),y1+yy+round(c1[a,b]*rr),xx+round(s1[a,b+1]*rr),y1+yy+round(c1[a,b+1]*rr));{Augsa}
   line(xx+round(s1[a,b]*rr),y2+yy+round(c1[a,b]*rr),xx+round(s1[a,b+1]*rr),y2+yy+round(c1[a,b+1]*rr));{Apaksa}
   line(xx+round(s1[a,b]*rr),y1+yy+round(c1[a,b]*rr),xx+round(s1[a,b]*rr),y2+yy+round(c1[a,b]*rr));{Sani}
end;
xx:=xx+xxx;
yy:=yy+yyy;
if (xx>560) or (xx<70) then begin xxx:=-xxx;sound(1000);delay(10);nosound end;
if (yy>150) or (yy<-150) then begin yyy:=-yyy;sound(1000);delay(10);nosound end;
if keypressed then exit;
setvisualpage(i);
end;
end;
readkey;
end.
{setcolor(11);
line(0,0,70,25);
line(0,350,70,325);
line(640,0,560,25);
line(640,350,560,325);
line(70,325,560,325);
line(70,25,560,25);
line(70,25,70,325);
line(560,25,560,325);
setcolor(10);}
