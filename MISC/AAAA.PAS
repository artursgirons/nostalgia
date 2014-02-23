Program Procedures_Files;
uses dos;
Var a,b,c:integer;
    S:PathStr;
    ss:String;
    f3:file of string;

Function Text_to_Tip(s:PathStr):PathStr;
Var Dir:DirStr; Name:NameStr; Ext:ExtStr;
    F1:text; F2:file of string; ss:string;
Begin
  s:=FExpand(s); FSplit(s,dir,name,ext);
  Assign(f1,s); Reset(f1);Assign(f2,dir+name+'.000');Rewrite(f2);
  While not Eof(f1) do
  Begin
    Readln(f1,ss);
    Write(f2,ss);
  End;
  Close(f1);Close(f2);
  Text_to_Tip:=Dir+name+'.000'+ss;
End;

Procedure Print_Tip(const s:PathStr);
Var ss:String;f1:file of string;
Begin
  Assign(f1,s);Reset(f1);
  While not eof(f3) do
  Begin
    Read(f1,ss);
    Writeln(ss);
  End;
  Close(f1);
End;

Procedure Delete_Row(const s:PathStr;a:integer);
Var f1:file of string;ss:string;
Begin
  assign(f1,s);
  Seek(f1,a);
  While not eof(f1) do
  Begin
    Read(f1,ss);
    Seek(f1,a-1);Write(f1,ss);
    inc(a);Seek(f1,a);
  End;
  Seek(f1,Filesize(f1)-1);
  Truncate(f1);
  Close(f1);
End;

Begin
  s:='c:\text.txt';
  Text_to_Tip(s);
  s:=Text_to_tip(s);
  Print_Tip(S);
End.