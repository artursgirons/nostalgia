Program Database;
Uses Crt;
Type TRec=Record
            Name:String;
            Sparni,Kermenis,Krava,Svars:integer;
            Apkalpe,Pasazieri:Integer;
          End;
Var F:File of TRec;
    K:TRec;
    se,p,a,b:Integer;
    c,d:Real;

Procedure DrawScreen;
Var a,b:Byte;
Begin
  Textbackground(0);Clrscr;Textbackground(7);TextColor(0);
  Gotoxy(2,25); Write(' F - For Menu                                                                 ');
  TextColor(7);TextBackGround(0);
  Gotoxy(2,1); Write('³Nosaukums       ³Sparni m ³Kermeni m³Krava  t ³Svars  t ³Apkalpe  ³Pasazieri³');
  Gotoxy(2,2); Write('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´');
  For a:=3 to 24 do
  Begin
    Gotoxy(2,a);Write('³');
    Gotoxy(19,a);Write('³');
    Gotoxy(29,a);Write('³');
    Gotoxy(39,a);Write('³');
    Gotoxy(49,a);Write('³');
    Gotoxy(59,a);Write('³');
    Gotoxy(69,a);Write('³');
    Gotoxy(79,a);Write('³');
  End;
End;

Procedure Check;
Begin
  Assign(f,'c:\Planes.dtb');
  {$I-}Reset(f);{$I+}
  if ioresult<>0 then
  Begin
    K.Name:='..';K.Sparni:=0;K.Kermenis:=0;K.Krava:=0;K.Svars:=0;K.Apkalpe:=0;K.pasazieri:=0;
    Rewrite(F);
    Write(f,K);
  End;
  Close(f);
End;

Procedure fill;
Var a:byte;
Begin
Assign(f,'c:\planes.dtb');
Reset(f);
a:=2;
While not eof(f) do
  Begin
    inc(a);
    Read(f,k);
    Gotoxy(3,a);Write(k.Name);
    Gotoxy(20,a);Write(k.sparni);
    Gotoxy(30,a);Write(k.kermenis);
    Gotoxy(40,a);Write(k.krava);
    Gotoxy(50,a);Write(k.svars);
    Gotoxy(60,a);Write(k.apkalpe);
    Gotoxy(70,a);Write(k.pasazieri);
  End;
Close(f);
End;

Function Move:Byte;
Begin

end;

Begin
  Check;
  DrawScreen;
  Fill;
End.