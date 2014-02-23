Program Snake;
Uses Crt;
Const n=300;ys=48;Cs=1;
Const Pic:array[1..23]of string[45]=(
(' ÛÛÛÛÛÛ                     Û'),
('Û      Û                    Û'),
('Û      Û                    Û'),
('Û         Û ÛÛÛÛ    ÛÛÛÛÛ   Û    ÛÛ  ÛÛÛÛÛ '),
('Û         ÛÛ    Û  Û     Û  Û  ÛÛ   Û     Û'),
(' ÛÛÛÛÛÛ   Û     Û        Û  Û Û     Û     Û'),
('       Û  Û     Û   ÛÛÛÛÛÛ  ÛÛ      ÛÛÛÛÛÛÛ'),
('       Û  Û     Û  Û     Û  Û Û     Û'),
('       Û  Û     Û  Û     Û  Û  Û    Û'),
('Û      Û  Û     Û  Û    ÛÛ  Û   Û   Û     Û'),
(' ÛÛÛÛÛÛ   Û     Û   ÛÛÛÛ Û  Û    ÛÛ  ÛÛÛÛÛ'),
(''),
(' ±±±±±±   ±     ±   ±±±± ±  ±    ±±  ±±±±± '),
('±      ±  ±     ±  ±    ±±  ±   ±   ±     ±'),
('       ±  ±     ±  ±     ±  ±  ±    ±'),
('       ±  ±     ±  ±     ±  ± ±     ±'),
('       ±  ±     ±   ±±±±±±  ±±      ±±±±±±±'),
(' ±±±±±±   ±     ±        ±  ± ±     ±     ±'),
('±         ±±    ±  ±     ±  ±  ±±   ±     ±'),
('±         ± ±±±±    ±±±±±   ±    ±±  ±±±±±'),
('±      ±                    ±'),
('±      ±                    ±'),
(' ±±±±±±                     ±'));
Var x,y:array[1..2,1..n]of Byte;
    xx,yy:array[1..2] of shortint;
    Size,Score,Lives:array[0..2] of Integer;
    LevelX,LevelY:Array[1..500]of byte;
    a,b,c,Qq,Nop,Nop1,NLev,Speed,LevelNumber:Integer;
    Speedup,Xp,Yp,No,Rez,Ef:Byte;
    No2:ShortInt;
    Ch:Char;
Procedure DrawScreen(Const Level:Byte);
Begin
TextBackGround(1);Window(1,1,80,ys);b:=0;
Clrscr;Window(1,1,80,ys+2);TextColor(10);
For a:=1 to 80 do Begin Gotoxy(a,1);Write('Û');Gotoxy(a,ys);Write('Û') End;
For a:=1 to Ys do Begin Gotoxy(1,a);Write('Û');Gotoxy(80,a);Write('Û') End;
TextColor(10);
Case Level of
 0:Begin
   End;
 1:Begin
    b:=1;Levelx[b]:=40;LevelY[b]:=ys div 2 ;gotoxy(40,ys div 2); write('Û')
   End;
 2:Begin gotoxy(19,ys div 2);For a:=19 to 59 Do Begin inc(b);LevelX[b]:=a;Levely[b]:=(ys div 2);Write('Û') End;End;
 3:Begin
   For a:=6 to ys-6 do
     Begin
       Inc(b);Levelx[b]:=26;Levely[b]:=a;Gotoxy(26,a);Write('Û');
       Inc(b);Levelx[b]:=54;Levely[b]:=a;Gotoxy(54,a);Write('Û');
     End;
   End;
 4:Begin
   For a:=10 to ys-10 do
     Begin
       Inc(b);Levelx[b]:=25;Levely[b]:=a;Gotoxy(25,a);Write('Û');
       Inc(b);Levelx[b]:=55;Levely[b]:=a;Gotoxy(55,a);Write('Û');
     End;
   For a:=27 to 53 do
     Begin
       Inc(b);Levelx[b]:=a;Levely[b]:=8;   Gotoxy(a,8);   Write('Û');
       Inc(b);Levelx[b]:=a;Levely[b]:=ys-8;Gotoxy(a,ys-8);Write('Û');
     End;
   End;
 5:Begin
   For a:=4 to ys-3 do
     Begin
       inc(b);LevelX[b]:=a;LevelY[b]:=a;Gotoxy(a,a);Write('Û');
       inc(b);LevelX[b]:=80-a;LevelY[b]:=ys-a+1;Gotoxy(80-a,ys-a+1);Write('Û');
     End;
   End;
 6:Begin
   for a:=1 to 39 do
     Begin
       Inc(b);Levelx[b]:=a*2;Levely[b]:=(ys Div 3);Gotoxy(a*2,ys div 3);Write('Û');
       Inc(b);Levelx[b]:=81-a*2;Levely[b]:=2*(ys Div 3);Gotoxy(81-a*2,(ys div 3)*2);Write('Û');
     End;
   End;
 7:Begin
   x[nop,1]:=76;y[nop,1]:=4;xx[nop]:=0;yy[nop]:=1;
   x[1,1]:=4;y[1,1]:=4;xx[1]:=0;yy[2]:=1;
   For c:=1 to 2 do
   For a:=1 to ys-2 do
     Begin
        inc(b);LevelX[b]:=16*(c*2);LevelY[b]:=a;Gotoxy((c*2)*16,a);Write('Û');
        inc(b);LevelX[b]:=16*(c*2-1);LevelY[b]:=ys-a+1;Gotoxy((c*2-1)*16,ys-a+1);Write('Û');
     End;
   End;
