Program Procedure_for_my_test;
uses crt;
Var Data:Array[1..13]of Record
                         d:Array[1..6] of char;
                         s:String;
                        End;
    Question,p:string;
    Result:Array[1..6] of Integer;
    a,b,Sk,g1,g2,g3:shortint;
    i,code:integer;
    F:text;
    Ch:Char;
Function MenuBar:byte;
Var Size,Num,od:Byte;
Begin
  size:=0;if odd(sk) then od:=0 else od:=1;
  TextBackGround(1);
  For i:=1 To Sk do If (Length(Data[i].s)>Size) and(Length(Data[i].s)<75) Then Size:=Length(Data[i].s)+1;
  If Length(Question)>Size Then Size:=Length(Question);
  Window((80-Size-4) div 2,(24-sk-1) div 2,(80-Size-4) div 2+size+4,(24-sk-2) div 2+sk+2-od);
  TextBackGround(1);ClrScr;Textcolor(15);
  if g1=0 then
  Begin
  Window((80-Size-4) div 2,(24-sk-1) div 2,(80-Size-4) div 2+size+4+1,(24-sk-2) div 2+sk+2-od+2);
  gotoxy(2,Sk+3);
  Textcolor(1);TextBackGround(0);
  For i:=1 to Size+5 do Write(Chr(176));
  for i:=1 to Sk+2 do Begin Gotoxy(Size+6,i+1);Write(chr(176)) End;
  TextBackGround(1);Textcolor(15);
  gotoxy(Size+4,Sk+2);write('ผ');gotoxy(2,1);write('ษ');gotoxy(Size+4,1);write('ป');gotoxy(2,Sk+2);write('ศ');
  For i:=3 To Size+3 Do Begin Gotoxy(i,1);Write('อ');Gotoxy(i,Sk+2);Write('อ') End;
  For i:=2 To Sk+1 Do Begin Gotoxy(2,i);Write('บ');Gotoxy(Size+4,i);Write('บ') End;
  Gotoxy((size+8-length(question)) div 2 ,1);Write(Question);
  End;
  if g2=0 then For i:=1 to Sk Do Begin Gotoxy(4,i+1);Write(Data[i].s);End;
  if g3=0 then
  Begin
  Num:=1;TextBackGround(7);TextColor(0);
  Gotoxy(4,2);Write(Data[1].s,'':(size-1-Length(Data[1].s)));
  While True Do
  Begin
    Ch:=readkey;if ord(Ch)=0 then
    Begin
      Ch:=ReadKey;
      TextBackGround(1);TextColor(15);
      Gotoxy(4,Num+1);Write(Data[Num].s,'':(size-1-Length(Data[Num].s)));
    End;
    Case Ord(Ch) of
      72:Begin Num:=Num-1; if Num<1 then Num:=1 end;
      80:Begin Num:=Num+1; if Num>Sk then Num:=Sk end;
      13:Break;
      27:Begin Window(1,1,80,25);TextColor(7);TextBackGround(0);ClrScr;Halt End;
    End;
    TextBackGround(7);TextColor(0);
    Gotoxy(4,Num+1);Write(Data[Num].s,'':(size-1-Length(Data[Num].s)));
  End;
  Window((80-Size-4) div 2,(24-sk-1) div 2,(80-Size-4) div 2+size+4+1,(24-sk-2) div 2+sk+2-od+2);
  Gotoxy(1,1);Textcolor(1);textbackground(7);
  For i:=1 to (Size+5)*(Sk+4) Do Write(Chr(176));
  MenuBar:=Num;
  End;
End;

Begin
Asm mov ah,$01;mov cx,$2000;int $10;End;
ClrScr;
Textcolor(1);
textbackground(7);
for i:=1 to 2000 do write(Chr(176));
for i:=1 to 79 do write(' ');
Sk:=2;
Question:=' Pleas chose language ';
Data[1].s:='Latvian';
Data[2].s:='Rusian';
if MenuBar=1 then Assign(F,'Lat.dat') else Assign(F,'Rus.dat');
Reset(F);
Question:='';
Readln(F,p);
Question:='Esc - '+p+'     ';
Readln(F,p);
Question:=Question+Chr(24)+', '+Chr(25)+', Enter - '+p;
Window(1,1,80,25);
Textcolor(0);Textbackground(7);
Gotoxy(17,25);Write(Question);
For a:=1 to 15 Do
Begin
  Readln(F,Question);
  Readln(F,p);Val(p,Sk,code);
  For b:=1 to Sk Do
  Begin
    Read(F,Data[b].d[1],Data[b].d[2],Data[b].d[3],Data[b].d[4],Data[b].d[5],Data[b].d[6]);
    Readln(F,Data[b].s);
  End;
  Sk:=MenuBar;
  For b:=1 to 6 do
  Begin
    Val(Data[Sk].d[b],i,code);
    If i>5 then i:=5-i;
    Result[b]:=Result[b]+i;
  End;
End;
a:=0;b:=0;
For i:=1 to 6 do If Result[i]>a then a:=Result[i];
For i:=1 to 6 Do Result[i]:=round(Result[i]/a*100);
For i:=1 to 6 do If Result[i]=100 then
Begin
  Inc(b);
  Readln(F,Data[b].s);
  if Length(Data[b].s)>72 then begin inc(b);Data[b].s:='' End;
End else Readln(F);
inc(b);
Data[b].s:='';
inc(b);
Data[b].s:='';
For i:=1 to 6 do
Begin
  Inc(b);
  Readln(F,Data[b].s);
  Str(Result[i],p);
  for a:=1 to 15-length(Data[b].s) do p:=' '+p;
  Data[b].s:=Data[b].s+p+'%';
End;
inc(b);
Data[b].s:='';
g1:=0;g2:=1;g3:=1;
Question:='ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ';
Sk:=b+2;
MenuBar;
g1:=1;g2:=0;g3:=1;
Question:='อออออออออออออออออออออออออออ         อออออออออออออออออออออออออออออออออ';
Sk:=b;
MenuBar;
While ord(ch)<>27 do Ch:=readkey;
Close(F);
Window(1,1,80,25);TextColor(7);TextBackGround(0);ClrScr;
End.
