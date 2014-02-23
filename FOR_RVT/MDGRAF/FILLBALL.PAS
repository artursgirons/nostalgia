Uses Crt,Graph;
const p=round(pi*1000/2);
Var X,Y,R,T,A:Integer;
Begin
  Write('Ludzu ievadiet Rl Radiusu :');
  REadln(r);
  x:=9;y:=2;Initgraph(x,y,'');
  Circle(320,240,r);
  While True do
  Begin
  t:=0;
  While T<10000 do
  Begin
    Inc(t);
    A:=Random(p);
    x:=Round(320+Random(R)*sin(A/1000));
    y:=Round(240+Random(R)*Cos(a/1000));
    if getpixel(x,y)=0 then
         Begin
           t:=0;
           Putpixel(x,y,random(15)+1);
           Putpixel(640-x,y,random(15)+1);
           Putpixel(x,480-y,random(15)+1);
           Putpixel(640-x,480-y,random(15)+1)
         End;
    if keypressed then Halt;
  End;
  t:=0;
  While T<10000 do
  Begin
    Inc(t);
    A:=Random(p);
    x:=Round(320+Random(R)*sin(A/1000));
    y:=Round(240+Random(R)*Cos(a/1000));
    if getpixel(x,y)<>0 then
         Begin
           t:=0;
           Putpixel(x,y,0);
           Putpixel(640-x,y,0);
           Putpixel(x,480-y,0);
           Putpixel(640-x,480-y,0);
         End;
    if keypressed then Halt;
  End;
  setfillstyle(1,0);
  fillellipse(320,240,r-1,r-1);
  End;
  Closegraph;
End.