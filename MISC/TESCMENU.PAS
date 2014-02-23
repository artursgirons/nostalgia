Function EscMenu:Byte;
Const Opt:Array[0..1] of String[9]=('Resume','Main Menu');
Var a:Byte;
    ch:Char;
Begin
  ClrScr;
  TextColor(10);
  Gotoxy(10,5);
  Write('T E T R I S');
  Gotoxy(10,17);
  Write(Opt[0]);
  TextColor(8);
  Gotoxy(10,19);
  Write(Opt[1]);
  a:=0;
  While true do
    If keypressed then
    Begin
      ch:=readkey;
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(13,17+a*2);
      Textcolor(8);
      Write(Opt[a]);
      Case ord(ch) of
        72,80:a:=1-a;
        13:Begin EscMenu:=a;Exit End;
        27:Begin EscMenu:=1;Exit End;;
      End;
      Gotoxy(13,17+a*2);
      Textcolor(10);
      Write(Qui[a]);
    End;
End;
