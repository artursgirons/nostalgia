Program Database;
Uses Crt,menu;
Type TRec=Record
            Name:String;
            Dati:array[1..6] of longint;
           {Sparni,Kermenis,Krava,Svars,Apkalpe,Pasazieri}
          End;
Const Menu1:Array[1..6]of string=('5','Add','Remove','Sort','Edit','Exit');
Var F:File of TRec;
    K:TRec;
    se,p:Integer;
Const pic:array[0..5]of string=
('       ��������� ���       ��������� ���    ��� ��������� ���������',
'       ���   ��� ���       ���   ��� ���    ��� ���       ���      ',
'       ���   ��� ���       ���   ��� �����  ��� ���       ���      ',
'       ��������� ���       ��������� ��� ������ ��������� ���������',
'       ���       ���       ���   ��� ���    ��� ���             ���',
'       ���       ��������� ���   ��� ���    ��� ��������� ���������');
Procedure fill;
Var a:byte;
Begin
a:=0;
Seek(f,0);
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
End;

Procedure Sort;
Const Menu2:Array[1..8]of string=('7','By Wings','By Plane Cost','By Cargo','By Weight','By Team','By Pasangers','By Name');
Var d,t,t2:byte;
    k2:TRec;
function comp:boolean;
Var i:byte;
    r:boolean;
Begin
  if length(k2.name)>Length(k.name)then i:=length(k.name) else i:=length(k2.name);
  r:=true;
  for i:=1 to i do
  Begin
    if ord(upcase(k2.name[i]))<ord(upcase(k.name[i])) then Begin r:=false;break End;
  End;
  if (length(k2.name)>length(k.name))and r then r:=true;
  if (length(k2.name)<length(k.name))and r then r:=false;
  comp:=r;
End;
Begin
  Menubar(2,15,menu2,d);
  if d=0 then exit;
  if d<7 then
  Begin
    for t2:=1 to filesize(f) do
    Begin
    for t:=1 to filesize(f)-2 do
    Begin
      seek(f,t-1);Read(f,k2);read(f,k);if k2.dati[d]>k.dati[d]then Begin Seek(f,t-1);Write(f,k);Write(f,k2); End;
    end;
    End;
  End;
  if d=7 then
  Begin
    for t2:=1 to filesize(f) do
    Begin
    for t:=1 to filesize(f)-2 do
    Begin
      seek(f,t-1);Read(f,k2);read(f,k);if comp then Begin Seek(f,t-1);Write(f,k);Write(f,k2); End;
    end;
    End;
  End;
  Se:=0;P:=1;
  fill;
End;

Procedure Remove;
Var d:integer;
Begin
  if se<filesize(f)-1 then
  Begin
   gotoxy(2,p);delline;
    for d:=se+1 to filesize(f)-1 do
    Begin
      seek(f,d);
      Read(f,k);
      Seek(f,d-1);
      Write(f,k);
    End;
    seek(f,filesize(f)-1);
    truncate(f);
    gotoxy(2,22);
    if (22-p)+se<filesize(f) then
    Begin
      seek(f,22-p+se);
      read(f,k);
      Write('�',K.Name:16,'�',k.Dati[1]:9,'�',k.Dati[2]:9,'�',k.Dati[3]:9,'�',k.Dati[4]:9,'�',k.Dati[5]:9,'�',k.Dati[6]:9,'�');
    End else
    Write('�','':16,'�','':9,'�','':9,'�','':9,'�','':9,'�','':9,'�','':9,'�');
  end;
end;

procedure ReadX(x,y,f,e:byte;var s:string);
Var ch:char;
Begin
  cursoron;
  textbackground(2);
  TextColor(0);
  Gotoxy(x-1,y);Write('�',s:f,'�');
  While true do
  Begin
    ch:=readkey;
    if ord(ch)=13 then Break;
    if ((e=1)and(ord(ch)>47)and(ord(ch)<58)and(length(s)<9))or((e=0)and(ord(ch)>31)and(ord(ch)<150)and(length(s)<15)) then
     Begin S:=s+ch;Gotoxy(x,y);TextColor(0);Write(s:f);End;
    If (ord(ch)=8)and(length(s)>0) then Begin Delete(s,length(s),1);Gotoxy(x,y);Write(s:f) end;
  End;
  textbackground(0);
  TextColor(7);
  Gotoxy(x-1,y);Write('�',s:f,'�');
  Cursoroff;
