Program Database;
Uses Crt,menu;
Type TRec=Record
            Name:String;
            Dati:array[1..6] of integer;
           {Sparni,Kermenis,Krava,Svars,Apkalpe,Pasazieri}
          End;
Const Menu1:Array[1..6]of string=('5','Add','Remove','Sort','Edit','Exit');
Var F:File of TRec;
    K:TRec;
    se,p,a,b:Integer;
    c,d:Real;
    Fs:word;

Procedure DrawScreen;
Var a,b:Byte;
Begin
  Textbackground(0);Clrscr;Textbackground(7);TextColor(0);
  Gotoxy(2,25); Write(' F or Enter for Menu                                                          ');
  TextColor(7);TextBackGround(0);
  Gotoxy(2,1); Write('³ No³   Nosaukums³Sparni m ³Kermeni m³Krava  t ³Svars  t ³Apkalpe  ³Pasazieri³');
  Gotoxy(2,2); Write('ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´');
  For a:=3 to 24 do
  Begin
    Gotoxy(2,a);Write('³');
    Gotoxy(6,a);Write('³');
    Gotoxy(19,a);Write('³');
    Gotoxy(29,a);Write('³');
    Gotoxy(39,a);Write('³');
    Gotoxy(49,a);Write('³');
    Gotoxy(59,a);Write('³');
    Gotoxy(69,a);Write('³');
    Gotoxy(79,a);Write('³');
  End;
  Window(1,3,80,24);
End;

Procedure Check;
Begin
  Assign(f,'c:\Planes.dtb');
  {$I-}Reset(f);{$I+}
  if ioresult<>0 then
  Begin
    Rewrite(f);
    K.Name:='..';K.Dati[1]:=0;K.Dati[2]:=0;K.Dati[3]:=0;K.Dati[4]:=0;K.Dati[5]:=0;K.Dati[6]:=0;
    Write(f,K);
  End;
  Close(f);
End;

Procedure fill;
Var a:byte;
Begin
Assign(f,'c:\planes.dtb');
Reset(f);
Fs:=filesize(f);
a:=0;
While (not eof(f))and(a<22) do
  Begin
    inc(a);
    Read(f,k);
    Gotoxy(3,a);Write(a:3);
    Gotoxy(7,a);Write(k.Name:12);
    Gotoxy(20,a);Write(k.Dati[1]:9);
    Gotoxy(30,a);Write(k.Dati[2]:9);
    Gotoxy(40,a);Write(k.Dati[3]:9);
    Gotoxy(50,a);Write(k.Dati[4]:9);
    Gotoxy(60,a);Write(k.Dati[5]:9);
    Gotoxy(70,a);Write(k.Dati[6]:9);
  End;
Close(f);
End;

Function Move:Byte;
Var ch:char;
    res:byte;

procedure clear;
Begin
  Seek(f,se);Read(f,k);TextBackground(0);TextColor(7);Gotoxy(2,p);
  Write('³',se+1:3,'³',K.Name:12,'³',k.Dati[1]:9,'³',k.Dati[2]:9,
  '³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³',k.Dati[6]:9,'³');
end;

Begin
  Cursoroff;
  Assign(f,'C:\planes.dtb');Reset(f);
  Seek(f,se);Read(f,k);
  TextBackground(2);TextColor(0);Gotoxy(2,p);
  Write('³',se+1:3,'³',K.Name:12,'³',k.Dati[1]:9,'³',k.Dati[2]:9,'³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³'
  ,k.Dati[6]:9,'³');
  While true do
  Begin
    if keypressed then
    Begin
      ch:=readkey;if ord(ch)=0then ch:=readkey;
      Case ord(ch) of
        72:Begin Clear;If (p>1)and(se>0) then Begin p:=p-1;dec(se) End else if se>0 then
           Begin gotoxy(1,1);insline;dec(se);End;End;
        80:Begin Clear;If (p<22)and(se<fs-2) then Begin p:=p+1;inc(se) End else if se<fs-2 then
           Begin gotoxy(1,1);delline;inc(se);End;End;
        13,ord('f'),ord('F'):
           Begin
             Menubar(2,22,menu1,res);
             Case res of
              1:;
              2:;
              3:;
              4:;
              5:Begin Close(f);Halt End;
             End;
           End;
      End;
      Seek(f,se);Read(f,k);TextBackground(2);TextColor(0);Gotoxy(2,p);
      Write('³',se+1:3,'³',K.Name:12,'³',k.Dati[1]:9,'³',k.Dati[2]:9,'³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³'
      ,k.Dati[6]:9,'³');
    End;
  End;
  Close(f);
end;

Begin
  Se:=0;P:=1;
  Check;
  DrawScreen;
  Fill;
  Move;
End.