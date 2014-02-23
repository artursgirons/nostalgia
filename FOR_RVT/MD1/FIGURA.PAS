Program Figura;
uses crt;
var x,y:real;
begin
clrscr;
textcolor(10);
Writeln('Programa aprekina piederibu figurai...');
textcolor(7);
write('  '+chr(250)+'Ievadiet X koordinati :');readln(x);
write('  '+chr(250)+'Ievadiet Y koordinati :');readln(y);
textcolor(12);
if ((x<3)and(x>=0)and(y<3)and(y>=0))or((x>-3)and(x<=0)and(y>-3)and(y<=0))or
   ((x>-3)and(y<3)and(x<=0)and(y>=0)and(x>y-3))or
   ((x<3)and(y>-3)and(x>=0)and(y<=0)and(y>x-3)) then
   begin writeln('Punkts atrodas figura.');readkey;textcolor(7);halt end;
if ((x>-3)and(y<3)and(x<=0)and(y>=0)and(x=y-3))or
   ((x<3)and(y>-3)and(x>=0)and(y<=0)and(y=x-3))or
   ((x=3)and(y>=0)and(y<=3))or((y=3)and(x>=0)and(x<=3))or
   ((x=-3)and(y<=0)and(y>=-3))or((y=-3)and(x<=0)and(x>=-3)) then
   begin writeln('Punkts atrodas uz robezas.');readkey;textcolor(7);halt end;
Writeln('Punkts ir arpus figuras.');textcolor(7);readkey;
end.