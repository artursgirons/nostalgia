Program Ship_Battle;
Uses Crt,Graph;
Const Sizex = 24;
      Sizey = 20;
      Del =7000;
Var MyField:Array[0..143] of Byte;
    PcField:Array[0..143] of Byte;
    Rezultats:array[1..2] of Byte;
    Gm,Gd,Dx,Dy:Integer;
    Q,Loc,LastLoc,Lloc,Tips:Byte;
    a,b,c,bb:Byte;
    Ch:char;
    Way,d:Shortint;
    q1,q2:byte;
    Po:pointer;
    f:file;
Function TestShip(const Xt:byte):Boolean;
Begin
  Q:=Abs(Way);
  If Xt=1 Then
  Begin
    For c:=0 to a-1 do
    If ((Loc+Q*c) div 12=0) or ((Loc+Q*c) div 12=11) or ((Loc+Q*c) mod 12=0) or ((Loc+Q*c) mod 12=11)
    Then TestShip:=False;
  End;
  If Xt=2 Then
  Begin
    For c:=0 to a-1 do
    Begin
      If MyField[Loc+Q*c]<>0 then Testship:=False;
    End;
  End;
  If Xt=3 Then
  Begin
    For c:=0 to a-1 do
    Begin
      If PcField[Loc+Q*c]<>0 then Testship:=False;
    End;
  End;
End;
Procedure InitMyShip;
Begin
  For a:=4 Downto 1 do
  For b:=1 to 5-a do
  Begin
  Loc:=13;Way:=-1;
  While True Do
  Begin
    Case Abs(Way) of
    12:begin q1:=12;q2:=0 end;
     1:begin q1:=0;q2:=1  end;
    End;
    Setcolor(10);
    rectangle((loc-loc div 12 * 12)*sizex+Dx,loc div 12 *sizey+Dy,
    ((loc+q2*(a-1))-(loc+q2*(a-1)) div 12 * 12)*sizex+sizex+Dx,(loc+q1*(a-1)) div 12 *sizey+sizey+Dy);
    Ch:=Readkey;
    If ord(ch)=0 then Ch:=Readkey;
    Setcolor(8);
    rectangle((loc-loc div 12 * 12)*sizex+Dx,loc div 12 *sizey+Dy,
    ((loc+q2*(a-1))-(loc+q2*(a-1)) div 12 * 12)*sizex+sizex+Dx,(loc+q1*(a-1)) div 12 *sizey+sizey+Dy);
    Case Ord(ch) of
      77:Begin Loc:=loc+1;  if Not TestShip(1) then Loc:=loc-1;end;
      75:Begin Loc:=loc-1;  if Not TestShip(1) then Loc:=loc+1;  end;
      80:Begin Loc:=loc+12; if Not TestShip(1) then Loc:=loc-12; end;
      72:Begin Loc:=loc-12; if Not TestShip(1) then Loc:=loc+12; end;
      32:Begin Way:=11-Way; if Not TestShip(1) then Way:=11-Way;  end;
      13:Begin If TestShip(2) then Break ;sound(100);delay(30);nosound;End;
      27:Begin Dispose(po);CloseGraph;Halt End;
    End;
  End;
  sound(600); delay(10); nosound;
  MyField[Loc-Abs(Way)]:=3;MyField[Loc+Abs(Way)*a]:=3;
  For d:=-1 to a do
  Begin
  MyField[Loc-abs(11-Way)+Abs(Way)*d]:=3;
  MyField[Loc+abs(11-Way)+Abs(Way)*d]:=3;
  End;
  For c:=0 to a-1 do
  Begin
    MyField[Loc+Abs(Way)*c]:=1;
    Setcolor(2);
    rectangle(((loc+q2*(c))-(loc+q2*(c)) div 12 * 12)*sizex+1+Dx,(loc+q1*(c)) div 12 *sizey+1+Dy,
    ((loc+q2*(c))-(loc+q2*(c)) div 12 * 12)*sizex+sizex-1+Dx,(loc+q1*(c)) div 12 *sizey+sizey-1+Dy);
  End;
  End;
