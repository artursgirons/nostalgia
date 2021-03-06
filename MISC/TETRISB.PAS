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
      DelyK=20;
      SDely=20;
Var Beep,Level,Tipe,Mode,Kub,Co,Rez,N,P:Byte;
    Score:Word;
    A,B,L,Wait,Temp:Integer;
    FF:Array[1..1000]of Byte;

Procedure Stop;
Var ch:char;
Begin
  Repeat If KeyPressed then ch:=ReadKey until (Ord(ch)=13)or(Ord(ch)=27);
End;

Function MainMenu:Byte;
Const Menu:Array[1..5]of String[10]=('Start','Options','Help','Top 10','Quit');
Var b,c:Byte;
    ch:Char;
Begin
  Clrscr;
  Gotoxy(10,5);
  TextColor(10);
  Write('T E T R I S');
  TextColor(8);
  For b:=1 to 5 do
  Begin
    Gotoxy(12,13+b*2);
    Write(Menu[b]);
  End;
  b:=Temp;
  Gotoxy(12,13+b*2);
  TextColor(10);
  Write(Menu[b]);
  While True Do
  Begin
    If Keypressed then
    Begin
      ch:=readkey;
      If ord(ch)=0 then ch:=readkey;
      If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
      Gotoxy(12,13+b*2);
      Textcolor(8);
      Write(Menu[b]);
      TextColor(10);
      case ord(ch) of
        72:If b=1 then b:=5 else Dec(b);
        80:If b=5 then b:=1 else Inc(b);
        13:Begin MainMenu:=b;Exit End;
        27:Begin MainMenu:=5;Exit End;
      End;
      Gotoxy(12,13+b*2);
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
  Write(level);
  Gotoxy(9,17);
  Write('Type  : ',tip[tipe]);
  Gotoxy(9,19);
  Write('Sound : ',onoff[beep]);
  Gotoxy(9,30);
  Write('    Done');
  a:=1;
  While True do
  Begin
    If keypressed then
    Begin
      ch:=readkey;
      If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
      if Ord(ch)=0 then ch:=readkey;
      Gotoxy(9,coords[a]);
      Textcolor(8);
      Write(Option[a]);
      Case ord(ch) of
        72:If a=1 then a:=4 else dec(a);
        80:If a=4 then a:=1 else inc(a);
        77:Begin
             If a=1 then Begin If level=9 then level:=1 else inc(level);Gotoxy(17,coords[a]);Write(level) End;
             If a=2 then Begin if tipe =3 then tipe:=1 else inc(tipe); Gotoxy(17,coords[a]);Write(tip[tipe]) End;
             If a=3 then Begin beep:=1-beep;Gotoxy(17,coords[a]);Write(onoff[beep]); End;
           End;
        75:Begin
             If a=1 then Begin If level=1 then level:=9 else dec(level);Gotoxy(17,coords[a]);Write(level) End;
             If a=2 then Begin if tipe =1 then tipe:=3 else dec(tipe); Gotoxy(17,coords[a]);Write(tip[tipe]) End;
             If a=3 then Begin beep:=1-beep;Gotoxy(17,coords[a]);Write(onoff[beep]) End;
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
  If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
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
      ch:=readkey;
      If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(13,17+a*2);
      Textcolor(8);
      Write(Qui[a]);
      Case ord(ch) of
        72,80:a:=1-a;
        13:If a=0 then Begin TextMode(LastMode);Halt End else Exit;
        27:Exit;
      End;
      Gotoxy(13,17+a*2);
      Textcolor(10);
      Write(Qui[a]);
    End;
  End;
End;

Function EscMenu:Byte;
Const Opt:Array[0..1] of String[9]=('Resume','Main Menu');
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
  a:=0;
  While true do
    If keypressed then
    Begin
      ch:=readkey;
      If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(11,17+a*2);
      Textcolor(8);
      Write(Opt[a]);
      Case ord(ch) of
        72,80:a:=1-a;
        13:Begin EscMenu:=1-a;Exit End;
        27:Begin EscMenu:=1;Exit End;
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

