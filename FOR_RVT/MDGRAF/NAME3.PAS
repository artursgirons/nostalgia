Uses graph,vesa2,crt,Bmp_Wiew;
var x,y,c:integer;
    c1,c2:Word;
    xx,yy:byte;
    xxx,yyy:shortint;
    m:Array[0..212,0..66]of byte;
    cos_,sin_:array[0..628] of shortint;
Begin
  for x:= 0 to 628 do
  BEgin
  sin_[x]:=round(Sin(x/100)*30);
  cos_[x]:=round(cos(x/100)*30);
  End;
  SetVesa;SetGraphMode(_320x200x256);
  Load_Bmp(3,2,'c:\_______.bmp');
  for x:=0 to 212 do
    for y:= 0 to 66 do
      m[x,y]:=getpixel(x,y);
  Cleardevice;
  xx:=50;yy:=60;xxx:=1;yyy:=1;
  While not keypressed do
  Begin
    c:=c+3;if c>628 then c:=c-628;
    for x:=0 to 212 do
      for y:= 0 to 66 do
      Begin
        c1:=x*2+c+y;
        c2:=x*2+c{+y};
        if c1>628 then c1:=c1-(628*(c1 div 628));
        if c2>628 then c2:=c2-(628*(c2 div 628));
{        if m[x,y]<>0 then}
        putpixel(x+xx+cos_[c2],y+yy+sin_[c1],m[x,y]);
      End;
  End;
  Closegraph;VesaDone;
End.