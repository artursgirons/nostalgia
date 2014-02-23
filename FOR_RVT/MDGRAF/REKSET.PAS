Uses Graph,crt;
Var p,x,y,xx,yy:integer;
Begin
  Randomize;
  x:=vga;y:=1;Initgraph(x,y,'');p:=0;
  xx:=Random(3)+1;YY:=Random(3)+1;x:=320;y:=240;
  Setcolor(10);
  setfillstyle(1,2);
  While not keypressed do
  Begin
    p:=1-p;
    SetActivepage(p);
    cleardevice;
    X:=x+xx; y:=y+yy;
    setcolor(10);
    fillellipse(x,y,20,15);
    If (X<20) or (x>620) then Begin x:=x-xx;xx:=-xx div abs(xx)*(random(3)+1);End;
    If (y<20) or (y>330) then Begin y:=y-yy;yy:=-yy div abs(yy)*(random(3)+1);End;
    Setvisualpage(p);
    Delay(800);
  End;
End.