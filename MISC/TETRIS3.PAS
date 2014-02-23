Program TETRIS;
Uses Crt,Dos;
Const F:Array[1..42,1..4,1..5] of Byte=
      (((2,5,8,9,9),(4,5,6,7,7),(1,2,5,8,8),(3,4,5,6,6)),
      ((2,5,8,7,7),(1,4,5,6,6),(2,3,5,8,8),(4,5,6,9,9)),
      ((2,4,5,6,6),(2,5,6,8,8),(4,5,6,8,8),(2,4,5,8,8)),
      ((1,2,5,6,6),(3,5,6,8,8),(1,2,5,6,6),(3,5,6,8,8)),
      ((2,3,4,5,5),(2,5,6,9,9),(2,3,4,5,5),(2,5,6,9,9)),
      ((4,5,6,6,6),(2,5,8,8,8),(4,5,6,6,6),(2,5,8,8,8)),
      ((2,5,6,6,6),(5,6,8,8,8),(4,5,8,8,8),(2,4,5,5,5)),
      ((4,5,7,8,8),(4,5,7,8,8),(4,5,7,8,8),(4,5,7,8,8)),
      ((3,5,6,7,8),(1,4,5,8,9),(2,3,4,5,7),(1,2,5,6,9)),
      ((1,2,4,5,6),(2,3,5,6,8),(4,5,6,8,9),(2,4,5,7,8)),
      ((2,5,7,8,9),(1,4,5,6,7),(1,2,3,5,8),(3,4,5,6,9)),
      ((1,2,3,4,7),(1,4,7,8,9),(3,6,7,8,9),(1,2,3,6,9)),
      ((1,3,4,5,6),(1,2,5,7,8),(4,5,6,7,9),(2,3,5,8,9)),
      ((2,4,5,6,8),(2,4,5,6,8),(2,4,5,6,8),(2,4,5,6,8)),
      ((1,2,5,6,8),(2,4,5,6,7),(2,4,5,8,9),(3,4,5,6,8)),
      ((2,3,4,5,8),(2,4,5,6,9),(2,5,6,7,8),(1,4,5,6,8)),
      ((2,3,5,7,8),(1,4,5,6,9),(2,3,5,7,8),(1,4,5,6,9)),
      ((4,5,6,7,8),(2,5,6,8,9),(2,3,4,5,6),(1,2,4,5,8)),
      ((1,2,5,8,9),(3,4,5,6,7),(1,2,5,8,9),(3,4,5,6,7)),
      ((1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9)),
      ((1,3,5,8,8),(1,5,6,7,7),(2,5,7,9,9),(3,4,5,9,9)),
      ((1,2,3,4,8),(1,4,6,7,8),(2,6,7,8,9),(2,3,4,6,9)),
      ((1,2,3,6,8),(1,2,4,6,7),(2,4,7,8,9),(3,4,6,8,9)),
      ((1,3,4,6,8),(1,2,6,7,8),(2,4,6,7,9),(2,3,4,8,9)),
      ((1,2,3,5,9),(1,3,4,5,7),(1,5,7,8,9),(3,5,6,7,9)),
      ((1,2,3,5,7),(1,4,5,7,9),(3,5,7,8,9),(1,3,5,6,9)),
      ((1,3,5,6,7),(1,2,5,7,9),(3,4,5,7,9),(1,3,5,8,9)),
      ((1,3,4,5,9),(1,3,5,7,8),(1,5,6,7,9),(2,3,5,7,9)),
      ((1,3,5,6,8),(1,2,5,6,7),(2,4,5,7,9),(3,4,5,8,9)),
      ((1,3,4,5,8),(1,5,6,7,8),(2,5,6,7,9),(2,3,4,5,9)),
      ((1,2,6,8,9),(2,3,4,6,7),(1,2,4,8,9),(3,4,6,7,8)),
      ((2,3,4,7,8),(1,4,6,8,9),(2,3,6,7,8),(1,2,4,6,9)),
      ((4,6,7,8,8),(2,6,8,9,9),(2,3,4,6,6),(1,2,4,8,8)),
      ((4,6,8,9,9),(2,3,6,8,8),(1,2,4,6,6),(2,4,7,8,8)),
      ((1,3,5,7,7),(1,5,7,9,9),(3,5,7,9,9),(1,3,5,9,9)),
      ((1,2,4,5,9),(3,4,5,7,8),(1,5,6,8,9),(2,3,5,6,7)),
      ((3,4,6,8,8),(1,2,6,8,8),(2,4,6,7,7),(2,4,8,9,9)),
      ((1,4,6,8,8),(2,6,7,8,8),(2,4,6,9,9),(2,3,4,8,8)),
      ((1,5,9,9,9),(3,5,7,7,7),(1,5,9,9,9),(3,5,7,7,7)),
      ((2,4,6,6,6),(2,4,8,8,8),(4,6,8,8,8),(2,6,8,8,8)),
      ((3,5,6,7,7),(1,2,5,9,9),(3,4,5,7,7),(1,5,8,9,9)),
      ((1,4,5,9,9),(3,5,7,8,8),(1,5,6,9,9),(2,3,5,7,7)));
      Fl:array[1..9]of shortint=(-30,-29,-28,-1,0,1,28,29,30);
      DelyK=7;
      SDely=20;
