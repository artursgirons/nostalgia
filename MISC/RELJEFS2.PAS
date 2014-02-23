Program RELJEFS;
uses crt,graph;
const q1=10;{pa cik palielinas pa dioganali}
      q2=10;{Plaknes izstiepums pa X}
      q3=5;{Vilna biezums pa X}
      q4=3.5;{Vilna biezums pa Y}
      q5=13;{plaksnes izsiepums pa Y}
      q6=50;{Vilna augstums pa Y}
var x,y:array[0..10,0..50]of real;
    a1,a2,xg,yg:integer;
begin
initgraph(xg,yg,'');
setcolor(2);
outtextxy(290,170,'Loading...');
setactivepage(1);
for a1:=1 to 10 do
begin
setcolor(0);
circle(round(10+(a1*q1)+(1*q2)),round(100+sin(1/q3)*(cos((5-a1)/q4)*q6)+(a1*q5)),0);
setcolor(10);
for a2:=1 to 50 do
begin
y[a1,a2]:=100+sin(a2/q3)*(cos((5-a1)/q4)*q6)+(a1*q5);
x[a1,a1]:=10+(a1*q1)+(a2*q2);
lineto(round(x[a1,a1]),round(y[a1,a2]));
end;
end;
for a2:=1 to 50 do
begin
setcolor(0);
circle(round((10+(1*q1)+(a2*q2))),-1+round(100+sin(a2/q3)*(cos((5-1)/q4)*q6)+(1*q5)),0);
setcolor(10);
for a1:=1 to 10 do
begin
y[a1,a2]:=100+sin(a2/q3)*(cos((5-a1)/q4)*q6)+(a1*q5);
x[a1,a1]:=10+(a1*q1)+(a2*q2);
lineto(round(x[a1,a1]),round(y[a1,a2]));
end;
end;
setvisualpage(1);
readkey;
closegraph;
end.