Program Skolnieki_Prieksmeti;
Uses Crt;
Var M:Array[1..10,1..5]of Byte;
    a,b,c:Byte;
Begin
Randomize;ClrScr;
TextColor(12);Write('    ');for a:=1 to 5 do write(a:4);Write('Vid':10);
Writeln;Writeln;
For a:=1 to 10 do
Begin
  c:=0;
  Textcolor(10);Write(a:4);Textcolor(7);
  For b:=1 to 5 do
  Begin
    M[a,b]:=Random(10)+1;
    Write(M[a,b]:4);
    c:=c+M[a,b];
  End;
  Write(c/5:10:1);
  Writeln;
End;
End.

