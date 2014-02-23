Program _3d_Formul_Test;
Uses Crt,Graph;
Const F:Array[1..8,1..3]of Shortint=((-10,0,0),(0,-15,0),(20,0,0),(0,25,0));
Var Xan,Yan,Zan:Real;
    X,Y,A:Integer;
{$F+} function TestDetect: Integer;begin TestDetect := 1 end; {$F-}
Begin
  InstallUserDriver('VGA256', @TestDetect);
  InitGraph(X,Y,'');
    Xan:=0;
    Yan:=0;
    Zan:=0;
  While not keypressed do
  Begin
  Delay(1000);
  For a:=1 to 8 do
  Begin
    x:=Round(F[a,1]*cos(Zan)*cos(Yan)+F[a,2]*sin(zan)+F[a,3]*sin(Yan));
    y:=Round(-F[a,2]*cos(Zan)*cos(xan)+F[a,1]*sin(zan)+F[a,3]*sin(Xan));
    Putpixel(x+100,y+100,10);
  End;
  End;
  ReadLn;
  CloseGraph;
End.
