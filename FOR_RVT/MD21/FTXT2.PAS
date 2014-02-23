program files_vid_aritm;
Var f1,f2:text;
    s:string;
    a:integer;
Begin
 Assign(f1,'c:\Rindas.txt');
 Assign(f2,'c:\Rindasa.txt');
 Reset(f1);
 Rewrite(f2);
 While not eof(f1)do
 Begin
  inc(a);
  Readln(f1,s);
  Writeln(f2,a,'. ',s);
  Writeln(a,'. ',s);
 End;
 Close(f1);
 Close(f2);
 erase(f1);
 rename(f2,'c:\rindas.txt');
End.