Program Stars;
Uses Graph,Crt;
Const n=100;
Type StarT=Record x,y:Real End;
Var s:Array[1..2,1..n] of StarT;
    Xx,Yy:Real;
    Gm,Gd:Integer;
    a,b,c:byte;
Procedure Key;
Var Ch:Char;
Begin
Ch:=ReadKey;if Ord(Ch)=0 then Ch:=ReadKey;
Case ord(Upcase(ch)) of
  72:Yy:=Yy+0.3;
  80:Yy:=Yy-0.3;
  75:Xx:=Xx+0.3;
  77:Xx:=Xx-0.3;
  13:Begin Xx:=0;Yy:=0 End;
  27:Begin CloseGraph;Halt End;
End;
End;
Begin
Randomize;
Gm:=3;Gd:=1;
InitGraph(Gm,Gd,'');
Setcolor(10);
for a:=1 to n do Begin s[1,a].x:=Random(640);s[1,a].y:=Random(350) End;
for a:=1 to (n div 2) do Begin s[2,a].x:=Random(640);s[2,a].y:=Random(350) End;
xx:=0.3;yy:=0.6;
While True do
Begin
  If Keypressed Then Key;
  c:=1-c;
  setactivepage(c);
  Cleardevice;
    for b:=1 to 2 do
    for a:=1 to (n div b) do
    Begin
      s[b,a].x:=s[b,a].x+(xx*(b*2-1));
      s[b,a].y:=s[b,a].y+(yy*(b*2-1));
      if s[b,a].x<0   then s[b,a].x:=640+s[b,a].x;
      if s[b,a].x>640 then s[b,a].x:=s[b,a].x-640;
      if s[b,a].y<0   then s[b,a].y:=350+s[b,a].y;
      if s[b,a].y>350 then s[b,a].y:=s[b,a].y-350;
      SetColor(2+((b-1)*8));
      Outtextxy(Round(s[b,a].x),Round(s[b,a].y),chr(random(255)+1));
    End;
{  Setcolor(10);
  line(320,165,320,155);line(320,185,320,195);
  line(321,165,321,155);line(321,185,321,195);
  line(307,175,293,175);line(333,175,346,175);
  putpixel(320,175,10);{Circle(320,175,20);}
  Setvisualpage(c);
End;
End.
