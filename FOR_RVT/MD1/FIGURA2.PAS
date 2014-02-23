Program Figura;
uses crt,graph;
var x,y:real;
    xg,yg:integer;
procedure Pic;
begin
 xg:=3;yg:=1;
 initgraph(xg,yg,'');
 setcolor(15);
 outtextxy(325,45,'+3');outtextxy(325,295,'-3');outtextxy(490,165,'+3');outtextxy(142,165,'-3');
 setcolor(7);
 line(320,20,325,29);line(615,175,606,172);
 line(320,20,315,29);line(615,175,606,178);
 line(320,20,320,330);line(25,175,615,175);
 setcolor(12);moveto(320,55);
 linerel(+168,0);linerel(0,+120);linerel(-168,+120);
 linerel(-168,0);linerel(0,-120);linerel(+168,-120);
 setfillstyle(10,2);
 FloodFill(322, 177, 12);
 readkey;
 closegraph;
end;
begin
pic;
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