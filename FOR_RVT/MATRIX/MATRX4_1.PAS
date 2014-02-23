Program Matrix;
Uses Graph,Crt;
Const N=25;
      L=20;
Var m:Array[1..n] of Record x,y,yy:Real;ch:Array[1..l]of Char;co:Array[1..l]of byte;n,k:Byte;odd:Shortint End;
    a,b,c,k:Integer;
Begin
Randomize;
a:=3;b:=1;InitGraph(a,b,'');
for a:=1to n do m[a].y:=500;
While True do
Begin
  k:=1-k;SetActivePage(k);Cleardevice;
  For a:=1 to n do
  Begin
    m[a].y:=m[a].y+m[a].yy;
    if (m[a].y>(350+m[a].n*10))or(m[a].y<(-m[a].n*10)) then
    Begin
      m[a].k:=0;m[a].odd:=random(2);if m[a].odd=0 then m[a].odd:=-1;
      m[a].x:=Random(630)+5;m[a].y:=Random(250)+50;m[a].yy:=(Random(50)+10)/10*m[a].odd;
      m[a].n:=Random(l)+1;for b:=1 to m[a].n do Begin m[a].ch[b]:=Chr(Random(222)+33);m[a].co[b]:=random(2)*8+2;End;
    End;
    if m[a].k=m[a].n then dec(m[a].k);
    Inc(m[a].k);
    For b:=1 to m[a].k do
    Begin
       if Keypressed Then Begin CloseGraph;Halt End;
       if (b=m[a].k)and(m[a].k<>m[a].n) then setcolor(15) else setcolor(m[a].co[b]);
       OutTextXY(Round(m[a].x),Round(m[a].y-(b*10)*m[a].odd),m[a].ch[b]);
    End;
  End;
  SetVisualPage(k);
End;
End.