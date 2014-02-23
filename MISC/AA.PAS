Program Procedures_Files;
uses dos,crt;
Var a:integer; S:PathStr;

Function Text_to_Tip(s:PathStr):PathStr;
Var Dir:DirStr; Name:NameStr; Ext:ExtStr;
    F1:text; F2,f3:file of string; ss:string;
Begin
  s:=FExpand(s); FSplit(s,dir,name,ext);
  Assign(f1,s); Reset(f1);Assign(f2,dir+name+'.T00');Rewrite(f2);Assign(f3,dir+name+'.T01');Rewrite(f3);
  While not Eof(f1) do
  Begin
    Readln(f1,ss);
    Write(f2,ss);Write(f3,ss);
  End;
  Close(f1);Close(f2);
  Text_to_Tip:=Dir+name+'.T01';
End;

Procedure Print_Tip(const s:PathStr);
Var ss:String;f1:file of string;
Begin
  Assign(f1,s);Reset(f1);
  While not eof(f1) do
  Begin
    Read(f1,ss);
    Writeln(ss);
  End;
  Close(f1);
End;

Function Delete_Row(const s:PathStr;a:integer):boolean;
Var f1:file of string;ss:string;h:integer;
Begin
  assign(f1,s);Reset(f1);
  if a>filesize(f1) then Begin delete_Row:=true;Close(f1);Exit End;
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
  delete_Row:=false;
End;

Procedure Kartot_tip(const s:PathStr);
Begin

End;
Begin
  Clrscr;
  s:='c:\text.txt';
  s:=Text_to_tip(s);
  Print_Tip(S);
  a:=6;
  if Delete_Row(s,a) Then Begin Textcolor(12);Writeln('Faila nav ',a,'. rinda.');Textcolor(7) End;
  Print_Tip(S);
End.