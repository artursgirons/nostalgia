Program Labirint_And_Cameras_Prakse;
Uses Graph,Crt,dos;
Const N=37;n2=1;
      Cam:Array[1..n,1..5]of Integer=(
      (3,3,35*n2,+1,0*n2),
      (399,300,126*n2,+1,91*n2),
      (150,149,270*n2,+1,235*n2),
      (3,300,-54*n2,+1,-89),
      (600,400,126*n2,+1,91*n2),
      (400,3,35*n2,+1,0),
      (49,204,35*n2,+1,0),
      (404,99,325*n2,-1,360*n2),
      (53,98,216*n2,+1,181*n2),
      (250,403,35*n2,+1,0),
      (155,154,35*n2,+1,0),
      (300,149,216*n2,+1,181*n2),
      (200,3,55*n2,-1,90*n2),
      (249,198,216*n2,+1,181*n2),
      (103,199,216*n2,+1,181*n2),
      (304,54,35*n2,+1,0),
      (253,204,-54*n2,+1,-89*n2),
      (299,49,325*n2,-1,360*n2),
      (398,104,35*n2,+1,0),
      (550,54,35*n2,+1,0),
      (599,199,216*n2,+1,181*n2),
      (454,254,54*n2,-1,89*n2),
      (553,254,-54*n2,+1,-89*n2),
      (499,404,35*n2,+1,0),
      (499,304,126*n2,+1,91*n2),
      (403,300,55*n2,-1,89*n2),
      (399,204,35*n2,+1,0),
      (103,3,35*n2,+1,0*n2),
      (303,154,35*n2,+1,0),
      (299,304,35*n2,+1,0),
      (249,354,35*n2,+1,0),
      (150,354,35*n2,+1,0),
      (149,449,216*n2,+1,181*n2),
      (150,299,216*n2,+1,181*n2),
      (499,149,125*n2,+1,91*n2),
      (500,3,35*n2,+1,0),
      (53,350,56*n2,-1,89*n2));
Var M:array[-100..452*n2]of Record x,y:integer End;
    n3,X,Y,A:integer;

Procedure DrawLab;
Begin
  ClearDevice;
  SetColor(2);
For x:=0 to 2 do
For y:=0 to 2 do
Begin
  SetViewPort(18+x,13+y,618+x,463+y,True);
  Rectangle(0,0,600,450);
  Moveto(600,50);
    lineto(500,50);lineto(500,100);lineto(400,100);lineto(400,50);lineto(300,50);lineto(300,100);
    lineto(250,100);lineto(250,50);lineto(200,50);lineto(200,150);lineto(150,150);lineto(150,250);
  Moveto(150,150);
    lineto(100,150);lineto(100,50);lineto(50,50);
  Moveto(0,100);
    Lineto(50,100);Lineto(50,200);Lineto(100,200);Lineto(100,300);Lineto(200,300);Lineto(200,200);
    Lineto(250,200);Lineto(250,150);Lineto(400,150);Lineto(400,200);Lineto(500,200);
    Lineto(500,150);Lineto(550,150);Lineto(550,100);
 Line(150,0,150,100);Line(450,0,450,50);Line(450,0,450,50);Line(350,150,350,100);Line(450,100,450,150);
  Moveto(600,200);lineto(550,200);lineto(550,250);lineto(500,250);
  Moveto(450,200);lineto(450,300);lineto(550,300);
  Moveto(500,300);lineto(500,400);lineto(550,400);
 Line(550,350,600,350);
  Moveto(450,450);lineto(450,350);lineto(400,350);lineto(400,250);lineto(350,250);lineto(350,200);
 Line(300,150,300,300);line(300,300,350,300);
  Moveto(400,450);lineto(400,400);lineto(350,400);lineto(350,350);lineto(250,350);lineto(250,250);
 Line(200,300,200,400);Line(200,400,300,400);
 Line(200,350,100,350);Line(100,350,100,400);
 Line(150,450,150,400);
 Line(50,450,50,250);
