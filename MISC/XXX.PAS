Program _3d_Formul_Test;
Uses Crt,Graph;
Var  F:Array[1..170,1..3]of Shortint;
 Xan,Yan,Zan:Real;
    X,Y,Z,A:integer;
    ss,s:integer;
{$F+} function TestDetect: Integer;begin TestDetect := 1 end; {$F-}
Begin
for a:=1 to 170 do
Begin
  f[a,1]:=Round(Sin(a/5)*30);
  f[a,2]:=-90+a;
  f[a,3]:=Round(cos(a/5)*30);
End;
  InstallUserDriver('VGA256', @TestDetect);
  InitGraph(ss,s,'');
    Xan:=0;
    Yan:=0;
    Zan:=0;
  Setcolor(10);
  While not keypressed do
  Begin
    Yan:=Yan+0.05;
    Xan:=Xan+0.05;
    Zan:=Zan+0.05;
    a:=1;
X := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * COS(Zan) - (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * SIN(Zan));
Y := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * SIN(Zan) + (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * COS(Zan));
    moveto(x+155,y+100);
  For a:=1 to 170 do
  Begin
X := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * COS(Zan) - (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * SIN(Zan));
Y := Round((F[a,1] * COS(Yan) - (F[a,2] * SIN(Xan) + F[a,3] * COS(Xan)) * SIN(Xan)) * SIN(Zan) + (F[a,2] * COS(Xan)
- F[a,3] * SIN(Xan)) * COS(Zan));
   lineto(x+155,y+100);
  End;
  Delay(1000);
  Cleardevice;
  End;
  ReadLn;
  CloseGraph;
End.

