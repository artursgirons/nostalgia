Program _3d_Formul_Test;
Uses Crt,Graph,openbmp;
var s,ss,x,y:integer;
    m:array[1..215,1..50] of byte;
{$F+} function TestDetect: Integer;begin TestDetect := 1 end; {$F-}
Begin
    initgraph(s,ss,'');
    s:=detect;draw(s,ss,1,1,'c:\_______.bmp',false);
    for s:=1 to 215 do for ss:=1 to 50 do m[s,ss]:=getpixel(s,ss);
    Closegraph;
  s:=detect;InstallUserDriver('VGA256', @TestDetect);InitGraph(ss,s,'');
    for s:=1 to 215 do for ss:=1 to 50 do putpixel(s,ss,m[s,ss]);
  readln;
  CloseGraph;
End.

