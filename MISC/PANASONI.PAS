Program Burtu_Vilnis;
uses crt,graph;
var pic:array[0..170,0..40]of byte;
    d,a,b,c,xg,yg:integer;
    s:word;
begin
xg:=3;yg:=1;
initgraph(xg,yg,'');
setactivepage(1);
settextstyle(8,0,4);
outtextxy(1,1,'Panasonic');
outtextxy(1,2,'Panasonic');
outtextxy(2,2,'Panasonic');
for b:=0 to 40 do
for a:=0 to 170 do
pic[a,b]:=getpixel(a,b);
while not keypressed do
begin
for d:=-round(pi*10) to round(pi*10) do
begin
c:=1-c;
setactivepage(c);
cleardevice;
for b:=0 to 40 do
for a:=0 to 170 do
if pic[a,b]<>0 then
   begin
   putpixel(235+a,round(140+b+cos(a/20+d/10)*10),12);
   end;
if keypressed then exit;
setvisualpage(c);
Delay(500);
end;
end;
end.
