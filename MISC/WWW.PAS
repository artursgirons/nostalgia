Procedure Top10;

  Function ReadX:String;
  var s:string;
  Begin
    readln(s);
    Readx:=s;
  End;

Type Fty=Record Name:Integer;
                Score:Word;
         End;
Var F:File of Fty;
    A:Fty;
    B,C:Byte;
Begin
  TextColor(10);
  Gotoxy(10,5);
  Write('T O P   1 0');
  Assign(F,'Score.dat');
  Reset(F);
  C:=10;
  For b:=0 to 9 do
  Begin
    If Score >= A.Score then
    Begin
      C:=B;
      for b:=8 Downto b do
      Begin
        seek(f,b);
        Read(f,a);
        Write(f,a);
      End;
      Seek(f,c);
      a.Score:=Score;
      a.Name:='          ';
      Write(f,a);
      Break
    End;
  End;
  Seek(f,0);
  For b:=0 to 9 do Begin Read(f,a);Writeln(a.name,'   ',a.score); End;
  If c<10 then
  Begin
    A.name:=ReadX;
    a,score:=Score;
    seek(f,c);
    Write(f,a);
  end;
  Close(f);
End;
