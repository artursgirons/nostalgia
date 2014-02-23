Program _3d_Formul_Test;
Uses Crt,Graph;
Var  F:Array[1..170,1..3]of integer;
 Xan,Yan,Zan:Real;
    X,Y,Z,A,co,l:integer;
    ss,s:integer;
{$F+} function TestDetect: Integer;begin TestDetect := 1 end; {$F-}
Begin
  for a:=1 to 170 do
  Begin
    f[a,1]:=Round(Sin(a/5)*30)-15;
    f[a,3]:=Round(cos(a/5)*30-15);
  End;
  InstallUserDriver('VGA256', @TestDetect);InitGraph(ss,s,'');
  for a:=0 to 63 do setrgbpalette(a,a,a,0);
  Xan:=0;Yan:=0;Zan:=0;ss:=1;s:=10;l:=1;co:=30;
  While not keypressed do
  Begin
  Cleardevice;
   Yan:=Yan+0.05;
   Xan:=Xan+0.05;
   Zan:=Zan+0.05;
    a:=1;
X := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * COS(Zan) - (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * SIN(Zan));
Y := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * SIN(Zan) + (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * COS(Zan));
    moveto(x+180,y+100);
  s:=s+ss;
  if s>100 then ss:=-2;
  if s<10 then ss:=2;
  co:=co+l;
  if co>62 then l:=-1;
  if co<21 then l:=1;
  Setcolor(co);
  For a:=1 to 170 do
  Begin
X := Round((F[a,1]*COS(Yan)-(F[a,2]*SIN(Xan)+F[a,3]*COS(Xan))*SIN(Xan))*COS(Zan)-(F[a,2]*COS(Xan)-F[a,3]*SIN(Xan))*SIN(Zan));
Y := Round((F[a,1]*COS(Yan)-(F[a,2]*SIN(Xan)+F[a,3]*COS(Xan))*SIN(Xan))*SIN(Zan)+(F[a,2]*COS(Xan)-F[a,3]*SIN(Xan))*COS(Zan));
   lineto(x+180,y+100);
  f[a,2]:=round(-87*(20/s)+a*(20/s));
  End;
  Delay(1000);
  End;
  l:=co;
  while l<>0 do
  Begin
    dec(l);
    Setrgbpalette(co,l,l,0);
    Delay(500);
  End;
  CloseGraph;
End.