End;
SetViewPort(18,13,620,465,True);
setfillstyle(1,10);
Bar(4,425,48,448);
setcolor(0);
outtextxy(12,435,'EXIT');
End;

Procedure CameraTurn;
var Temp:integer;
Begin
  For a:=1 to n3 do
  Begin
    cam[a,3]:=cam[a,3]+cam[a,4];
    cam[a,5]:=cam[a,5]+cam[a,4];
    if getpixel(cam[a,1]+m[cam[a,3]+n2*(cam[a,4]div abs(cam[a,4]))].x,cam[a,2]+m[cam[a,3]+n2*(cam[a,4]div abs(cam[a,4]))].y)=2
    then
    Begin
      cam[a,4]:=-cam[a,4];
      cam[a,3]:=cam[a,3]+cam[a,4];
      temp:=cam[a,5];
      cam[a,5]:=cam[a,3];
      cam[a,3]:=temp+(cam[a,4]div abs(cam[a,4]));
    End;
    Setcolor(14);
    line(Cam[a,1],cam[a,2],cam[a,1]+m[cam[a,3]].x,cam[a,2]+m[cam[a,3]].y);
    line(Cam[a,1],cam[a,2],cam[a,1]+m[cam[a,3]].x+1,cam[a,2]+m[cam[a,3]].y);
    Setcolor(0);
    line(Cam[a,1],cam[a,2],cam[a,1]+m[cam[a,5]].x,cam[a,2]+m[cam[a,5]].y);
    line(Cam[a,1],cam[a,2],cam[a,1]+m[cam[a,5]].x+1,cam[a,2]+m[cam[a,5]].y);
  End;
End;

Procedure Move;
Var ch:Char;
    xx,yy,x1,y1,a,b:Integer;
    ms:Word;
Begin
  x1:=575;y1:=25;xx:=0;yy:=0;
  While true do
  Begin
    if keypressed then
    Begin
      ch:=readkey;
      if ord(ch)=0 then ch:=readkey;
      case ord(ch) of
        27:Begin Closegraph;Halt End;
        80:Begin yy:=+2;xx:=0 End;
        72:Begin yy:=-2;xx:=0 End;
        77:Begin xx:=+2;yy:=0 End;
        75:Begin xx:=-2;yy:=0 End;
        32:Begin xx:=0;yy:=0 End;
      end;
    End;
    ms:=ms+1;
    delay(150);
      if (ms>=5) then
      Begin
      ms:=0;
      setcolor(0);
      rectangle(x1,y1,x1+2,y1+2);
      x1:=x1+xx;y1:=y1+yy;
      if (getpixel(x1+xx,y1+yy)=2)or(getpixel(x1+xx+2,y1+yy+2)=2)then Begin x1:=x1-xx;y1:=y1-yy;xx:=0;yy:=0 end;
      setcolor(12);
      rectangle(x1,y1,x1+2,y1+2);
      End;
        for a:=0 to 2 do
        for b:=0 to 2 do if Getpixel(x1+a,y1+b)=14 then
          Begin setcolor(0); for x:=0 to 456 do Begin line(0,x,605,x);delay(50) End;
          Setcolor(12);outtextxy(160,225,'U have been spoted.<Press ENTER>');readln;halt end;
        If(getpixel(x1+1,y1+3)=10)then
          Begin setcolor(0);for x:=0 to 456 do Begin line(0,x,605,x);delay(50) End;
          setcolor(10);Outtextxy(170,225,'Congratulations <Press ENTET>');Readln;Closegraph;halt End;
      Cameraturn;
  End;
End;

Procedure InitCam;
Begin
  for x:=-100 to (452*n2) do
  Begin
    M[x].x:=round(Cos((Pi*2)/(360*n2)*x)*45);
    M[x].y:=round(Sin((Pi*2)/(360*n2)*x)*45);
  End;
End;

Begin
  Write('Ievadiet kameru skaitu (1-37):');readln(n3);
  if (n3<1)or(n3>37) then n3:=18;
  InitGraph(x,y,'');
  DrawLab;
  InitCam;
  Move;
  CloseGraph;
End.