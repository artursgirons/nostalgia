Uses Crt,Graph;
Var N,x,y,a,R,Rb:integer;
    AngO,Ang,Rs:real;
Begin
  initgraph(x,y,'');
  R:=100;
  N:=6;
  AngO:=pi/n;
  ang:=pi*2/n;
  Rs:=R/cos(AngO);
  Rb:=Round(Rs*sin(AngO));
  For a:=0 to n-1 do
  Begin
    Setfillstyle(1,Random(14)+1);
    Fillellipse(Round(320+cos(a*Ang)*Rs),Round(240+sin(a*ang)*Rs),Rb,Rb);
  End;
  Setfillstyle(1,14);
  Fillellipse(320,240,R,R);
  readln;
End.