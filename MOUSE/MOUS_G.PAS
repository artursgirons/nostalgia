Program mouse;
Uses dos,crt,graph;
Var x1,y1,yy,xx,k,h:Word;
    b1:byte;
    xg,yg:integer;
    s:String;
Procedure InitMous;var r:registers; begin r.ax:=$01;intr($33,r);End;
Procedure CloseMous;var r:registers; begin r.ax:=$02;intr($33,r);End;
Procedure MousAction(Var x,y:Word;Var b:Byte);
Var x2,y2,b2,b3:word;
    r:registers;
Begin
{r.ax:=$04;}r.cx:=x;r.dx:=y;{intr($33,r);}
Initmous;
b3:=0;b2:=0;b:=0;
While true Do
Begin
 r.ax:=$03;intr($33,r);b:=r.bl;x:=r.cx;y:=r.dx;
 if ((b=0) and (k=1))or (k=2) then Begin b:=10;k:=0;Closemous;break end;
 if ((b3=1) and (b2=0))or ((b2=2)and(b=2))or(b=4) Then
 Begin
  closeMous;
  Break;
 End;
 x2:=x;y2:=y;b3:=b2;b2:=b;
 if (b3=1)and(b2=0) then delay(100);
End;
End;
Begin
initgraph(xg,yg,'');
Setcolor(10);Rectangle(0,0,639,479);
Setfillstyle(1,2);
Initmous;
While true do
Begin
  MousAction(x1,y1,b1);
  if b1=10 then Begin xx:=0;yy:=0;end;
  if b1=2 then
  begin
    if (xx=0)and(yy=0) then Begin xx:=x1;yy:=y1 end;
    Setcolor(10);
    line(xx,yy,x1,y1);
    xx:=x1;
    yy:=y1;
    k:=1;
  End;
  if b1=0 then floodfill(x1,y1,10);
  if b1=4 then Begin closegraph;halt;End;
End;
End.