Procedure ScoreP;
Begin
  Textcolor(7);
  Gotoxy(2,1);
  Write('Score :',Score);
  Gotoxy(21,1);
  Write(Level,': Level');
End;

Procedure ResetGame;
var co:byte;
Var a:Integer;
Begin
  Gotoxy(1,1);
  For a:= 31 to 986 do Begin co:=ff[a];if co>15 then co:=0;Textcolor(co);Write(chr(219));End;
  ScoreP;
End;

Procedure Key;
Var ch:Char;
    c:Byte;
Begin
   Wait:=(10-Level)*DelyK;
   ch:=Readkey;
   If ord(ch)=0 then ch:=Readkey;
   Case Ord(ch) of
     27:If EscMenu=1 then ResetGame else Begin Temp:=1;Rez:=1;End;
     72,32:
       Begin
         P:=P-1;
         If P<1 then P:=4;
         For c:=1 to 5 do
           If (Ff[L+fl[f[Kub,P,c]]]>0) then
             Begin P:=P+1;If P>4 then P:=1;Break end;
       End;
     75:
       Begin
         L:=L-1;
         For c:=1 to 5 do
           If (Ff[L+fl[f[Kub,P,c]]]>0) then Begin L:=L+1;Break End;
       End;
     77:
       Begin
         l:=l+1;
         For c:=1 to 5 do
           If (Ff[L+fl[f[Kub,P,c]]]>0) then Begin L:=L-1;break End;
       End;
     80:Wait:=Wait div 16;
     Ord('p'),Ord('p'):
       Begin
         Textcolor(10);
         Gotoxy(1,1);Write('        Press any key        ');While not keypressed do begin end;
         Textcolor(7);
         Readkey;Gotoxy(1,1);Write('Score :                      ');{ScoreP(Score);}
       End;
   end;
end;

Procedure Print(const co:byte);
Var c:Byte;
Begin
  TextColor(co);
  For c:=1 to 5 do
  Begin
    Gotoxy(((L-1+FL[F[Kub,P,c]])-Trunc((L-1+FL[F[Kub,P,c]])/29)*29),(trunc((l-1+FL[F[Kub,P,c]])/29)));
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
  Function ReadX:String;
  Var s:string;
      r:registers;
      a:byte;
      ch:char;
  Begin
    r.ah:=01;
    r.ch:=06;
    r.cl:=07;
    intr($10,r);
    a:=0;s:='';
    Gotoxy(7,c*2+9);
    While true do
    Begin
      ch:=readkey;
      if ord(ch)=13 then Break;
      if ((ord(ch)>47) and (ord(ch)<123) or (ord(ch)=32)) and(a<10) then
        Begin S:=s+ch;Gotoxy(7+a,c*2+9);TextColor(7);Write(ch);inc(a) End;
      If (ord(ch)=8)and(a>0) then Begin Delete(s,a,1);dec(a);Textcolor(8);Gotoxy(7+a,c*2+9);Write('.');Gotoxy(7+a,c*2+9) end;
    End;
    r.ah:=01;
    r.cx:=$2000;
    intr($10,r);
    ReadX:=S;
  End;
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
  if Co<20 then
  Begin
      Textcolor(7);
      Gotoxy(5,1);
      Write('Pleas enter your name');
      C:=Co;
      for Co:=8 Downto Co do
      Begin
        seek(f,Co);
        Read(f,a);
        Write(f,a);
      End;
      Seek(f,c);
      a.Score:=Score;
      a.Name:='';
      Write(f,a);
  End;
  Seek(f,0);
  Gotoxy(1,8);
  Textcolor(7);
  For Co:=0 to 9 do
  Begin
    Read(f,a);
    textcolor(8);
    Gotoxy(7,Co*2+9);
    write('..........');
    Textcolor(7);
    Gotoxy(7,Co*2+9);
    Write(a.name);
    textcolor(8);
    Gotoxy(17,Co*2+9);
    write('......');
    textcolor(7);
    str(a.score,s);
    gotoxy(19+(5-length(s)),Co*2+9);
    write(a.score);
  End;
  If c<>20 then
  Begin
    A.name:=ReadX;
    a.score:=Score;
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
  Co:=20;
  Top10Score:=false;
  for co:=0 to 9 do
  Begin
    read(f,a);
    if score>=a.Score then Begin Top10Score:=true;Break End;
  End;
  Close(F);
