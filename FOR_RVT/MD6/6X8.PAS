Program Skolnieki_Prieksmeti;
Uses Crt;
Var M:Array[1..6,1..8]of integer;
    a,b:Byte;
    c:integer;
Begin
Randomize;ClrScr;
TextColor(12);Write('    ');for a:=1 to 8 do write(a:7);Write('Max':11);
Writeln;Writeln;
For a:=1 to 6 do
Begin
  c:=-256*128;Textcolor(10);Write(a:4,'  ');Textcolor(7);
  For b:=1 to 8 do
  Begin
    M[a,b]:=Random(256*256-1)-256*128;
    Write(M[a,b]:7);
    If c<M[a,b] then c:=M[a,b];
  End;
  TExtColor(15);Write(c:10);
  Writeln;
End;
End.

