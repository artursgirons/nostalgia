Program Snake_in_text;
uses crt,dos;
const Up   =chr(72);
      Down =chr(80);
      Left =chr(75);
      Right=chr(77);
      Esc  =chr(27);
var x,y:array[1..1000]of byte;
    g,u,p,p2,score,level,speed,mode:word;
    xx,yy:shortint;
    xp,yp:byte;
    k:boolean;
procedure Screen;
 var r:registers;
     a:byte;
begin
mode:=lastmode;textmode(C80+Font8x8);
r.ah:=$01;r.cx:=$2000;intr($10,r);
for a:= 1 to 80 do begin Gotoxy(a,2);write(chr(205));Gotoxy(a,42);Write(chr(205)) end;
for a:= 2 to 42 do begin Gotoxy(1,a);write(chr(186));Gotoxy(80,a);Write(chr(186)) end;
gotoxy(1,2);write(chr(201));gotoxy(80,2);write(chr(187));gotoxy(1,42);write(chr(200));gotoxy(80,42);write(chr(188));
gotoxy(1,1);Write('Score :');
x[1]:=5;y[1]:=5;xx:=1;yy:=0;score:=0;p:=1;p2:=1;xp:=20;yp:=20;gotoxy(8,1);write(0);textcolor(12);gotoxy(xp,yp);write(p);g:=11;
textcolor(2);
end;
Procedure Key;
 var ch:char;
begin
ch:=readkey;ch:=readkey;
case ch of
  Left :if xx=0 then begin yy:=0;xx:=-1 end;
  Right:if xx=0 then begin yy:=0;xx:=1  end;
  Up   :if yy=0 then begin xx:=0;yy:=-1 end;
  Down :if yy=0 then begin xx:=0;yy:=1  end;
  Esc  :halt;
end;
end;
begin
randomize;
 screen;
While true do
begin
 If keypressed then key;
 x[1]:=x[1]+xx;y[1]:=y[1]+yy;
 If (x[1]<2)or(x[1]>79)or(y[1]<3)or(y[1]>41) then halt;
 If (x[1]=xp)and(y[1]=yp) then
 begin
    if p=9 then halt;
    Repeat xp:=random(77)+2;for u:=1 to p2 do if xp<>x[u] then k:=true else k:=false until k;
    Repeat yp:=random(38)+3;for u:=1 to p2 do if yp<>y[u] then k:=true else k:=false  until k;
    textcolor(7);g:=10;score:=score+p;gotoxy(8,1);write(score);
    p:=p+1;Textcolor(12);Gotoxy(xp,yp);write(p);p2:=p*10;
    textcolor(2);
 end;
 gotoxy(x[1],y[1]);Write(chr(219));
 delay(100);
 For u:=p2 downto 2 do
 begin
    if (x[1]=x[u])and(y[1]=y[u])then halt;
    x[u]:=x[u-1];y[u]:=y[u-1];if g<(p2+1)*10 then g:=g+1;
 end;
 if g>=(p2-1)*10 then begin gotoxy(x[p2],y[p2]);Write(' ') end;
end;
end.