End;

Procedure Add;
var t,cod:integer;
    h:longint;
    s:string;
Begin
  for t:=filesize(f)-1 downto se do
  Begin
    seek(f,t);read(f,k);
    seek(f,t+1);Write(f,k);
  end;
  TextColor(7);
  textbackground(0);
  gotoxy(2,p);insline;
  gotoxy(2,p);
  Write('�','':16,'�','':9,'�','':9,'�','':9,'�','':9,'�','':9,'�','':9,'�');
  s:='';readx(3,p,16,0,s);k.name:=s;
  s:='';readx(20,p,9,1,s);val(s,h,cod);k.dati[1]:=h;
  s:='';readx(30,p,9,1,s);val(s,h,cod);k.dati[2]:=h;
  s:='';readx(40,p,9,1,s);val(s,h,cod);k.dati[3]:=h;
  s:='';readx(50,p,9,1,s);val(s,h,cod);k.dati[4]:=h;
  s:='';readx(60,p,9,1,s);val(s,h,cod);k.dati[5]:=h;
  s:='';readx(70,p,9,1,s);val(s,h,cod);k.dati[6]:=h;
  seek(f,se);
  write(f,k);
End;

Procedure Edit;
var t,cod:integer;
    h:longint;
    s:string;
Begin
  TextColor(7);
  textbackground(0);
  s:=k.name;readx(3,p,16,0,s);k.name:=s;
  str(k.dati[1],s);readx(20,p,9,1,s);val(s,h,cod);k.dati[1]:=h;
  str(k.dati[2],s);readx(30,p,9,1,s);val(s,h,cod);k.dati[2]:=h;
  str(k.dati[3],s);readx(40,p,9,1,s);val(s,h,cod);k.dati[3]:=h;
  str(k.dati[4],s);readx(50,p,9,1,s);val(s,h,cod);k.dati[4]:=h;
  str(k.dati[5],s);readx(60,p,9,1,s);val(s,h,cod);k.dati[5]:=h;
  str(k.dati[6],s);readx(70,p,9,1,s);val(s,h,cod);k.dati[6]:=h;
  seek(f,se); write(f,k);
End;

Procedure DrawScreen;
Var a,b:Byte;
Begin
  Textbackground(0);Clrscr;Textbackground(7);TextColor(0);
  Gotoxy(2,25); Write(' F or Enter for Menu                                                          ');
  TextColor(7);TextBackGround(0);
  Gotoxy(2,1); Write('�     Plane Model�    Wings�    Costs�    Cargo�   Weight�     Team�Pasangers�');
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
    Rewrite(f);
    K.Name:='..';K.Dati[1]:=0;K.Dati[2]:=0;K.Dati[3]:=0;K.Dati[4]:=0;K.Dati[5]:=0;K.Dati[6]:=0;
    Write(f,K);
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
        80:Begin Clear;If (p<22)and(se<filesize(f)-1) then Begin p:=p+1;inc(se) End else if se<filesize(f)-1 then
           Begin gotoxy(1,1);delline;inc(se);End;End;
        13,ord('f'),ord('F'):
           Begin
             Menubar(2,22,menu1,res);
             clear;
             Case res of
              1:Add;
              2:Remove;
              3:Sort;
              4:Edit;
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
  TextColor(10);
  TextBackground(0);
  Clrscr;
  Gotoxy(1,9);
  Cursoroff;
  for p:=0 to 5 do Writeln(pic[p]);
  textcolor(7);
  readkey;
  Se:=0;P:=1;
  Check;
  DrawScreen;
  Assign(f,'c:\planes.dtb');Reset(f);Fill;Close(f);
  Move;
End.