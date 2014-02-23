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
          circle(320+x*100,175+y*80,38);
     end;
     if t=1 then
     begin
          line(320+x*100-25,175+y*80-25,320+x*100+25,175+y*80+25);
          line(320+x*100-25,175+y*80+25,320+x*100+25,175+y*80-25);
     end;
     if t=3 then
     begin
          circle(320+x*100,175+y*80,42);
     end;
end;

procedure GameOver(const p:byte);
begin
setcolor(2);
if p=3 then outtextxy(250,320,'Uzvareja Draudziba');
if p=1 then outtextxy(270,320,'Uzvareja Krusti');
if p=2 then  outtextxy(250,320,'Uzvareja Nulles');
outtextxy(260,20,'Partijas beigas');
setcolor(12);
delay(2000);
exit;
end;
Procedure PCput(const v1,v2:byte);
var e,e2:byte;
begin
      setcolor(8+v1*2);
      for a:=1 to 8 do
      begin
           r1:=0;
           r2:=0;
           for b:=1 to 3 do
           begin
                if i[w[a,b]]=v1 then r1:=r1+1;
                if i[w[a,b]]=v2 then r2:=r2+1;
           end;
           if (r1=2) and (r2=0) then
           begin
                for b:=1 to 3 do
                begin
                     if i[w[a,b]]=0 then
                     begin
                          i[w[a,b]]:=v1;
                          Draw(w[a,b],v1);
                          GameOver(v1);
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
                if i[w[a,b]]=v1 then r1:=r1+1;
                if i[w[a,b]]=v2 then r2:=r2+1;
           end;
           if (r2=2) and (r1=0) then
           begin
                for b:=1 to 3 do
                begin
                     if i[w[a,b]]=0 then
                     begin
                          i[w[a,b]]:=v1;
                          Draw(w[a,b],v1);
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
                     if i[w[a,b]]=v1 then r1:=r1+1;
                     if i[w[a,b]]=v2 then r2:=r2+1;
                end;
                if (r1=1) and (r2=0) then
                begin
                     for b:=1 to 3 do
                     begin
                          if i[w[a,b]]=0 then
                          begin
                               i[w[a,b]]:=v1;
                               draw(w[a,b],v1);
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
                if i[g]=0 then begin i[g]:=v1;draw(g,v1);break end;
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
     setcolor(11);
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
     delay(100);
     for a:=1 to 9 do i[a]:=0;
     setcolor(12);
     if s=1 then begin Pcput(1,2) end;
     delay(100);
     s:=1-s;
     while true do
     begin
          pcput(2,1);
          if en=1 then goto res;
          delay(100);
          pcput(1,2);
           if keypressed then
           begin
           ch:=readkey;
           if ch = char(27) then begin closegraph;halt end;
           end;
          if en=1 then goto res;
          delay(100);
     end;
end.






