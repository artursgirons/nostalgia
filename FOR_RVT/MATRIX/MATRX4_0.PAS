Program Matrix;
Uses Graph,crt;
const n1=10;n2=10;
Var m:array[1..n1,1..n2]of record x,y,yy:real;ch:char;k,c:byte end;
    a,b,k:Integer;
Begin
Randomize;
a:=3;b:=1;
InitGraph(a,b,'');
for a:=1 to n1 do for b:=1 to n2 do m[a,b].y:=351;
While Not keypressed do
Begin
  k:=1-k;SetActivePage(k);cleardevice;
  for a:=1 to n1 do
    for b:=1 to n2 do
    Begin
      if (m[a,b].y>350)or(m[a,b].y<1) then
      Begin
        m[a,b].yy:=Random(50);
        m[a,b].yy:=(m[a,b].yy-29)/10;
        if m[a,b].yy=0 then m[a,b].yy:=2;
        m[a,b].x:=Random(630)+1;
        m[a,b].y:=Random(300)+25;
        m[a,b].ch:=Chr(Random(255)+1);
        m[a,b].k:=0;
        m[a,b].c:=random(2)*8+2;
      End;
      m[a,b].y:=m[a,b].y+m[a,b].yy;
      inc(m[a,b].k);
      if m[a,b].k<5 then setcolor(15) else Begin setcolor(m[a,b].c);m[a,b].k:=6 End;
      outtextxy(round(m[a,b].x),Round(m[a,b].y),m[a,b].ch);
    End;
  setvisualpage(k);
End;
Closegraph;
End.