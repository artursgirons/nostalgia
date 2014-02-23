uses crt,graph;
var P:array[1..9]of pointer;
    Oga,title:pointer;
    g,nl,y2,x2,tt,xd,yd,dx,dy,n,X,Y,a,b:integer;
    sizey,sizex:array[1..8]of byte;
    lab:array[1..8,1..35,1..45]of byte;
    F:file;
    ch:char;
    s:string;
Label Fall;
Procedure close_all;
Begin
for a:=1 to 9 do
freemem(p[a],86);
freemem(oga,63);
Cleardevice;
Setcolor(2);
Outtextxy(260,170,'Write by _______');
repeat ch:=readkey until ord(ch)in [27,13];
closegraph;
Delay(1000);
Halt;
End;
Procedure L_or_R;
Begin
ch:=readkey;if ord(ch)=0 then ch:=readkey;
bar(x+dx,y+dy,x+dx+10,y+dy+7);
Case ord(ch)of
77:For a:= xd downto 1 do
     If (lab[n,((y+7) div 10),(x+10+a)div 14]<>48 )and(lab[n,(y div 10),(x+10+a)div 14]<>48 )Then Begin x:=x+a;Break end;
75:For a:= xd downto 1 do
     If (lab[n,((y+7) div 10),(x-a)div 14]<>48 )and(lab[n,(y div 10),(x-a)div 14]<>48 )Then Begin x:=x-a;break End;
72:if (tt<33)and(lab[n,((y-2) div 10),((x+10) div 14)]<>48)and(lab[n,((y-2) div 10),(x div 14)]<>48) then y:=y-2;
27:close_all;
End;
a:=1;
Putimage(x+dx,y+dy,oga^,0);
End;
Procedure GetLab;
var fb:file of byte;
Begin
assign(fb,'c:\tp\programs.pas\quest\labirint.dat');
reset(fb);
a:=0;b:=0;n:=1;
While not eof(fb) do
Begin
  inc(a);
  b := 0;
  While not eof(fb) do
  Begin
    inc(b);
    Read(fb,lab[n,a,b]);
    if Eof(fb) then break;
    if lab[n,a,b]=2 then Begin read(fb,lab[n,a,b]);read(fb,lab[n,a,b]);sizey[n]:=a;a:=0;b:=0;inc(n);break End;
    if lab[n,a,b]=13 then Begin read(fb,lab[n,a,b]); sizex[n]:=b-1;Break End;
  End;
End;
close(fb);
End;
Begin
assign(f,'c:\tp\programs.pas\quest\kiegeli.dat');reset(f,1);
for n:=1 to 9 do Begin getmem(p[n],86);blockread(f,p[n]^,86); End;
getmem(oga,62); blockread(f,oga^,62);
getmem(title,32134); blockread(f,title^,32134);
close(f);
x:=3;y:=1;initgraph(x,y,'');
Putimage(195,50,title^,0);Freemem(title,32134);
Getlab;
Setcolor(10);outtextxy(280,341,'Press ENTER...');
repeat ch:=readkey;if ord(ch)=0 then ch:=readkey until ord(ch)=13;
setcolor(15);
for n:=1 to 8 do
Begin
cleardevice;
dx:=(640-sizex[n]*14)div 2-14;dy:=(350-sizey[n]*10)div 2-10;
s:='';str(n,s);s:='It is level number '+s+'.';outtextxy(239,dy-3,s);
for y:=1 to sizey[n] do
  for x:=1 to sizex[n] do
  Begin
    if lab[n,y,x]=48 then putimage(x*14+dx,y*10+dy,p[n]^,0);
    if lab[n,y,x]=11 then putimage(x*14+dx,y*10+dy,p[9]^,0);
    Delay(100);
    if keypressed then Begin ch:=readkey; if ord(ch)=0 then readkey;End;
  End;
x:=2*14;y:=2*10+2;nl:=0;
yd:=3;xd:=4;
putimage(x+dx,y+dy,oga^,0);
setfillstyle(1,0);
if lab[n,(y+7+1)div 10,x div 14]<>48 then goto fall;
While true do
Begin
  ch:=readkey;if ord(ch)=0 then ch:=readkey;
  bar(x+dx,y+dy,x+dx+10,y+dy+7);
  Case ord(ch)of
    77:Begin For a:= xd downto 1 do
         If (lab[n,((y+7) div 10),(x+10+a)div 14]<>48 )and(lab[n,(y div 10),(x+10+a)div 14]<>48 )Then Begin x:=x+a;Break end;
         if lab[n,(y+7+1)div 10,x div 14]<>48 then goto fall;
         End;
    75:Begin For a:= xd downto 1 do
         If (lab[n,((y+7) div 10),(x-a)div 14]<>48 )and(lab[n,(y div 10),(x-a)div 14]<>48 )Then Begin x:=x-a;break End;
         if lab[n,(y+7+1)div 10,x div 14]<>48 then goto fall;
         End;
    72:
    Begin
      a:=1;tt:=0;
      While (tt<33)and(lab[n,((y-a) div 10),((x+10) div 14)]<>48)and(lab[n,((y-a) div 10),(x div 14)]<>48) do
      Begin
        inc(tt);
        bar(x+dx,y+dy,x+dx+10,y+dy+7);
        dec(y);
        Putimage(x+dx,y+dy,oga^,0);
        If (lab[n,y div 10,(x+10) div 14]=11)or(lab[n,(y+7) div 10,x div 14]=11)or(lab[n,y div 10,x div 14]=11) Then
        Begin nl:=1;Break End;
        for g :=1 to 20 do
        Begin
        Delay(30);
        if keypressed then Begin l_or_R;Break; End;
        End;
      End;
      if nl=1 then break;
Fall:
      a:=1;tt:=33;
      While (lab[n,((y+7+a) div 10),((x+10) div 14)]<>48)and(lab[n,((y+7+a) div 10),(x div 14)]<>48) do
      Begin
        bar(x+dx,y+dy,x+dx+10,y+dy+7);
        inc(y);
        Putimage(x+dx,y+dy,oga^,0);
        If (lab[n,y div 10,(x+10) div 14]=11)or(lab[n,(y+7) div 10,x div 14]=11)or(lab[n,y div 10,x div 14]=11) Then
        Begin nl:=1;Break End;
        for g :=1 to 20 do
        Begin
        Delay(30);
        if keypressed then Begin l_or_R;Break; End;
        End;
      End;
      if nl=1 then break;
    End;
    27:close_all;
  End;
  if nl=1 then break;
  putimage(x+dx,y+dy,oga^,0);
  If (lab[n,y div 10,(x+10) div 14]=11)or(lab[n,(y+7) div 10,x div 14]=11)or(lab[n,y div 10,x div 14]=11) Then break;
End;
End;
Cleardevice;
setcolor(10);
Outtextxy(70,175,'Congratulations! You have compleated the quest of Strawberry.');
repeat ch:=readkey until ord(ch)in [27,13];
Close_all;
end.