End;
NLev:=b;
End;
Procedure PutPixel;
Begin
  Sound(1000);
  Size[c]:=size[c]+25;
  Score[c]:=score[c]+No;
  TextBackGround(0);
  If nop1=0 then begin Textcolor(12);Gotoxy(3,Ys+2);Write('1st Player : ',Score[1],'    Lives : ',Lives[1],'   ') End;
  If nop=2 then Begin Textcolor(13);Gotoxy(45,Ys+2);Write(Lives[2]:6,' : Lives ',Score[2]:6,' : 2nd Player') End;
  TextBackGround(1);
  No:=no+1;
  Delay(20);
  Nosound;
    If No>9 then
    Begin
      LevelNumber:=LevelNumber+1;
      If Speedup=1 then Begin Speed:=Speed-Cs;if speed<1 then speed:=1 End;
      for c:=1+Nop1 to Nop do for a:=1 to 250 do begin X[c,a]:=0;y[c,a]:=0 End;
      No2:=no2+1;
      No:=1;
      If no2>7 then No2:=0;
      x[nop,1]:=74;y[nop,1]:=4;xx[nop]:=-1;yy[nop]:=0;
      x[1,1]:=6;   y[1,1]:=4;  xx[1]:=1;   yy[1]:=0;
      DrawScreen(No2);
      Textcolor(10);TextBackGround(0);
      Gotoxy(1,Ys+2);Write(' ':78);
      Gotoxy(31,ys+2);Write('Press SPACE to start');Repeat ch:=readkey until ord(ch)=32;
      Gotoxy(31,ys+2);Write('                      ');
      TextColor(12);If Nop1=0 then Begin Gotoxy(3,Ys+2);Write('1st Player : ',Score[1],'    Lives : ',Lives[1],'   ') End;
      TextColor(13);If Nop=2 then Begin Gotoxy(45,Ys+2);Write(Lives[2]:6,' : Lives ',Score[2]:6,' : 2nd Player') End;
      TextBackGround(1);
      Size[1]:=3;Size[2]:=3;
    End;
  While True do
  Begin
    Rez:=0;
    Xp:=Random(78)+2;
    Yp:=Random(ys-2)+2;
    for a:=1+Nop1 to Nop do
    Begin
      for b:=2 to Size[a] do
        If (xp=x[a,b]) and(yp=y[a,b]) then Rez:=1;
    End;
    For a:=1 to NLev do
      If (Xp=Levelx[a]) and (yp=Levely[a]) then Rez:=1;
    if Rez=0 then
    Begin
      Textcolor(15);
      Gotoxy(xp,yp);
      Write(No);
      Break;
    End;
  End;
End;
Procedure LevelReset;
Begin
  if Speedup=1 then Speed:=speed+Cs;
  LevelNumber:=LevelNumber-1;
  Score[c]:=Score[c]-20;
  Lives[c]:=lives[c]-1;
  if Lives[2]<0 then Nop:=1;if Lives[1]<0 then Nop1:=1;
  if (Lives[1]<0) and (Lives[2]<0) Then
  Begin
    DrawScreen(0);Gotoxy(36,ys div 2);Write('Game Over');
    Repeat ch:=readkey until ord(ch)=27;
    TextColor(7);TextBackGround(0);ClrScr;TextMode(lo(LastMode));halt
  End;
  c:=0;
  No:=9;
  No2:=No2-1;
  Putpixel;