Type BasicT=Record
              Name:String[10];
              Score:Word;
              Beep,Level,Tipe,Kub,P:Byte;
              L:Integer;
              FF:Array[1..1000]of Byte;
            End;
Var Mode,Rez,N:Byte;
    A,B,Wait,Temp,D:Integer;
    T:BasicT;
Procedure Beeping;
Begin
 If T.Beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;
End;

Procedure Stop;
Var ch:char;
Begin
  Repeat If KeyPressed then ch:=ReadKey until (Ord(ch)=13)or(Ord(ch)=27);
End;


Procedure ScoreP;
Begin
  Textcolor(7);
  Gotoxy(2,1);
  Write('Score :',T.Score);
  Gotoxy(21,1);
  Write(T.Level,': Level');
End;


Procedure ResetGame;
var co:byte;
Var a:Integer;
Begin
  Gotoxy(1,1);
  For a:= 31 to 986 do Begin co:=T.FF[a];if co>15 then co:=0;Textcolor(co);Write(chr(219));End;
  ScoreP;
End;


Function ReadX(Const W:Boolean;const i:byte):String;
Var s:string;
    r:registers;
    a,u:byte;
    ch:char;
Begin
  r.ah:=01;
  r.ch:=06;
  r.cl:=07;
  intr($10,r);
  a:=0;s:='';
  TextColor(7);
  if w then u:=7 else u:=10;
  if not(w) then Begin str(i,s);s:='Save '+s;a:=length(s);Gotoxy(u,temp*2+9);Write(s) End;
  Gotoxy(u+a,temp*2+9);
  While true do
  Begin
    ch:=readkey;
    Beeping;
    if ord(ch)=13 then Break;
    if ((ord(ch)>47) and (ord(ch)<123) or (ord(ch)=32)) and(a<10) then
      Begin S:=s+ch;Gotoxy(u+a,Temp*2+9);TextColor(7);Write(ch);inc(a) End;
    If (ord(ch)=8)and(a>0) then Begin Delete(s,a,1);dec(a);Gotoxy(u+a,Temp*2+9);
      if w then Begin Textcolor(8);Write('.') End else Write(' ');Gotoxy(u+a,Temp*2+9) end;
  End;
  r.ah:=01;
  r.cx:=$2000;
  intr($10,r);
  ReadX:=S;
End;


Procedure SaveGame;
Var A,B:Word;
    F:File of BasicT;
