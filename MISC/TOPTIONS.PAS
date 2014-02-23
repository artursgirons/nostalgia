{Glabal variables: Level:=1, Tipe:=1, Beep:=1}

Procedure Options;
Const Option:Array[1..4]of String[8]=('Level :','Type  :','Sound :','    Done');
      Coords:Array[1..4]of byte=(15,17,19,30);
      Tip:Array[1..3]of string[8]=('Basic   ','Extendet','Bizar   ');
      OnOff:Array[0..1]of string[3]=('Off','On ');
Var ch:char;
    a:Byte;
Begin
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
  Write('Sound : ',tip[beep]);
  Gotoxy(9,30);
  Write('    Done');
  a:=1;
  While True do
  Begin
    If keypressed then
    Begin
      ch:=readkey;
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
