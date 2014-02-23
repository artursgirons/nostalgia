Uses graph,vesa2,crt,Bmp_Wiew;
var x,y,c:integer;
    c1:Word;
    xx,yy:byte;
    xxx,yyy:shortint;
    m:Array[0..224,0..83]of byte;
    cos_,sin_:array[0..628] of shortint;
Begin
  for x:= 0 to 628 do
  BEgin
  sin_[x]:=round(Sin(x/100)*30);
  cos_[x]:=round(cos(x/100)*30);
  End;
  SetVesa;SetGraphMode(_320x200x256);
  Load_Bmp(2,2,'c:\_______.bmp');
  for x:=0 to 224 do
    for y:= 0 to 83 do
      m[x,y]:=getpixel(x,y);
  Cleardevice;
  xx:=50;yy:=50;xxx:=1;yyy:=1;
  While not keypressed do
  Begin
    c:=c+3;if c>628 then c:=c-628;
{    xx:=xx+xxx;yy:=yy+yyy;}
    for x:=0 to 224 do
      for y:= 0 to 83 do
      Begin
        c1:=c+x*2;
        if c1>628 then c1:=c1-(628*(c1 div 628));
        putpixel(x+xx+cos_[c1],y+yy+sin_[c1],m[x,y]);
      End;
      if (xx<1)or(xx>100)then xxx:=-xxx;
      if (yy<1)or(yy>150)then yyy:=-yyy;
  End;
  Closegraph;VesaDone;
End.