End;
Procedure InitPcShip;
var k:byte;
Begin
  For a:=4 downto 1 do
  For b:=1 to 5-a do
  Begin
    While true do
    Begin
      Loc:=random(144);
      k:=random(2);
      If k=1 then Way:=-1 else Way:=12;
      If Testship(1) and Testship(3) then break;
    End;
    PcField[Loc-Abs(Way)]:=3;PcField[Loc+Abs(Way)*a]:=3;
    For d:=-1 to a do
    Begin
      PcField[Loc-Abs(11-Way)+Abs(Way)*d]:=3;
      PcField[Loc+Abs(11-Way)+Abs(Way)*d]:=3;
    End;
    For c:=0 to a-1 do PcField[Loc+Abs(Way)*c]:=1;
  End;
End;
Procedure Draw_X(Const p,u:byte);
Begin
   if u=0 then delay(del);
   putimage((p-p div 12 * 12)*sizex+1+Dx+3+u*320-1,p div 12 *sizey+Dy+2,po^,0);
   sound(600); delay(10); nosound;
End;
Procedure Wway;
Begin
  Way:=0;
  If MyField[LastLoc-1]=1 then Begin Way:=-1; exit End;
  If MyField[LastLoc+12]=1 then Begin Way:=12;exit End;
  If MyField[LastLoc+1]=1 then Begin Way:=1;  exit End;
  If MyField[LastLoc-12]=1 then Begin Way:=-12;exit End;
End;
Procedure Wway2;
Begin
  Way:=0;
  If PcField[Loc-1] in [1,2] then Begin Way:=-1; exit End;
  If PcField[Loc+12] in [1,2] then Begin Way:=12;exit End;
  If PcField[Loc+1] in [1,2] then Begin Way:=1;  exit End;
  If PcField[Loc-12] in [1,2] then Begin Way:=-12;exit End;
End;
procedure Deth(const r:byte);
var a1,a2:byte;
    s:string;
Begin
  str((10-rezultats[r]),s);
  Setfillstyle(1,0);setcolor(2);
  if r=1 then Begin bar(375,285,600,296);outtextxy(388,{61}285,'Datorm palika '+s+' kugisi');End;
  if r=2 then Begin bar(50,285,310,296);outtextxy(55,{61}285,'Lietotajam palika '+s+' kugisi');End;
  If Rezultats[r]=10 then
  Begin
    Setcolor(0);
{    for a2:=0 to 10 do
    for a1:=1 to 35 do
    Begin line(1,a2+a1*10,640,a2+a1*10) End;
    Cleardevice;                            }
    gotoxy(1,1); textbackground(0); textcolor(0);
    for a1:=1 to 23 do Begin delay(500);delline; end;
    Setcolor(10);
    if r=1 then Outtextxy(260,170,'Uzvareja LIETOTAJS.') else
    Outtextxy(260,170,'  Uzvareja DATORS.');
    Repeat Ch:=readkey until ord(ch)=27;
    Closegraph;
    dispose(po);
    Halt;
  End;
