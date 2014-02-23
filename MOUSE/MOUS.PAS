Program mouse;
Uses dos,crt;
Var x1,y1,k,h:Word;
    b1:byte;
Procedure InitMous;var r:registers; begin r.ax:=$01;intr($33,r);End;
Procedure CloseMous;var r:registers; begin r.ax:=$02;intr($33,r);End;
Procedure MousAction(Var x,y:Word;Var b:Byte);
Var x2,y2,b2,b3:word;
    r:registers;
Begin
r.cx:=(x-1)*8;r.dx:=(y-1)*8;
InitMous;
b3:=0;b2:=0;b:=0;
While true Do
Begin
if keypressed then Begin halt end;
 r.ax:=$03;intr($33,r);b:=r.bl;x:=r.cx;y:=r.dx;
 if (b3=1) and (b2=0) Then
 Begin
  x:=x div 8+1;y:=y div 8+1;
  Break;
 End;
 x2:=x;y2:=y;b3:=b2;b2:=b;
 if (b3=1)and(b2=0) then delay(1000);
End;
End;
Begin
Randomize;
Textbackground(0);Clrscr;
Asm mov ah,$01;mov cx,$2000;int $10;End;
Textcolor(10);Gotoxy(69,25);Write('<< Exit >>');
Gotoxy(2,25);Write('<< Fill Screen >>');
Gotoxy(35,25);Write('<< Clear Screen >>');
Initmous;
While true do
Begin
  MousAction(x1,y1,b1);
  If b1=1 Then
  Begin
    If (y1=25)and(x1 in [69..79]) then Begin Closemous;Textcolor(7);Textbackground(0);Clrscr;halt End;
    If (y1=25)and(x1 in [35..51]) then
    Begin Closemous;Window(1,1,80,24);Clrscr;Window(1,1,80,25) End;
    If (y1=25)and(x1 in [2..18]) then
    Begin
      Closemous;Textcolor(8);gotoxy(1,1);
      For k:=1 to 1920 do Begin h:=random(4);if h=3 then h:=219 else h:=h+176;Write(Chr(h))End;
    End;
  End;
End;
End.