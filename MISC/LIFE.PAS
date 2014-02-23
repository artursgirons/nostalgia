Uses crt,graph;
const Prob=4;
      xl=212;
      yl=115;
var pix_new,pix_pre:array[0..xl,0..yl]of 0..1;
    x,y,a,s:word;
    gd,gm:integer;
procedure get_old;
begin
for x:=0 to xl do
for y:=0 to yl do
begin
if random(prob) = 0 then
pix_pre[x,y]:=1
else
pix_pre[x,y]:=0;
end;
end;
Procedure get_new;
begin
for x:=1 to xl-1 do
for y:=1 to yl-1 do
begin
s:=pix_pre[x+1,y]+pix_pre[x-1,y]+pix_pre[x,y+1]+pix_pre[x,y-1]+
pix_pre[x+1,y+1]+pix_pre[x-1,y-1]+pix_pre[x+1,y-1]+pix_pre[x-1,y+1];
if (pix_pre[x,y]=1) and ((s<2) or (s>3)) then
pix_new[x,y]:=0;
if (pix_pre[x,y]=0) and (s=3) then
pix_new[x,y]:=1;
end;
pix_pre:=pix_new;
end;
begin
gd:=3;gm:=1;
initgraph(gd,gm,'');
randomize;
get_old;
a:=1-a;
setactivepage(a);
for x:=1 to xl-1 do
for y:=1 to yl-1 do
if pix_pre[x,y]=1 then
putpixel(x*3,y*3,10);
setvisualpage(a);
while not keypressed do
begin
get_new;
a:=1-a;
setactivepage(a);
cleardevice;
for x:=1 to xl-1 do
for y:=1 to yl-1 do
if pix_new[x,y]=1 then
putpixel(x*3,y*3,10);
setvisualpage(a);
Delay(200);
end;
end.

