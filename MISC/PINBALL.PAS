Program PinBall;
Uses Crt,Graph;
Var xx1,xx2,yy1,yy2,xx3,_Sin,_Cos:extended;
    x1,x2,y1,y2:extended;
    e,r:integer;
Begin
  Initgraph(r,e,'');
  x2:=391;
  y2:=240;
  x1:=320;
  y1:=100;
    xx2:=0;
    yy2:=0;
    xx1:=50;
    yy1:=100;
  While not keypressed do
  Begin
    If ((sqr(x1-x2)+sqr(y1-y2))<1600) then
    Begin
      x1:=x1-xx1/90;
      y1:=y1-yy1/90;
          _Sin:=(y2-y1)/sqrt((Sqr(y2-y1)+Sqr(x1-x2)));
          _Cos:=(x1-x2)/sqrt((Sqr(y2-y1)+Sqr(x1-x2)));
      xx3:=xx1;
      xx1:=-xx1*_Cos-xx2*_Cos+_cos*yy1;
      yy1:=-yy1*_Sin+yy2*_Sin+_sin*xx3;
    End;
    x1:=x1+ xx1/100;
    y1:=y1+ yy1/100;
    cleardevice;
    Circle(Round(x2),Round(y2),20);
    Circle(Round(x1),Round(y1),20);
    delay(1000);
  End;
  CloseGraph;
End.