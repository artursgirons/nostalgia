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
  Gotoxy(2,25); Write(' F - For Menu                                                                 ');
  TextColor(7);TextBackGround(0);
  Gotoxy(2,1); Write('�Nosaukums       �Sparni m �Kermeni m�Krava  t �Svars  t �Apkalpe  �Pasazieri�');
  Gotoxy(2,2); Write('����������������������������������������������������������������������������Ĵ');
  For a:=3 to 24 do
  Begin
    Gotoxy(2,a);Write('�');
    Gotoxy(19,a);Write('�');
    Gotoxy(29,a);Write('�');
    Gotoxy(39,a);Write('�');
    Gotoxy(49,a);Write('�');
    Gotoxy(59,a);Write('�');
    Gotoxy(69,a);Write('�');
    Gotoxy(79,a);Write('�');
  End;
  Window(1,3,80,24);
End;

Procedure Check;
Begin
  Assign(f,'c:\Planes.dtb');
  {$I-}Reset(f);{$I+}
  if ioresult<>0 then
  Begin
    K.Name:='..';K.Dati[1]:=0;K.Dati[2]:=0;K.Dati[3]:=0;K.Dati[4]:=0;K.Dati[5]:=0;K.Dati[6]:=0;
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
Fs:=filesize(f);
a:=0;
While (not eof(f))and(a<22) do
  Begin
    inc(a);
    Read(f,k);
    Gotoxy(3,a);Write(k.Name:16);
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
  Write('�',K.Name:16,'�',k.Dati[1]:9,'�',k.Dati[2]:9,'�',k.Dati[3]:9,'�',k.Dati[4]:9,'�',k.Dati[5]:9,'�',k.Dati[6]:9,'�');
end;

Begin
  Cursoroff;
  Assign(f,'C:\planes.dtb');Reset(f);
  Seek(f,se);Read(f,k);
  TextBackground(2);TextColor(0);Gotoxy(2,p);
  Write('�',K.Name:16,'�',k.Dati[1]:9,'�',k.Dati[2]:9,'�',k.Dati[3]:9,'�',k.Dati[4]:9,'�',k.Dati[5]:9,'�',k.Dati[6]:9,'�');
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
        ord('f'),ord('F'):
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
      Write('�',K.Name:16,'�',k.Dati[1]:9,'�',k.Dati[2]:9,'�',k.Dati[3]:9,'�',k.Dati[4]:9,'�',k.Dati[5]:9,'�',k.Dati[6]:9,'�');
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