Begin
  Clrscr;
  TextColor(10);
  Gotoxy(7,5);
  Write('S A V E   G A M E');
  Assign(F,'Save.dat');
  Reset(f);
  A:=Filesize(f);
  If a<10 then
  Begin
    TextColor(10);
    Gotoxy(8,16);Write('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
    Gotoxy(8,17);Write('³             ³');
    Gotoxy(8,18);Write('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
    TextColor(7);
    gotoxy(3,33);
    Write('Enter name for save game');
    SeeK(F,A);
    Temp:=4;
    T.Name:=ReadX(False,A);
    Write(F,T);
  End
  Else
  Begin
    Gotoxy(13,29);Write('Done');
    TextColor(2);
    Gotoxy(5,15);Write(' Unable to save game');
    Gotoxy(5,17);Write('Not Enough free slots');
    Stop;
  End;
  Close(f);
  Temp:=1;
End;

Function LoadGame:Boolean;
Var F:file of BasicT;
    M:Array[1..11] of String[10];
    A,B,c1,c2,c3:Byte;
    ch:Char;
Begin
  Clrscr;
  LoadGame:=False;
  TextColor(10);
  Gotoxy(7,5);
  Write('L O A D   G A M E');
  M[11]:='   Done';
  Gotoxy(10,29);
  Write(m[11]);
  TextColor(8);
  Assign(f,'Save.dat');
  Reset(f);
  if filesize(f)=0 then Begin TextColor(2);Gotoxy(7,16);Write('No saves aviable');Close(f);Temp:=3;Stop;Exit End;
  c1:=T.Beep;
  c2:=T.Level;
  c3:=T.Tipe;
  A:=0;
  While not Eof(f)do
  Begin
    inc(a);
    Read(f,T);
    M[a]:=T.Name;
    Gotoxy(10,(a-1)*2+9);
    Write(m[a]);
  End;
  T.Beep:=c1;
  T.Level:=c2;
  T.Tipe:=c3;
  B:=1+a;
  While True do
    If keypressed then
    Begin
      Beeping;
      Ch:=readkey;
      if ord(ch)=0 then ch:=readkey;
      Temp:=b;
      if b=1+a then B:=11;
      Gotoxy(10,(b-1)*2+9);
      TextColor(8);
      Write(m[B]);
      B:=Temp;
      Case ord(ch)of
        72:If B=1 then b:=a+1 else dec(b);
        80:If B=a+1 then b:=1 else inc(b);
        13:Begin
            if b=a+1 then Break;
            Seek(f,b-1);Read(f,T);
            If T.Tipe=1 then N:=8 else if T.Tipe=2 then N:=19 else N:=42;
            LoadGame:=True;
            ClrScr;
            ResetGame;
            Break;
           End;
        27:Begin Break End;
      End;
      Temp:=b;
      if b=1+a then B:=11;
      Gotoxy(10,(B-1)*2+9);
      TextColor(10);
      Write(m[b]);
      B:=Temp;
    End;
    Close(f);
    Temp:=3;
End;

Procedure DeleteGame;
Var F:file of BasicT;
    A,B,c1,c2,c3:Byte;
    M:Array[1..11]of string[10];
    Ch:Char;
Begin
  cLRsCR;
  TextColor(10);
  Gotoxy(4,5);
  Write(' D E L E T E   G A M E');
  Assign(f,'Save.dat');
  Reset(f);
  M[11]:='   Done';
  Gotoxy(10,29);
  Write(m[11]);
  TextColor(8);
  if filesize(f)=0 then Begin TextColor(2);Gotoxy(7,16);Write('No saves aviable');Close(f);Stop;Exit End;
  c1:=T.Beep;
  c2:=T.Level;
  c3:=T.Tipe;
  A:=0;
  While not Eof(f)do
  Begin
    inc(a);
    Read(f,T);
    M[a]:=T.Name;
    Gotoxy(10,(a-1)*2+9);
    Write(m[a]);
  End;
  T.Beep:=c1;
  T.Level:=c2;
  T.Tipe:=c3;
  B:=1+a;
  While True do
    If keypressed then
    Begin
      Beeping;
      Ch:=readkey;
      if ord(ch)=0 then ch:=readkey;
      Temp:=b;
      if b=1+a then B:=11;
      Gotoxy(10,(b-1)*2+9);
      TextColor(8);
      Write(m[B]);
      B:=Temp;
      Case ord(ch)of
        72:If B=1 then b:=a+1 else dec(b);
        80:If B=a+1 then b:=1 else inc(b);
        13:Begin
            if b=a+1 then Break;
            if a<>1 then
            Begin
             for b:=b-1 to a-2 do
             Begin
               Seek(f,b+1);
               Read(f,t);
               Seek(f,b);
               Write(f,t);
             End;
             Seek(f,a-1);
             truncate(f);
            End
            Else
            Begin
             Seek(f,0);
             Truncate(f);
            End;
            Temp:=1;
            Break;
           End;
        27:Begin Break End;
      End;
      Temp:=b;
      if b=1+a then B:=11;
      Gotoxy(10,(B-1)*2+9);
      TextColor(10);
      Write(m[b]);
      B:=Temp;
    End;
    Temp:=4;
    Close(f);
End;

Function MainMenu:Byte;
Const Menu:Array[1..7]of String[10]=('Start','Options','Load','Delete','Help','Top 10','Quit');
Var b,c:Byte;
    ch:Char;
Begin
  Clrscr;
  Gotoxy(10,5);
  TextColor(10);
  Write('T E T R I S');
  TextColor(8);
  For b:=1 to 7 do
  Begin
    Gotoxy(12,12+b*2);
    Write(Menu[b]);
  End;
  b:=Temp;
  Gotoxy(12,12+b*2);
  TextColor(10);
  Write(Menu[b]);
  While True Do
  Begin
    If Keypressed then
    Begin
      ch:=readkey;
      If ord(ch)=0 then ch:=readkey;
      Beeping;
      Gotoxy(12,12+b*2);
      Textcolor(8);
      Write(Menu[b]);
      TextColor(10);
      case ord(ch) of
        72:If b=1 then b:=7 else Dec(b);
        80:If b=7 then b:=1 else Inc(b);
        13:Begin MainMenu:=b;Exit End;
        27:Begin MainMenu:=7;Exit End;
      End;
      Gotoxy(12,12+b*2);
      Textcolor(10);
      Write(Menu[b]);
    End;
  End;
End;

Procedure Options;
Const Option:Array[1..4]of String[8]=('Level :','Type  :','Sound :','    Done');
      Coords:Array[1..4]of byte=(15,17,19,30);
      Tip:Array[1..3]of string[8]=('Basic   ','Extendet','Bizar   ');
      OnOff:Array[0..1]of string[3]=('Off','On ');
Var ch:char;
    a:Byte;
Begin
  Clrscr;
  Gotoxy(9,5);
  Textcolor(10);
  Write('O P T I O N S');
  Gotoxy(9,15);
  Write('Level :');
  Textcolor(8);
  Gotoxy(17,15);
  Write(T.Level);
  Gotoxy(9,17);
  Write('Type  : ',tip[T.Tipe]);
  Gotoxy(9,19);
  Write('Sound : ',onoff[T.Beep]);
  Gotoxy(9,30);
  Write('    Done');
  a:=1;
  While True do
  Begin
    If keypressed then
    Begin
      ch:=readkey;
      Beeping;
      if Ord(ch)=0 then ch:=readkey;
      Gotoxy(9,coords[a]);
      Textcolor(8);
      Write(Option[a]);
      Case ord(ch) of
        72:If a=1 then a:=4 else dec(a);
        80:If a=4 then a:=1 else inc(a);
        77:Begin
             If a=1 then Begin If T.Level=9 then T.Level:=1 else inc(T.Level);Gotoxy(17,coords[a]);Write(T.Level) End;
             If a=2 then Begin if T.Tipe =3 then T.Tipe:=1 else inc(T.Tipe); Gotoxy(17,coords[a]);Write(tip[T.Tipe]) End;
             If a=3 then Begin T.Beep:=1-T.Beep;Gotoxy(17,coords[a]);Write(onoff[T.Beep]); End;
           End;
        75:Begin
             If a=1 then Begin If T.Level=1 then T.Level:=9 else dec(T.Level);Gotoxy(17,coords[a]);Write(T.Level) End;
             If a=2 then Begin if T.Tipe =1 then T.Tipe:=3 else dec(T.Tipe); Gotoxy(17,coords[a]);Write(tip[T.Tipe]) End;
             If a=3 then Begin T.Beep:=1-T.Beep;Gotoxy(17,coords[a]);Write(onoff[T.Beep]) End;
           End;
        13:If a=4 then Exit;
        27:Exit;
      End;
      Gotoxy(9,coords[a]);
      Textcolor(10);
      Write(Option[a]);
    End;
  End;
End;

Procedure Help;
Begin
  Clrscr;
  Textcolor(10);
  Gotoxy(12,5);
  Write('H E L P');
  Gotoxy(1,11);
  Textcolor(7);
  WriteLn('    Move left  - Left        ');
  Writeln('    Move right - Right       ');
  Writeln('    Rotate     - Up,Space    ');
  Writeln('    Drop       - Down        ');
  Writeln('    Pause      - P           ');
  Writeln('    Main menu  - Esc         ');
  Gotoxy(13,30);
  TextColor(10);
  Writeln('Done');
  Stop;
  Beeping;
End;

Procedure Quit;
Const Qui:array[0..1]of string[3]=('Yes','No ');
var a:Byte;
    ch:char;
Begin
  Clrscr;
  Gotoxy(12,5);
  TextColor(10);
  Write('Q U I T');
  Gotoxy(13,17);
  Write('Yes');
  Textcolor(8);
  Gotoxy(13,19);
  Write('No');
  a:=0;
  While true do
  Begin
    If keypressed then
    Begin
      Beeping;
      ch:=readkey;
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(13,17+a*2);
      Textcolor(8);
      Write(Qui[a]);
      Case ord(ch) of
        72,80:a:=1-a;
        13:If a=0 then Begin TextMode(Mode);Halt End else Exit;
        27:Exit;
      End;
      Gotoxy(13,17+a*2);
      Textcolor(10);
      Write(Qui[a]);
    End;
  End;
End;

Function EscMenu:Byte;
Const Opt:Array[0..2] of String[9]=('Resume','Save game','Main Menu');
Var a:Byte;
    ch:Char;
Begin
  ClrScr;
  TextColor(10);
  Gotoxy(10,5);
  Write('T E T R I S');
  Gotoxy(11,17);
  Write(Opt[0]);
  TextColor(8);
  Gotoxy(11,19);
  Write(Opt[1]);
  Gotoxy(11,21);
  Write(Opt[2]);
  a:=0;
  While true do
    If keypressed then
    Begin
      ch:=readkey;
      Beeping;
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(11,17+a*2);
      Textcolor(8);
      Write(Opt[a]);
      Case ord(ch) of
        72:If a=0 then a:=2 else dec(a);
        80:If a=2 then a:=0 else inc(a);
        13:Begin EscMenu:=a;Exit End;
        27:Begin EscMenu:=0;Exit End;
      End;
      Gotoxy(11,17+a*2);
      Textcolor(10);
      Write(opt[a]);
    End;
End;

Procedure Screen;
Var a:Word;
    r:Registers;
Begin
 Mode:=lastmode;textmode(c80+font8X8);
 r.ah:=01;r.cx:=$2000;intr($10,r);
 Textcolor(8);for a:=1 to 3999 do Write(chr(random(3)+176));
 Textcolor(7);
 for a:= 25 to 55 do
 begin
   Gotoxy(a,8);write(chr(205));
   Gotoxy(a,43);write(chr(205));
 end;
 for a:=9 to 42 do
 begin
   Gotoxy(25,a);write(chr(186));
   Gotoxy(55,a);write(chr(186));
 end;
 Gotoxy(25,8);write(chr(201));gotoxy(55,8);write(chr(187));
 Gotoxy(25,43);write(chr(200));gotoxy(55,43);write(chr(188));
 Window(26,9,54,42);
 ClrScr;
end;

Procedure Key;
Var ch:Char;
    c:Byte;
Begin
   Wait:=Round(Exp((9-T.Level)*Ln(1.5))*DelyK);
   ch:=Readkey;
   If ord(ch)=0 then ch:=Readkey;
   Case Ord(ch) of
     27: Begin Temp:=EscMenu ;
     If Temp=0 then ResetGame else if Temp=1 then Begin SaveGame;ResetGame End else Begin Temp:=1;Rez:=1 End;End;
     72,32:
       Begin
         T.P:=T.P-1;
         If T.P<1 then T.P:=4;
         For c:=1 to 5 do
           If (T.FF[T.L+fl[f[T.Kub,T.P,c]]]>0) then
             Begin T.P:=T.P+1;If T.P>4 then T.P:=1;Break end;
       End;
     75:
       Begin
         T.L:=T.L-1;
         For c:=1 to 5 do
           If (T.FF[T.L+fl[f[T.Kub,T.P,c]]]>0) then Begin T.L:=T.L+1;Break End;
       End;
     77:
       Begin
         T.l:=T.l+1;
         For c:=1 to 5 do
           If (T.FF[T.L+fl[f[T.Kub,T.P,c]]]>0) then Begin T.L:=T.L-1;break End;
       End;
     80:Wait:=DelyK;
     Ord('p'),Ord('p'):
       Begin
         Textcolor(10);
         Gotoxy(1,1);Write('        Press any key        ');While not keypressed do begin end;
         Textcolor(7);
         Readkey;
         Gotoxy(1,1);Write('                      ');
         ScoreP;
       End;
   end;
end;

Procedure Print(const co:byte);
Var c:Byte;
Begin
  if co=1 then TextColor(T.Kub mod 15 +1) else TextColor(0);
  For c:=1 to 5 do
  Begin
    Gotoxy(((T.L-1+FL[F[T.Kub,T.P,c]])-Trunc((T.L-1+FL[F[T.Kub,T.P,c]])/29)*29),(trunc((T.l-1+FL[F[T.Kub,T.P,c]])/29)));
    Write(Chr(219));
  End;
End;

Procedure Top10;
Type Fty=Record Name:string[10];
                Score:Word;
         End;
Var F:File of Fty;
    A:Fty;
    C:Byte;
    s:string[5];
Begin
  ClrScr;
  Gotoxy(13,30);
  TextColor(8);
  Writeln('Done');
  TextColor(10);
  Gotoxy(10,5);
  Write('T O P   1 0');
  Assign(F,'Score.dat');
  Reset(F);
  C:=20;
  if Rez<20 then
  Begin
      Textcolor(7);
      Gotoxy(5,1);
      Write('Pleas enter your name');
      C:=Rez;
      for Rez:=8 Downto Rez do
      Begin
        seek(f,Rez);
        Read(f,a);
        Write(f,a);
      End;
      Seek(f,c);
      a.Score:=T.Score;
      a.Name:='';
      Write(f,a);
  End;
  Seek(f,0);
  Gotoxy(1,8);
  Textcolor(7);
  For Rez:=0 to 9 do
  Begin
    Read(f,a);
    textcolor(8);
    Gotoxy(7,Rez*2+9);
    write('..........');
    Textcolor(7);
    Gotoxy(7,Rez*2+9);
    Write(a.name);
    textcolor(8);
    Gotoxy(17,Rez*2+9);
    write('......');
    textcolor(7);
    str(a.score,s);
    gotoxy(19+(5-length(s)),Rez*2+9);
    write(a.score);
  End;
  If c<>20 then
  Begin
    Temp:=c;
    A.name:=ReadX(True,0);
    a.score:=T.Score;
    seek(f,c);
    Write(f,a);
  end;
  Close(f);
  Gotoxy(13,30);
  TextColor(10);
  Writeln('Done');
  Stop;
End;

Function Top10Score:boolean;
Type Fty=Record Name:string[10];
                Score:Word;
         End;
Var f:File of fty;
    a:fty;
Begin
  Assign(f,'Score.dat');
  Reset(f);
  Rez:=20;
  Top10Score:=false;
  for Rez:=0 to 9 do
  Begin
    read(f,a);
    if T.Score>=a.Score then Begin Top10Score:=true;Break End;
  End;
  Close(F);
end;

Procedure Check;
Type Fty=Record Name:string[10];
                Score:Word;End;
Var F1:file of Fty;
    A:Fty;
    F2:file of BasicT;
    B:byte;
Begin
 Assign(f1,'Score.dat');
 {$I-}Reset(f1){$I+};
 if ioresult<>0 then
 Begin
  Rewrite(f1);
  A.Name:='';
  A.Score:=0;
  for b:=1 to 10 do Write(f1,a);
 End;
 Close(F1);
 Assign(f2,'Save.dat');
 {$I-}Reset(f2){$I+};
 if ioresult<>0 then Rewrite(f2);
 Close(F2);
End;

Begin
 Check;
 Randomize;
 T.Level:=1;
 T.Tipe:= 1;
 T.Beep:= 1;
 Temp:= 1;
 T.Score:=0;
 Screen;
 While True do
 Begin
  While true do
  Begin
   Temp:=MainMenu;
   Case Temp of
    1:Begin
       For Temp:=1 to 1000 Do T.FF[Temp]:=0;
       For Temp:=0 to 34 Do Begin T.FF[Temp*29+1]:=17;T.FF[Temp*29+2]:=17 End;
       If T.Tipe=1 then N:=8 else if T.Tipe=2 then N:=19 else N:=42;
       T.Kub:=Random(N)+1;
       Wait:=Round(Exp((9-T.Level)*Ln(1.5))*DelyK);
       D:=T.Level;
       Rez:=0;
       T.Score:=0;
       T.P:=1;
       T.L:=74;
       ClrScr;
       ScoreP;
       Break;
      End;
    2:Options;
    3:if LoadGame Then Begin rez:=0;Wait:=Round(Exp((9-T.Level)*Ln(1.5))*DelyK);Break End;
    4:DeleteGame;
    5:Help;
    6:Begin Rez:=20;T.Score:=0; Top10 End;
    7:Quit;
   End;
  End;

While True do
Begin
  If (T.FF[130]>0)or(T.FF[131]>0)or(T.FF[132]>0)or(T.FF[133]>0)or(T.FF[134]>0) then
  Begin Clrscr; Gotoxy(7,17);TextColor(10);Write('G A M E   O V E R');Stop;Break End;
  Print(0);
  T.L:=T.L+29;
  If Keypressed then Begin Key;If Rez=1 then Break;Print(0) End;
  Print(1);
  For A:=0 to 150 do
  Begin
    If keypressed then begin Print(0);Key;if Rez=1 then Break;Print(1) end;
    Delay(Wait);
  End;
  If Rez>0 then Begin Temp:=1;Break;End;
     if keypressed then begin print(0);key;if rez=1 then break;print(1) end;
          if (T.FF[T.l+fl[f[T.Kub,T.P,1]]+29]>0) or (T.l+fl[f[T.Kub,T.P,1]]+29>986) or
             (T.FF[T.l+fl[f[T.Kub,T.P,2]]+29]>0) or (T.l+fl[f[T.Kub,T.P,2]]+29>986) or
             (T.FF[T.l+fl[f[T.Kub,T.P,3]]+29]>0) or (T.l+fl[f[T.Kub,T.P,3]]+29>986) or
             (T.FF[T.l+fl[f[T.Kub,T.P,4]]+29]>0) or (T.l+fl[f[T.Kub,T.P,4]]+29>986) or
             (T.FF[T.l+fl[f[T.Kub,T.P,5]]+29]>0) or (T.l+fl[f[T.Kub,T.P,5]]+29>986) then
          begin
               T.Score:=T.Score+T.Tipe;
               If T.Beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
               for A:=1 to 5 do T.FF[T.l+fl[f[T.Kub,T.P,A]]]:=T.Kub mod 15 +1;
               for a:=-1 to 1 do
               begin
                   Temp:=0;
                   for b:=2 to 28 do
                   Begin
                       If T.FF[trunc(T.l/29+a)*29+b+1]>0 then Temp:=Temp+1;
                   End;
                   If Temp>26 then
                   Begin
                        T.Score:=T.Score+5+T.Level+T.Tipe*2;
                        ScoreP;
                        Gotoxy(1,trunc(T.l/29)+a);
                        Delline;
                        Gotoxy(1,2);
                        Insline;
                        If T.Beep=1 then Begin Sound(2000);Delay(SDely*2);Nosound End;{Crazzy Beeping}
                        Delay(20000);
                        For b:= trunc(T.l/29+1+a)*29 downto 30 do
                          Begin T.FF[b]:=T.FF[b-29] End;
                        delay(Wait);
                   End;
               End;
               T.Kub:=random(N)+1;
               Wait:=Round(Exp((9-T.Level)*Ln(1.5))*DelyK);
               T.P:=1;
               T.L:=74;
               If T.Score>=T.Level*100 then If T.Level<9 then Inc(T.Level);
               ScoreP;
          End;
end;
if (rez<2)and Top10Score then Top10;
Temp:=1;
T.Level:=D;
End;
End.