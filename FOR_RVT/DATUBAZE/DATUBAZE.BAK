Program Database;
Uses Crt,menu2;
Type TRec=Record
            Name:String;
            Dati:array[1..6] of longint;
           {Sparni,Kermenis,Krava,Svars,Apkalpe,Pasazieri}
          End;
Const Menu1:Array[1..6]of string=('5','Add','Remove','Sort','Edit','Exit');
      Menu12:Array[1..7] of string=('',' Add New Data Befor Curent cursor position',
                                     ' Remove data from curent cursor position',
                                     ' Sort Data By',
                                     ' Edit Data In Curent String',
                                     ' Exit Data Base',
                                     ' ESC-Exit DEL-Remove INS-Add F9, ALT+F-Menu   ENTER-Edit curent record');
Var F:File of TRec;
    K:TRec;
    se,p:Integer;
    po:byte;
Const pic:array[0..6]of string=
('       °±²°±²°±² °±²       °±²°±²°±² °±²    °±² °±²°±²°±² °±²°±²°±²',
'       °±²   °±² °±²       °±²   °±² °±²    °±² °±²       °±²      ',
'       °±²   °±² °±²       °±²   °±² °±²°±  °±² °±²       °±²      ',
'       °±²°±²°±² °±²       °±²°±²°±² °±² °±²°±² °±²°±²°±² °±²°±²°±²',
'       °±²       °±²       °±²   °±² °±²    °±² °±²             °±²',
'       °±²       °±²°±²°±² °±²   °±² °±²    °±² °±²°±²°±² °±²°±²°±²',
'                                DataBase');
Procedure fill;
Var a:byte;
Begin
a:=0;
Seek(f,0);
TextColor(7);TextBackGround(0);
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
Const Menu2:Array[1..9]of string=('7',' By Wings',' By Plane Cost',' By Cargo',' By Weight',' By Team',' By Pasangers',
' By Name',' ESC-Exit DEL-Remove INS-Add F9, ALT+F-Menu   ENTER-Edit curent record');
Var d,t,t2:byte;
    k2:TRec;
function comp:boolean;
Var i,o:byte;
    r:boolean;
Begin
  if length(k2.name)>Length(k.name)then i:=length(k.name) else i:=length(k2.name);
  o:=0;
  for i:=1 to i do
  Begin
    if upcase(k2.name[i])>upcase(k.name[i]) then Begin r:=true;break End;
    if upcase(k2.name[i])<upcase(k.name[i]) then Begin r:=false;break End;
    if upcase(k2.name[i])=upcase(k.name[i]) then Begin inc(o) End;
  End;
  if o=i then if length(k2.name)>Length(k.name)then r:=true else r:=false;
  comp:=r;
End;
Begin
  Menubar(2,15,menu2,menu2,d);
  if filesize(f)=1 then exit;
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
      Write('³',K.Name:16,'³',k.Dati[1]:9,'³',k.Dati[2]:9,'³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³',k.Dati[6]:9,'³');
    End else
    Write('³','':16,'³','':9,'³','':9,'³','':9,'³','':9,'³','':9,'³','':9,'³');
  end;
end;

procedure ReadX(x,y,f,e:byte;var s:string);
Var ch:char;
Begin
  cursoron;
  textbackground(2);
  TextColor(0);
  Gotoxy(x-1,y);Write('³',s:f,'³');
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
  Gotoxy(x-1,y);Write('³',s:f,'³');
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
  Write('³','':16,'³','':9,'³','':9,'³','':9,'³','':9,'³','':9,'³','':9,'³');
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
  if se<filesize(f)-1 then Begin
  TextColor(7);
  textbackground(0);
  s:=k.name;readx(3,p,16,0,s);k.name:=s;
  str(k.dati[1],s);readx(20,p,9,1,s);val(s,h,cod);k.dati[1]:=h;
  str(k.dati[2],s);readx(30,p,9,1,s);val(s,h,cod);k.dati[2]:=h;
  str(k.dati[3],s);readx(40,p,9,1,s);val(s,h,cod);k.dati[3]:=h;
  str(k.dati[4],s);readx(50,p,9,1,s);val(s,h,cod);k.dati[4]:=h;
  str(k.dati[5],s);readx(60,p,9,1,s);val(s,h,cod);k.dati[5]:=h;
  str(k.dati[6],s);readx(70,p,9,1,s);val(s,h,cod);k.dati[6]:=h;
  seek(f,se); write(f,k);End;
End;

