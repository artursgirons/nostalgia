Uses graph,vesa2,crt,Bmp_Wiew;
type t=^tt;
     tt=array[0..199,0..319] of byte;
var xx,yy,x,y,c:integer;
    u,c1,c2:Word;
    m:Array[0..64,0..64]of byte;
    cos_,sin_:array[0..628] of real;
    buf:t;
Procedure Lights_Off;
var co,r,g,b:Byte;
Begin
  inc(u);
  for co:=1 to 80 do
  Begin
    getRGBColor(co,r,g,b);
    if r>0 then dec(r);
    if g>0 then dec(g);
    if b>0 then dec(B);
    setRGBColor(co,r,g,b);
  End;
  if u>80 then Begin Closegraph;VesaDone;Halt End;
End;
Begin
  for x:= 0 to 628 do
  BEgin
  sin_[x]:=(Sin(x/100));
  cos_[x]:=(cos(x/100));
  End;
  SetVesa;SetGraphMode(_320x200x256);
  Load_Bmp(1,1,'c:\aaa2.bmp');
  for x:=1 to 64 do
    for y:= 1 to 64 do
      m[x,y]:=getpixel(x,y);
  Cleardevice;
  buf:=ptr($a000, 0);u:=0;c1:=628;
  While true do
  Begin
    c:=c+3 ;if c>628 then c:=c-628;
    c1:=c1-1;if c1<1 then c1:=627+c1;
    xx:=random(0);
    yy:=random(0);
    for x:=1 to 64 do
      for y:= 1 to 64 do
      Begin
         if m[x,y]<>255 then buf^[xx+Round(50*sin_[c1]*cos_[c1])+100+Round((y-32)*cos_[c]-(x-32)*sin_[c]),
                                  xx+Round(cos_[c1]*100)+160+round((x-32)*cos_[c]+(y-32)*sin_[c])]:=m[x,y];
      End;
      if (keypressed) or (u>0) then halt;
      delay(100);
  End;
  Closegraph;VesaDone;
End.