End;
Procedure PcSolo;
Var k1,k2:Shortint;
Begin
  setcolor(2);Rectangle(Sizex+dx-3,sizey+dy-3,Sizex*11+dx+3,Sizey*11+dy+3);
  k1:=1;k2:=1;
  If LastLoc in[0,1] Then
  Begin
    Way:=1;a:=1;LastLoc:=1;Tips:=1;
    While True do Begin Loc:=Random(144);if (TestShip(1)) and (Myfield[loc] <> 2)and(Myfield[loc]<>5)
      And(Myfield[loc+1]<>2)and(Myfield[loc-1]<>2)and(Myfield[loc+12]<>2)and(Myfield[loc-12]<>2)
      And(Myfield[loc+13]<>2)and(Myfield[loc-13]<>2)and(Myfield[loc+11]<>2)and(Myfield[loc-11]<>2)
      Then Break
    End;
    delay(del);
    setcolor(7);setfillstyle(1,7);
    fillellipse(((loc)-(loc) div 12 * 12)*sizex+1+Dx+sizex div 2-1,(loc) div 12 *sizey+1+Dy+sizey div 2-1,2,1);
    If Myfield[loc]<>1 then
    Begin
      Myfield[loc]:=5;
      Delay(del*2);
      sound(100); delay(30); nosound;
      setcolor(0);Rectangle(Sizex+dx-3,sizey+dy-3,Sizex*11+dx+3,Sizey*11+dy+3);
    End;
    If MyField[Loc]=1 Then
    Begin
      MyField[loc]:=2;
      If (MyField[Loc+1]=1)or(MyField[Loc-1]=1)or(MyField[Loc+12]=1)or(MyField[Loc-12]=1)
      Then
      Begin
        LastLoc:=loc;bb:=0;
        Draw_X(LastLoc,0);
        Wway;
        exit;
      End
      Else
      Begin
        Draw_X(Loc,0);LastLoc:=0;inc(Rezultats[2]);Deth(2);exit;
      End;
    End;
  End
  Else
  Begin
    lastloc:=lastloc+way;
    if myfield[lastloc]=1 then
    Begin
      Myfield[lastloc]:=2;inc(Tips);
      delay(del);
      setcolor(7);setfillstyle(1,7);
      fillellipse(((lastloc)-(lastloc) div 12 * 12)*sizex+1+Dx+sizex div 2-1,(lastloc) div 12 *sizey+1+Dy+sizey div 2-1,2,1);
      Draw_X(LastLoc,0);
    end;
    if Myfield[lastloc+way]=1 then Begin lastloc:=lastloc;exit End
    Else
    Begin
      if bb=0 then Begin Way:=-Way;Lastloc:=lastloc+way End; bb:=1;
      for c:=1 to 2 do
      Begin
        if Myfield[lastloc+way*c]=1 then Begin lastloc:=lastloc+way*(c-1);myfield[lastloc]:=2;exit end;
        if Myfield[lastloc+way*c] in [3,5] then Begin Lastloc:=0;inc(Rezultats[2]);Deth(2);exit end;
      End;
    End;
  End;