end;

Begin
 Randomize;
 Level:=1;
 Tipe:= 1;
 Beep:= 1;
 Temp:= 1;
 Score:=0;
 Screen;
 While True do
 Begin
  While true do
  Begin
   Temp:=MainMenu;Co:=20;
   Case Temp of
    1:Begin
       For Temp:=1 to 1000 Do FF[Temp]:=0;
       For Temp:=0 to 34 Do Begin FF[Temp*29+1]:=17;FF[Temp*29+2]:=17 End;
       If Tipe=1 then N:=8 else if Tipe=2 then N:=19 else N:=42;
       Kub:=Random(N)+1;Co:=Kub mod 15 + 1;
       Wait:=(10-Level)*delyK;
       Rez:=0;
       Score:=0;
       P:=1;
       L:=74;
       ClrScr;
       ScoreP;
       Break;
      End;
    2:Options;
    3:Help;
    4:Begin Score:=0; Top10 End;
    5:Quit;
   End;
  End;

While True do
Begin
  If (FF[130]>0)or(FF[131]>0)or(FF[132]>0)or(FF[133]>0)or(FF[134]>0) then
  Begin Clrscr; Gotoxy(7,17);TextColor(10);Write('G A M E   O V E R');Stop;Break End;
  Print(0);
  L:=L+29;
  If Keypressed then Begin Key;If Rez=1 then Break;Print(0) End;
  Print(co);
  For A:=0 to 150 do
  Begin
    If keypressed then begin Print(0);Key;if Rez=1 then Break;Print(co) end;
    Delay(Wait);
  End;
  If Rez=1 then Begin Temp:=1;Break;End;
     if keypressed then begin print(0);key;if rez=1 then break;print(co) end;
          if (Ff[l+fl[f[Kub,P,1]]+29]>0) or (l+fl[f[Kub,P,1]]+29>986) or
             (Ff[l+fl[f[Kub,P,2]]+29]>0) or (l+fl[f[Kub,P,2]]+29>986) or
             (Ff[l+fl[f[Kub,P,3]]+29]>0) or (l+fl[f[Kub,P,3]]+29>986) or
             (Ff[l+fl[f[Kub,P,4]]+29]>0) or (l+fl[f[Kub,P,4]]+29>986) or
             (Ff[l+fl[f[Kub,P,5]]+29]>0) or (l+fl[f[Kub,P,5]]+29>986) then
          begin
               Score:=Score+Tipe;
               ScoreP;
               If beep=1 then Begin Sound(2000);Delay(SDely);Nosound End;{Crazzy Beeping}
               for A:=1 to 5 do Ff[l+fl[f[Kub,P,A]]]:=Co;
               for a:=-1 to 1 do
               begin
                   Temp:=0;
                   for b:=2 to 28 do
                   Begin
                       If Ff[trunc(l/29+a)*29+b+1]>0 then Temp:=Temp+1;
                   End;
                   If Temp>26 then
                   Begin
                        Score:=Score+5+Level+Tipe*2;
                        ScoreP;
                        Gotoxy(1,trunc(l/29)+a);
                        Delline;
                        Gotoxy(1,2);
                        Insline;
                        If beep=1 then Begin Sound(2000);Delay(SDely*2);Nosound End;{Crazzy Beeping}
                        Delay(20000);
                        For b:= trunc(l/29+1+a)*29 downto 30 do
                          Begin Ff[b]:=Ff[b-29] End;
                        delay(Wait);
                   End;
               End;
               Kub:=random(N)+1;
               Co:=Kub mod 15+1;
               Wait:=(10-Level)*DelyK;
               P:=1;
               L:=74;
               If Score>Level*6000 then If Level<9 then Inc(Level);
          End;
end;
if Top10Score then Top10;
End;
End.