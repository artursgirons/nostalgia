Program Stringu_Sortirovka_Faila;
Var F:Array[0..1]of text;
    S1,S2,S3:string;
    n:Byte;
    t:boolean;
Function Look:boolean;
Var a:Byte;
    s11,s22:string;
Begin
  s11:=''; s22:='';
  for a:=1 to length(s1) do s11:=s11+upcase(s1[a]);
  for a:=1 to length(s2) do s22:=s22+upcase(s2[a]);
  if S11>S22 Then Look:=True else Look:=False;
End;
Begin
  Assign(f[0],'c:\File.txt');
  Assign(f[1],'c:\Temp.txt');
  n:=1;
  While True Do
  Begin
    n:=1-n; t:=true;
    Reset(f[n]); Rewrite(f[1-n]);
    Readln(f[n],s1);
    While Not Eof(f[n]) do
    Begin
      Readln(f[n],s2);
      if Look Then Begin Writeln(f[1-n],s2);Writeln(f[1-n],s1); t:=false;
                          While not eof(f[n]) do Begin Readln(f[n],s1);Writeln(f[1-n],s1) End;
                          Break;
                    End
               Else Begin S3:=S2; Writeln(f[1-n],s1) End;
      S1:=S2;
    End;
    if t then Writeln(f[1-n],s3);
    Close(f[0]); Close(f[1]);
    If (t) Then Begin Erase(f[n]); {$I-}Rename(f[1-n],'c:\file.txt'){$I+};Break End;
  End;
End.