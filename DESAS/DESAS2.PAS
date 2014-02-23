Program Desas;
uses crt,graph;
const w:array[1..8,1..3]of byte=
((1,2,3),(4,5,6),(7,8,9),(1,4,7),(2,5,8),(3,6,9),(1,5,9),(3,5,7));
var i:array[1..9]of byte;
    s,en,g,r1,r2,a,b,c:byte;
    ch:char;
    k:shortint;
    xg,yg:integer;
label res;
Procedure Draw(const p,t:byte);
var y,x:shortint;
begin
     y:=trunc((p-1)/3)-1;
     x:=p-trunc((p-1)/3)*3-2;
     if t=2 then
     begin
          circle(320+x*100,175+y*80,20);
     end;
     if t=1 then
     begin
          line(320+x*100-15,175+y*80-15,320+x*100+15,175+y*80+15);
          line(320+x*100-15,175+y*80+15,320+x*100+15,175+y*80-15);
     end;
     if t=3 then
     begin
          circle(320+x*100,175+y*80,25);
     end;
end;

procedure GameOver(const p:byte);
begin
delay(1000);
cleardevice;
Settextstyle(6,0,3);
setcolor(10);
if p=3 then outtextxy(230,210,'Uzvareja Draudziba');
if p=1 then outtextxy(250,210,'Uzvareja PC');
if p=2 then  outtextxy(230,210,'Uzvareja Lietotajs');
Settextstyle(4,0,6);
setcolor(12);
outtextxy(160,120,'GAME OVER.');
Settextstyle(6,0,3);
setcolor(12);
readln;
outtextxy(235,230,'Press ESC to quit:');
ch:=readkey;
if ch<>chr(27) then exit;
closegraph;
halt;
end;

Procedure PCput;
var e,e2:byte;
begin
      setcolor(12);
      for a:=1 to 8 do
      begin
           r1:=0;
           r2:=0;
           for b:=1 to 3 do
           begin
                if i[w[a,b]]=1 then r1:=r1+1;
                if i[w[a,b]]=2 then r2:=r2+1;
           end;
           if (r1=2) and (r2=0) then
           begin
                for b:=1 to 3 do
                begin
                     if i[w[a,b]]=0 then
                     begin
                          i[w[a,b]]:=1;
                          Draw(w[a,b],1);
                          GameOver(1);
                          en:=1;
                          exit;
                     end;
                end;
           end;
      end;

      for a:=1 to 8 do
      begin
           r1:=0;
           r2:=0;
           e:=0;
           for b:=1 to 3 do
           begin
                if i[w[a,b]]=1 then r1:=r1+1;
                if i[w[a,b]]=2 then r2:=r2+1;
           end;
           if (r2=2) and (r1=0) then
           begin
                for b:=1 to 3 do
                begin
                     if i[w[a,b]]=0 then
                     begin
                          i[w[a,b]]:=1;
                          Draw(w[a,b],1);
                          e:=1;
                     end;
                end;
           end;
      if e=1 then break;
      end;

      if e=0 then
      begin
           e2:=0;
           for a:=1 to 8 do
           begin
                r1:=0;r2:=0;
                for b:=1 to 3 do
                begin
                     if i[w[a,b]]=1 then r1:=r1+1;
                     if i[w[a,b]]=2 then r2:=r2+1;
                end;
                if (r1=1) and (r2=0) then
                begin
                     for b:=1 to 3 do
                     begin
                          if i[w[a,b]]=0 then
                          begin
                               i[w[a,b]]:=1;
                               draw(w[a,b],1);
                               e2:=1;
                               break;
                          end;
                     end;
                     if e2=1 then break;
                end;
                if e2=1 then break;
           end;
           if e2=0 then
           while true do
           begin
                g:=random(9)+1;
                if i[g]=0 then begin i[g]:=1;draw(g,1);break end;
           end;
      end;

      r1:=0;
      for a:=1 to 9 do if i[a]<>0 then r1:=r1+1;
      if r1=9 then begin GameOver(3);en:=1;exit end;
end;

procedure Screen;
begin
     cleardevice;
     xg:=3;yg:=1;
     setcolor(10);
     line(170,135,470,135);
     line(170,215,470,215);
     line(270,55,270,295);
     line(370,55,370,295);
end;

begin
     randomize;
     initgraph(xg,yg,'');
     res:
     en:=0;
     screen;
     for a:=1 to 9 do i[a]:=0;
     setcolor(7);k:=5;draw(k,3);
     if s=1 then pcput;
     s:=1-s;
     while true do
     begin
          if en=1 then goto res;
          ch:=readkey;
          setcolor(0);
          draw(k,3);
          setcolor(11);
          case ord(ch) of
         77:begin k:=k+1; if k>9 then k:=k-1 end;
         75:begin k:=k-1; if k<1 then k:=k+1 end;
         80:begin k:=k+3; if k>9 then k:=k-3 end;
         72:begin k:=k-3; if k<1 then k:=k+3 end;
         13:begin
              if i[k]=0 then
              begin
                   i[k]:=2;draw(k,2);r1:=0;r2:=0;
                   for a:=1 to 8 do
                   begin
                      r2:=0;
                      for b:=1 to 3 do
                        if i[w[a,b]]=2 then r2:=r2+1;
                      if r2=3 then begin Gameover(2);goto res end;
                   end;
                   for a:=1 to 9 do if i[a]<>0 then r1:=r1+1;
                   if r1=9 then begin GameOver(3);goto res end;

                   r1:=0;Pcput
              end;
            end;
          end;
          setcolor(7);
          draw(k,3);
     end;
end.