Procedure DrawScreen;
Var a,b:Byte;
Begin
  Textbackground(0);Clrscr;Textbackground(7);TextColor(0);
  Gotoxy(2,25); Write(' ESC-Exit DEL-Remove INS-Add F9, ALT+F-Menu   ENTER-Edit curent record        ');
  TextColor(2);TextBackGround(0);
  Gotoxy(2,1); Write('      Plane Model   Wings m   Costs $  Cargo kg Weight kg      Team Pasangers ');
  TextColor(7);TextBackGround(0);
  For a:=1 to 24 do
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
  Gotoxy(2,2); Write('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´');
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
const Yeno:array[1..3]of string =('2','Yes','No');
      Yeno2:array[1..4]of string =('2',' Remove Curent Data',' Dont Remove This Data',
      ' ESC-Exit DEL-Remove INS-Add F9, ALT+F-Menu  ENTER-Edit curent record');
      co1:Array[1..7]of byte=(3,20,30,40,50,60,70);
      co2:array[1..7]of byte=(16,9,9,9,9,9,9);
      co3:Array[1..7]of byte=(0,1,1,1,1,1,1);
      qu:array[1..4]of string=('2',' Exit DataBase',' Don''t exit DataBase',
      ' ESC-Exit DEL-Remove INS-Add F9, ALT+F-Menu  ENTER-Edit curent record');
Var ch:char;
    res:byte;
    ss:string;
    ww,cods:integer;
procedure clear;
Begin
  Seek(f,se);Read(f,k);TextBackground(0);TextColor(7);Gotoxy(2,p);
  Write('³',K.Name:16,'³',k.Dati[1]:9,'³',k.Dati[2]:9,'³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³',k.Dati[6]:9,'³');
end;
Procedure Draw;
Begin
  Seek(f,se);Read(f,k);TextBackground(7);TextColor(0);Gotoxy(2,p);
  Write('³',K.Name:16,'³',k.Dati[1]:9,'³',k.Dati[2]:9,'³',k.Dati[3]:9,'³',k.Dati[4]:9,'³',k.Dati[5]:9,'³',k.Dati[6]:9,'³');
  gotoxy(co1[po]-1,p);textBackground(2);
  if po=1 then Write('³',K.name:co2[po],'³') else Write('³',K.dati[po-1]:co2[po],'³');
End;

Begin
  Assign(f,'C:\planes.dtb');Reset(f);
  Seek(f,se);Read(f,k);
  Draw;
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
        33,67:
           Begin
             Menubar(2,22,menu1,menu12,res);
             Case res of
              1:Begin Clear;Add; End;
              2:Begin menubar(35,10,yeno,yeno2,res);If res=1 then Begin Clear;Remove;End;End;
              3:Begin Clear;Sort;End;
              4:Begin Clear;Edit;End;
              5:
               Begin
                 Menubar(35,10,yeno,qu,res);if res=1 then Begin
                 Window(1,1,80,25);TextColor(7);TextBackGround(0);Clrscr;close(f);halt;
                 End;
               End;
             End;
           End;
        83:Begin Menubar(35,10,yeno,yeno2,res);if res=1 then Begin Clear;Remove End; End;
        82:Begin Clear;add End;
        77:Begin if po<7 then inc(po) End;
        75:Begin if po>1 then dec(po) end;
        27:
           Begin
             Menubar(35,10,yeno,qu,res);if res=1 then Begin
             Window(1,1,80,25);TextColor(7);TextBackGround(0);Clrscr;close(f);halt;
             End;
           End;
        13:Begin
             Clear;
             if se<filesize(f)-1 then Begin
             if po=1 then ss:=k.name else str(k.dati[po-1],ss);
             Readx(co1[po],p,co2[po],co3[po],ss);
             if po=1 then k.name:=ss else val(ss,k.dati[po-1],cods);
             Seek(f,se);
             Write(f,k);End;
           End;
      End;
      Draw;
    End;
  End;
  Close(f);
end;

Begin
  TextColor(10);
  TextBackground(0);
  Clrscr;
  Gotoxy(1,5);
  Cursoroff;
  for p:=0 to 6 do Writeln(pic[p]);
  Textcolor(7);
  Writeln;
  Writeln;
  Writeln('       DataBase  About  planes,  there  basic  configuration,  size, ');
  Writeln('       posible   maximum   cargo,   pasangers,   and   plane  costs ');
  Writeln('       DataBase alow you to manipuleit with data in comfortable way.');
  Writeln('       Data   can   be   easly   ADD,   REMOVED,   EDIT  and   SORT');
  Writeln('       that provides hudge increasment of production, by decreasing');
  Writeln('       time,  then''s  spent  on   data   colekting  and  processing');
  textcolor(7);
  readkey;
  Se:=0;P:=1;po:=1;
  Check;
  DrawScreen;
  Assign(f,'c:\planes.dtb');Reset(f);Fill;Close(f);
  Move;
End.