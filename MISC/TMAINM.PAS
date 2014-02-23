Function MainMenu:Byte;
Const Menu:Array[1..5]of String[10]=('Start','Options','Help','Top 10','Quit');
Var a,b,c:Byte;
    ch:Char;
Begin
  Gotoxy(10,5);
  TextColor(10);
  Write('T E T R I S');
  TextColor(8);
  For a:=1 to 5 do
  Begin
    Gotoxy(12,13+a*2);
    Write(Menu[a]);
  End;
  b:=1;
  Gotoxy(12,13+b*2);
  TextColor(10);
  Write(Menu[b]);
  While True Do
  Begin
    If Keypressed then
    Begin
      ch:=readkey;
      If ord(ch)=0 then ch:=readkey;
      Gotoxy(12,13+b*2);
      Textcolor(8);
      Write(Menu[b]);
      TextColor(10);
      case ord(ch) of
        72:Begin If b=1 then b:=5 else Dec(b);Gotoxy(12,13+b*2);Write(Menu[b]) End;
        80:Begin If b=5 then b:=1 else Inc(b);Gotoxy(12,13+b*2);Write(Menu[b]) End;
        13:Begin MainMenu:=b;Exit End;
        27:Halt;
      End;
    End;
  End;
End;
