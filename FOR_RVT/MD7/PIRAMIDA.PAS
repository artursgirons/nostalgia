uses graph,crt;
Var a,b,c:integer;
Begin
a:=3;b:=1;
Initgraph(a,b,'');
b:=0;
Setcolor(10);
While not keypressed do
Begin
for a:=1 to 157 do
Begin
b:=1-b;
setactivepage(b);
Cleardevice;
for c:=1 to 4 do
Begin
line(320,110,Round(320+cos(a/100+c*1.57)*100),Round(280+sin(a/100+c*1.57)*20));
line(Round(320+cos(a/100+c*1.57)*100),Round(280+sin(a/100+c*1.57)*20),
     Round(320+cos(a/100+(c+1)*1.57)*100),Round(280+sin(a/100+(c+1)*1.57)*20))
End;
if keypressed then break;
setvisualpage(b);
delay(200);
End;
End;
End.
