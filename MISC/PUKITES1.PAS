Uses Crt,Graph;
Var N,a,R,Rb:integer;
    AngO,Rs:real;
Begin
  Randomize;
  Write('Lapu Skaits :');Readln(N);If n<3 then n:=3;
  Write('Pukes Centra Radius:');Readln(R);If R<1 then n:=1;
  initgraph(a,Rb,'');Delay(1000);
  AngO:=pi/n;
  Rs:=R/cos(AngO);
  Rb:=Round(Rs*sin(AngO));
  For a:=0 to n-1 do
  Begin
    Setfillstyle(1,Random(14)+1);
    Fillellipse(Round(320+cos(a*AngO*2)*Rs),Round(240+sin(a*angO*2)*Rs),Rb,Rb);
  End;
  Setfillstyle(1,random(2)*8+6);
  Fillellipse(320,240,R,R);
  Readkey;
End.