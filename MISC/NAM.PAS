Uses graph,vesa2,crt,Bmp_Wiew;
type t=^tt;
     tt=array[0..199,0..319] of byte;
var x,y,c:integer;
    u,c1,c2:Word;
    m:Array[0..212,0..66]of byte;
    cos_,sin_:array[0..628] of shortint;
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
  if u>254 then Begin Closegraph;VesaDone;Halt End;
End;
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
  buf:=ptr($a000, 0);u:=0;
  While true do
  Begin
    c:=c+3;if c>628 then c:=c-628;
    for x:=0 to 212 do
      for y:= 0 to 66 do
      Begin
        c1:=x*2+c+y;
        c2:=x*2+c{+y};
        if c1>628 then c1:=c1-(628*(c1 div 628));
        if c2>628 then c2:=c2-(628*(c2 div 628));
        buf^[60+y+sin_[c2],70+x+cos_[c1]]:=m[x,y];
      End;
      if (keypressed) or (u>0) then Lights_Off;
  End;
  Closegraph;VesaDone;
End.