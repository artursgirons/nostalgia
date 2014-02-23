{$N+}
Program Baiga_Formula;
Uses Crt;
Var a1,a2:Real;
    t:Real;
    a:integer;
Function Fac(Const b:Integer):Word;
Var d,e:Word; Begin e:=1; For d:=2 to b do e:=e*d; Fac:=e; End;
Begin
  ClrScr;
  Textcolor(10);
  Writeln('<< Programma, kas aprekina dotas funkcijas vertibu >>':65);
  Textcolor(7);
  t:=3;a2:=0;
  Gotoxy(1,3);
  Repeat
    a2:=a2+(Fac(Round(Sqr(t)))/exp(Fac(Round(t))+Ln(2)));
    Writeln(t:48:1,' ³ ',(Fac(Round(Sqr(t)))/exp(Fac(Round(t))+Ln(2))):1:12);
    t:=t+1.2;
  Until t>7;
  gotoxy(1,3);
  a1:=1;t:=10;
  Repeat
    a1:=a1*(Sqrt(t)/Fac(round(T+2)));
    Writeln(t:13:1,' ³ ',(Sqrt(t)/Fac(round(T+2)) ):1:12);
    t:=t-0.8;
  Until t<3;
  Textcolor(10);
  For a:=3 to 11 do begin Gotoxy(15,a);Write('³');Gotoxy(50,a);Write('³') end;
  For a:=1 to 21 do begin Gotoxy(9+a,12);Write('Ä');Gotoxy(45+a,12);Write('Ä'); end;
  Gotoxy(15,12);Write('Á');Gotoxy(50,12);Write('Á');
  Gotoxy(1,13);
  Textcolor(15);
  Writeln(a1:30:12,a2:36:12);
  Gotoxy(1,17);
  Textcolor(10);
  Writeln('Beigu Rezultats : ':40,(a1+a2):1:12);
End.