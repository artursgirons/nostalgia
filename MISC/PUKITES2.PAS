Uses Crt,Graph;
Var N,x,y,a,R,Rb:integer;
    AngO,Ang,Rs:real;
Begin
  Randomize;
  initgraph(x,y,'');
  While not keypressed do
  Begin
    Setfillstyle(1,Random(14)+1);
    x:=random(600)+20;
    y:=random(440)+20;
    R:=Random(40)+10;
    N:=Random(30)+3;
    AngO:=pi/n;
    ang:=pi*2/n;
    Rs:=R/cos(AngO);
    Rb:=Round(Rs*sin(AngO));
    For a:=0 to n-1 do
    Begin
      Fillellipse(Round(x+cos(a*Ang)*Rs),Round(y+sin(a*ang)*Rs),Rb,Rb);
    End;
    Setfillstyle(1,random(2)*8+6);
    Fillellipse(x,y,R,R);
  End;
  readln;
End.