Program Prakse_Grafiki;
Uses Graph,Crt;
Var Xo1,Xo2,Xm:Real;
    y1,y2,x1,x2,a,b:Integer;
    f1:Boolean;

Function yf1:real;
Begin
  Yf1:=-sin(Xm)*cos(Xm)*3/2*(640/(xo2-xo1));
End;

Function yf2:real;
Begin
  If round(Xm*(640/(xo2-xo1)))=0 then yf2:=0 Else
  Yf2:=-Abs((0.3*Xm-(Xm/abs(Xm))*Exp(0.2*ln(Abs(Xm)))-sqr(Xm/5))*(640/(xo2-xo1)));
End;

Procedure Fill;
Begin
  x2:=a;
  Setcolor(2);
  for b:=x1 to x2 do
  Begin
    Xm:=Xo1+b/(640/(Xo2-Xo1));
    Moveto(b,240+Round(Yf1));
    Lineto(b,round(yf2)+240);
  End;
  x1:=x2;
End;

Procedure Initvalue;
Begin
  Xm:=Xo1+0/(640/(Xo2-Xo1));
  Y1:=Round(Yf1);
  Y2:=Round(Yf2)
End;

Begin
  Clrscr;
  Write('Ievadiet sakuma vertibu: ');Readln(Xo1);
  Write('Ievadiet beigu vertibu : ');Readln(Xo2);
  If Xo1=Xo2 then Halt;
  Initgraph(y1,y2,'');
  If Xo2<Xo1 then Begin Xm:=Xo2;Xo2:=Xo1;Xo1:=Xm End;
  Setcolor(8);
  For a:=1 to 640 do
  Begin
    Xm:=(Xo1+a/(640/(Xo2-Xo1)))*(640/(xo2-xo1));If frac(round(Xm)/round(640/(xo2-xo1)))=0 then line(a,0,a,480);
  End;
  For a:=-240 to 240 do if frac(a/round(640/(xo2-xo1)))=0 then line(0,a+240,640,a+240);
  Setcolor(15);
  Line(0,0,0,480);line(0,0,2,6);outtextxy(7,0,'x');
  Line(0,240,640,240);line(639,240,633,238);line(639,240,633,242);outtextxy(630,243,'y');
  Initvalue;
  For a:=0 to 640 do
  Begin
    Xm:=Xo1+a/(640/(Xo2-Xo1));
    Y1:=Round(yf1/3);
    Y2:=Round(yf2/3);
    If (y1=y2) then if not f1 then Begin f1:=true;x1:=a End else fill;
  End;
  Initvalue;
  Setcolor(10);
  For a:=0 to 640 do
  Begin
    Xm:=Xo1+a/(640/(Xo2-Xo1));
    Moveto(a,y1+240);
    Y1:=Round(Yf1);
    Lineto(a,y1+240);
    Moveto(a,y2+240);
    Y2:=Round(yf2);
    Lineto(a,y2+240);
  End;
  Readln;
End.
