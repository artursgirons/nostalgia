Program Procedures_Files;
uses dos,crt,menu;
Var a:byte; S:PathStr;ss:string;ch:char;l:integer;
const m:array[0..6] of string=
('6','Dzest rindu','Pievienot rindu','Sakartot Failu','Izvadit uz ekrana','Aizvert menu','Iziet no programmas');
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
var k,h:Byte; a,b:String;f1:file of string;
Function Compare(const a,b:string):boolean;
var j,t:byte;
Begin
  if length(a)<length(b) then t:=length(a) else t:=length(b);
  for j:=1 to t do
  Begin
    if upcase(a[j])<upcase(b[j]) then Begin Compare:=true;Exit End;
    if upcase(a[j])>upcase(b[j]) then Begin Compare:=false;Exit end;
  End;
  if Length(a)<Length(b) then compare:=true else compare:=false;
End;
Begin
  Assign(f1,s);Reset(f1);
  for k:= 1 to filesize(f1) do
    for h:= 0 to filesize(f1)-2 do
    Begin
      seek(f1,h);
      Read(f1,b);Read(f1,a);
      if compare(a,b) then Begin seek(f1,h);write(f1,a);Write(f1,b) End;
    end;
  Close(f1);
End;

Procedure Add(const s:PathStr;ss:String);
var f1:file of string;
Begin
  Assign(f1,s);Reset(f1);
  seek(f1,filesize(f1));
  Write(f1,ss);
End;

Begin
  {Textcolor(2);Textbackground(0);}
  s:='c:\text.txt';
  s:=Text_to_tip(s);
  clrscr;
  Textcolor(0);TextBackground(7);
  Gotoxy(2, 1);Write('                          Programma par Tipizetiem failiem                    ');
  Gotoxy(2,25);Write('                                ENTER lai dabutu menu                         ');
  Textcolor(7);Textbackground(0);
  Window(2,2,79,24);
  While true do
  Begin
  ch:=readkey;
  if ord(ch)=13 then Begin Cursoroff;menubar(3,3,m,a);cursoron End;
  case a of
    1:Begin Textcolor(7);gotoxy(1,23);Write('Kuru rindu dzest: ');readln(l);
            if Delete_Row(s,l) then Begin Textcolor(12);Writeln(l,'. rinda nav atrasta ');textcolor(7) End
            else Begin Textcolor(10);Writeln('Rinda veiksmigi nodzesta');textcolor(7) End;Writeln
      End;
    2:Begin Textcolor(7);Gotoxy(1,23);Write('Ievadiet Rindinu: ');Readln(ss);Add(s,ss);
            Textcolor(10);Writeln('Rinda pievienota veiksmigi');Writeln
      End;
    3:Begin Textcolor(7);gotoxy(1,23);Kartot_tip(s);Textcolor(10);Writeln('Fails veiksmigi sakartots');Writeln End;
    4:Begin Textcolor(7);gotoxy(1,23);Print_tip(s);Textcolor(10);Writeln('Fails veiksmigi izvadits');Writeln End;
    5:Begin End;
    6:Begin Halt End;
  End;
  Window(2,2,79,24);
  End;
End.