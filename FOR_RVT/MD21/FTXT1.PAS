program files_vid_aritm;
Var f:text;
    a,b,c:integer;
Begin
 assign(f,'c:\Skaitli.txt');
 reset(f);
 While not eof(f) do
 Begin
  b:=1-b;
  Read(f,a);
  if b=1 then write(a:4,'³') else Writeln(a:4);
 End;
 close(f);
 Readln;
End.