Procedure Quit;
Const Qui:array[0..1]of string[3]=('Yes','No ');
var a:Byte;
    ch:char;
Begin
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