End;
Begin
Randomize;
TextMode(C80+Font8x8);
Asm Mov ah,$01;Mov cx,$2000;Int $10; End;
gotoxy(2,ys+2);Write('Write by _______');
Textcolor(10);
for a:=1 to 23 do
Begin
gotoxy(17,(ys-23)div 2+a);
if a=12 then textcolor(8);
write(pic[a]);
End;
while not keypressed do begin End;readkey;
Textbackground(0);
clrscr;
DrawScreen(0);
Gotoxy(20,17);Write('How many players will play [1..2] : ');
Readln(Nop);if Nop<>1 then Nop:=2;
Gotoxy(15,19);Write('Would you like to have a speedup [1-Yes 2-No] : ');
Readln(Speedup);if speedup<>1 then speedup:=2;
Gotoxy(14,21);Write('Do you wana have an endless field [1-Yes 2-No ] : ');
Readln(Ef);if ef<>1 then ef:=2;
Gotoxy(18,23);Write('Pleas enter speed of begining [1..100] : ');
Readln(speed);if Speed<1 then speed:=1;if speed>101 then speed:=101;
Speed:=101 div speed *220;{Spedd Of Game}
x[nop,1]:=6;y[nop,1]:=4;xx[nop]:=1;yy[nop]:=0;Size[nop]:=3;
x[1,1]:=74;y[1,1]:=4;xx[1]:=-1;yy[1]:=0;Size[1]:=3;
Lives[2]:=-1;Lives[1]:=5;if Nop=2 then Lives[2]:=5;
No:=9;No2:=-1;Nop1:=0;Qq:=0;
Putpixel;
While True Do
Begin
  Delay(Speed);
 for a:=1 to 10 do
 begin
  If Keypressed Then
  Begin
    Ch:=readkey;if ord(ch)=0 then begin c:=1;ch:=readkey;End Else c:=Nop;
    Case ord(Upcase(ch)) of
      83,80:if yy[c]<>-1 then Begin yy[c]:= 1;xx[c]:=0;break End;
      87,72:if yy[c]<> 1 then Begin yy[c]:=-1;xx[c]:=0;break End;
      68,77:if xx[c]<>-1 then Begin xx[c]:= 1;yy[c]:=0;break End;
      65,75:if xx[c]<> 1 then Begin xx[c]:=-1;yy[c]:=0;break End;
      27:Begin TextColor(7);TextBackGround(0);ClrScr;TextMode(lo(LastMode));halt End;
    End;
  End;
 End;
  For c:=1+Nop1 to Nop do
  Begin
    x[c,1]:=x[c,1]+xx[c];
    y[c,1]:=y[c,1]+yy[c];
    if (x[c,1]<2) or (x[c,1]>79) or(y[c,1]<2) or(y[c,1]>ys-1) then
    Begin
      if Ef=2 then
      Begin
        LevelReset;
        Break
      End
      Else
      Begin
        If x[c,1]<2 then x[c,1]:=79;
        If x[c,1]>79 then x[c,1]:=2;
        If y[c,1]<2 then y[c,1]:=ys-1;
        If y[c,1]>Ys-1 then y[c,1]:=2;
      End;
    End;
    if (x[c,1]=xp)and(y[c,1]=yp) then PutPixel;
   for a:=1+Nop1 to Nop do
      Begin
        for b:=3 to Size[a] do
          If (x[c,1]=x[a,b]) and(y[c,1]=y[a,b]) then Begin LevelReset;Qq:=1;Break End;
      if Qq=1 then Break;
      End;
   if Qq=1 then Begin Qq:=0;break End;
   For a:=1 to NLev do
      If (X[c,1]=Levelx[a]) and (y[c,1]=Levely[a]) then Begin LevelReset;Qq:=1;Break End;
   if Qq=1 then Begin Qq:=0;break End;
    If x[c,size[c]]<>0 then Begin Gotoxy(x[c,Size[c]],y[c,Size[c]]);Write(' ') End;
    Textcolor(11+c);
    Gotoxy(x[c,1],y[c,1]);
    Write('Û');
    For a:= Size[c] Downto 2 do Begin x[c,a]:=x[c,a-1];y[c,a]:=y[c,a-1] End;
  End;
    if Nop=2 then if (x[1,1]=x[2,1])and(y[1,1]=y[2,1]) then
      Begin Lives[1]:=lives[1]-1;score[1]:=score[1]-20;c:=2;LevelReset End;
End;
End.