End;
Procedure MySolo;
var cod,k1,k2:integer;
Begin
  setcolor(2);Rectangle(Sizex+dx-3+320,sizey+dy-3,Sizex*11+dx+3+320,Sizey*11+dy+3);
  Loc:=lloc;
  While true do
  Begin
    Setcolor(10);
    rectangle((loc-loc div 12 * 12)*sizex+Dx+320,loc div 12 *sizey+Dy,
    ((loc+q2*(a-1))-(loc+q2*(a-1)) div 12 * 12)*sizex+sizex+Dx+320,(loc+q1*(a-1)) div 12 *sizey+sizey+Dy);
    Ch:=readkey;
    Setcolor(8);
    rectangle((loc-loc div 12 * 12)*sizex+Dx+320,loc div 12 *sizey+Dy,
    ((loc+q2*(a-1))-(loc+q2*(a-1)) div 12 * 12)*sizex+sizex+Dx+320,(loc+q1*(a-1)) div 12 *sizey+sizey+Dy);
    if ord(ch)=0 then ch:=readkey;
    Case ord(ch) of
      77:Begin Loc:=loc+1;  if Not TestShip(1) then Loc:=loc-1;  end;
      75:Begin Loc:=loc-1;  if Not TestShip(1) then Loc:=loc+1;  end;
      80:Begin Loc:=loc+12; if Not TestShip(1) then Loc:=loc-12; end;
      72:Begin Loc:=loc-12; if Not TestShip(1) then Loc:=loc+12; end;
      13:Begin if PcField[Loc] in [1,3,0] then Break End;
      27:Begin Dispose(po);CloseGraph;Halt End;
    End;
  End;
  setcolor(7);setfillstyle(1,7);
  fillellipse(((loc)-(loc) div 12 * 12)*sizex+1+Dx+sizex div 2-1+320,(loc) div 12 *sizey+1+Dy+sizey div 2-1,2,1);
  lloc:=loc;
  if PcField[loc]=1 then
  Begin
    PcField[loc]:=2;WWay2;tips:=0;cod:=0;
    for c:=1 to 3 do
    Begin
      if Pcfield[loc+way*c] = 2 then inc(cod);
      if Pcfield[loc+way*c] in [1,2] then inc(tips) else break;
    End;
    for c:=1 to 3 do
    Begin
      if Pcfield[loc-way*c] = 2 then inc(cod);
      if Pcfield[loc-way*c] in [1,2] then inc(tips) else break;
    End;
    inc(tips);if tips=7 then tips:=1;
    if tips = 1 then cod:=0;
    Draw_X(Loc,1);
{******************}
    if (cod+1)=tips then
    Begin
     Setcolor(12);
     rectangle(((loc)-(loc) div 12 * 12)*sizex+1+Dx+320,(loc) div 12 *sizey+1+Dy,
     ((loc)-(loc) div 12 * 12)*sizex+sizex-1+Dx+320,(loc) div 12 *sizey+sizey-1+Dy);
    for c:=1 to 3 do
    if Pcfield[loc-way*c] =2 then
    Begin
     lastloc:=loc-Way*c;
     Setcolor(12);
     rectangle(((lastloc)-(lastloc) div 12 * 12)*sizex+1+Dx+320,(lastloc) div 12 *sizey+1+Dy,
     ((lastloc)-(lastloc) div 12 * 12)*sizex+sizex-1+Dx+320,(lastloc) div 12 *sizey+sizey-1+Dy);
    End else break;
    for c:=1 to 3 do
    if Pcfield[loc+way*c] =2 then
    Begin
     lastloc:=loc+Way*c;
     Setcolor(12);
     rectangle(((lastloc)-(lastloc) div 12 * 12)*sizex+1+Dx+320,(lastloc) div 12 *sizey+1+Dy,
     ((lastloc)-(lastloc) div 12 * 12)*sizex+sizex-1+Dx+320,(lastloc) div 12 *sizey+sizey-1+Dy);
    End else break;
    lastloc:=0;
    inc(Rezultats[1]);
    Deth(1);
    End;
{******************}
    Lastloc:=loc;
  End
  Else
  Begin
    Lastloc:=1;
    PcField[loc]:=4;
    setcolor(0);Rectangle(Sizex+dx-3+320,sizey+dy-3,Sizex*11+dx+3+320,Sizey*11+dy+3);
    sound(100);delay(30);nosound;
  End;
End;
Begin
Randomize;
clrscr;
assign(f,'c:\tp\programs.pas\ships\fire.spr');
reset(f,1);
gm:=filesize(f);
getmem(po,gm);
blockread(f,po^,gm);
close(f);
Gm:=3;Gd:=1;
Initgraph(Gm,Gd,'');
setcolor(8);
Dx:=(320-sizex*12)div 2;
Dy:=(350-sizey*12)div 2;
For a:=1 to 11 do
Begin
Line(sizex+Dx,a*Sizey+dy,sizex*10+sizex+Dx,a*sizey+dy);
Line(a*sizex+Dx,sizey+dy,a*sizex+Dx,sizey*10+sizey+dy);
Line(sizex+320+Dx,a*Sizey+dy,sizex*10+sizex+320+Dx,a*sizey+dy);
Line(a*sizex+320+Dx,sizey+dy,a*sizex+320+Dx,sizey*10+sizey+dy);
End;
setcolor(2);Rectangle(Sizex+dx-3,sizey+dy-3,Sizex*11+dx+3,Sizey*11+dy+3);
setcolor(10);
outtextxy(434,{285}61,'Datora lauks');
outtextxy(100,{285}61,'Lietotaja lauks');
InitMyShip;
InitPcShip;
Deth(1);Deth(2);
setcolor(0);Rectangle(Sizex+dx-3,sizey+dy-3,Sizex*11+dx+3,Sizey*11+dy+3);
Setcolor(12);lloc:=13;
Rezultats[1]:=0;Rezultats[2]:=0;
Deth(1);Deth(2);
While true do
Begin
Repeat MySolo; until lastloc=1;
Repeat PcSolo; until lastloc=1;
End;
Readln;
Closegraph;
End.