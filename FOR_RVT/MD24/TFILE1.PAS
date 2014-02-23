Program tip_file_1;
var a,b,c,d,e:Integer;
    F1:File of Integer;
    F2:Text;
    s:string;
Begin
  Assign(f1,'c:\a.rrr');Rewrite(f1);
  Assign(f2,'c:\b.txt');Rewrite(f2);
  for a:=1 to 20 do Begin b:=random(65530)-32765; write(f1,b) End;
  for a:=1 to 20 do
    for b:= 0 to 18 do
    Begin
      seek(f1,b);read(f1,d);read(f1,e);
      if d>e then Begin Seek(f1,b); Write(f1,e); Write(f1,d) End;
    End;
  Seek(f1,0);
  for a:=1 to 5 do Begin Read(f1,b); str(b,s); Write(f2,s+' ') End;
  Seek(f1,14);Writeln(f2);
  for a:=1 to 5 do Begin Read(f1,b); str(b,s); Write(f2,s+' ') End;
  Close(f1);Close(f2);
End.