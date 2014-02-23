Program TETRIS_2002;
uses crt,dos;
const F:array[1..42,1..4,1..5]of byte=
      (((2,5,8,9,9),(4,5,6,7,7),(1,2,5,8,8),(3,4,5,6,6)),
      ((2,5,8,7,7),(1,4,5,6,6),(2,3,5,8,8),(4,5,6,9,9)),
      ((2,4,5,6,6),(2,5,6,8,8),(4,5,6,8,8),(2,4,5,8,8)),
      ((1,2,5,6,6),(3,5,6,8,8),(1,2,5,6,6),(3,5,6,8,8)),
      ((2,3,4,5,5),(2,5,6,9,9),(2,3,4,5,5),(2,5,6,9,9)),
      ((4,5,6,6,6),(2,5,8,8,8),(4,5,6,6,6),(2,5,8,8,8)),
      ((2,5,6,6,6),(5,6,8,8,8),(4,5,8,8,8),(2,4,5,5,5)),
      ((4,5,7,8,8),(4,5,7,8,8),(4,5,7,8,8),(4,5,7,8,8)),
      ((3,5,6,7,8),(1,4,5,8,9),(2,3,4,5,7),(1,2,5,6,9)),
      ((1,2,4,5,6),(2,3,5,6,8),(4,5,6,8,9),(2,4,5,7,8)),
      ((2,5,7,8,9),(1,4,5,6,7),(1,2,3,5,8),(3,4,5,6,9)),
      ((1,2,3,4,7),(1,4,7,8,9),(3,6,7,8,9),(1,2,3,6,9)),
      ((1,3,4,5,6),(1,2,5,7,8),(4,5,6,7,9),(2,3,5,8,9)),
      ((2,4,5,6,8),(2,4,5,6,8),(2,4,5,6,8),(2,4,5,6,8)),
      ((1,2,5,6,8),(2,4,5,6,7),(2,4,5,8,9),(3,4,5,6,8)),
      ((2,3,4,5,8),(2,4,5,6,9),(2,5,6,7,8),(1,4,5,6,8)),
      ((2,3,5,7,8),(1,4,5,6,9),(2,3,5,7,8),(1,4,5,6,9)),
      ((4,5,6,7,8),(2,5,6,8,9),(2,3,4,5,6),(1,2,4,5,8)),
      ((1,2,5,8,9),(3,4,5,6,7),(1,2,5,8,9),(3,4,5,6,7)),
{}    ((1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9)),
      ((1,3,5,8,8),(1,5,6,7,7),(2,5,7,9,9),(3,4,5,9,9)),
      ((1,2,3,4,8),(1,4,6,7,8),(2,6,7,8,9),(2,3,4,6,9)),
      ((1,2,3,6,8),(1,2,4,6,7),(2,4,7,8,9),(3,4,6,8,9)),
      ((1,3,4,6,8),(1,2,6,7,8),(2,4,6,7,9),(2,3,4,8,9)),
      ((1,2,3,5,9),(1,3,4,5,7),(1,5,7,8,9),(3,5,6,7,9)),
      ((1,2,3,5,7),(1,4,5,7,9),(3,5,7,8,9),(1,3,5,6,9)),
      ((1,3,5,6,7),(1,2,5,7,9),(3,4,5,7,9),(1,3,5,8,9)),
      ((1,3,4,5,9),(1,3,5,7,8),(1,5,6,7,9),(2,3,5,7,9)),
      ((1,3,5,6,8),(1,2,5,6,7),(2,4,5,7,9),(3,4,5,8,9)),
      ((1,3,4,5,8),(1,5,6,7,8),(2,5,6,7,9),(2,3,4,5,9)),
      ((1,2,6,8,9),(2,3,4,6,7),(1,2,4,8,9),(3,4,6,7,8)),
      ((2,3,4,7,8),(1,4,6,8,9),(2,3,6,7,8),(1,2,4,6,9)),
      ((4,6,7,8,8),(2,6,8,9,9),(2,3,4,6,6),(1,2,4,8,8)),
      ((4,6,8,9,9),(2,3,6,8,8),(1,2,4,6,6),(2,4,7,8,8)),
      ((1,3,5,7,7),(1,5,7,9,9),(3,5,7,9,9),(1,3,5,9,9)),
      ((1,2,4,5,9),(3,4,5,7,8),(1,5,6,8,9),(2,3,5,6,7)),
      ((3,4,6,8,8),(1,2,6,8,8),(2,4,6,7,7),(2,4,8,9,9)),
      ((1,4,6,8,8),(2,6,7,8,8),(2,4,6,9,9),(2,3,4,8,8)),
      ((1,5,9,9,9),(3,5,7,7,7),(1,5,9,9,9),(3,5,7,7,7)),
      ((2,4,6,6,6),(2,4,8,8,8),(4,6,8,8,8),(2,6,8,8,8)),
      ((3,5,6,7,7),(1,2,5,9,9),(3,4,5,7,7),(1,5,8,9,9)),
      ((1,4,5,9,9),(3,5,7,8,8),(1,5,6,9,9),(2,3,5,7,7)));
      Fl:array[1..9]of shortint=(-30,-29,-28,-1,0,1,28,29,30);
       ES=chr(27);
       ri=chr(77);
       ro=chr(72);
       ro2=chr(32);
       le=chr(75);
       dr=chr(80);
pic2:array[0..5]of string[29]=
('   ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ  Û  ÛÛ',
'    Û±±Û±±± Û±±Û  Û Û±Û ±±',
'    Û± ÛÛ   Û± ÛÛÛ ±Û± Û',
'    Û± Û±±  Û± Û±±Û Û±  Û',
'    Û± ÛÛÛ  Û± Û± Û±Û±ÛÛ ±',
'     ±  ±±±  ±  ±  ± ± ±±');
t2:string[19]='Write by _______ ';
var Ch:char;
    Mode:integer;
    Ff:array[-58..1555]of byte;
    rez,dely,lev,hh,a1,a2,a3:byte;
    b,co,c,c1,c2,c3,c4:shortint;
    sp,l:word;
    c5:integer;
    lh,ww:longint;
    name:string;
label res;
procedure xread(x:byte;y,l:byte;var st:string);
var g,h:byte;
    st2:string;
    ch1:char;
begin
h:=0;st2:='';st:='';
gotoxy(x,y);
While true do
begin
 ch1:=readkey;
 if ch1=chr(13) then exit;
 if ((ord(ch1)>47) and (ord(ch1)<123) or (ord(ch1)=32)) and(h<l) then
   begin h:=h+1;st:=st+ch1;if odd(h) then x:=x-1 end;
 if ch1=chr(8) then
 begin
   if h>0 then
   begin
     h:=h-1;st:='';
     if not(odd(h)) then x:=x+1;
     for g:=1 to h do st:=st+st2[g];
   end;
 end;
 st2:=st;
 gotoxy(x,y);
 write(' ',st+' ');
end;
end;

Procedure score(const w:word);
begin
ww:=ww+w;textcolor(7);gotoxy(8,1);write(ww);
end;
procedure hscore;
var f:file;
    c:char;
    l:longint;
    q:string[20];
    s:word;
    scc,sct:string[10];
    code:integer;
    sk:byte;
     begin
        sct:='';name:='';
        assign(f,'Tetris5.exe');
        reset(f,1);
        s:=filesize(f);
        seek(f,s-20);
        for l:=1 to 20 do
        begin
          blockread(f,c,1);
          if l<11 then name:=name+c
          else
          begin
             if c=' ' then break;
             sct:=sct+c;
          end;
        end;
        val(sct,lh,code);
        if ww>=lh then
        begin
           seek(f,s-20);
           truncate(f);
           clrscr;
           gotoxy(4,13);textcolor(7);
           Write(' You have hight score');
           gotoxy(4,15);
           Write('Pleas enter your name :');
           gotoxy(10,17);
           for c5:=1 to 13 do
           begin
              gotoxy(8+c5,17);write(chr(196));
              gotoxy(8+c5,19);write(chr(196));
           end;
           gotoxy(8,17);write(chr(218));
           gotoxy(8,18);write(chr(179));
           gotoxy(8,19);write(chr(192));
           gotoxy(21,17);write(chr(191));
           gotoxy(21,18);write(chr(179));
           gotoxy(21,19);write(chr(217));
           gotoxy(10,18);Textcolor(10);
           xread(14,18,10,name);q:=name;
           for l:=1 to 10-length(name) do q:=q+' ';
           str(ww,scc);q:=q+scc;
           for l:=1 to 10-length(scc) do q:=q+' ';
           for l:=1 to 20 do blockwrite(f,q[l],1);
        end;
        close(f);
end;
procedure fin;
var re:word;
begin
clrscr;gotoxy(11,15);
textcolor(12);Write('Game Over');
gotoxy(1,34);write('You won ',ww,' points.');
textcolor(7);readkey;clrscr;
gotoxy(10,14);write('Quit to DOS?');
gotoxy(14,17);write('No');
textcolor(10);gotoxy(14,16);write('Yes');re:=1;
while true do
begin
ch:=readkey;
     if ch=ro then begin re:=1;textcolor(10);gotoxy(14,16);write('Yes');textcolor(7);gotoxy(14,17);write('No') end;
     if ch=dr then begin re:=0;textcolor(7);gotoxy(14,16);write('Yes');textcolor(10);gotoxy(14,17);write('No') end;
     if ch=chr(13) then
     begin
        hscore;
        if re=0 then begin rez:=1;exit end;
        textmode(Mode);
        halt;
     end;
end;
end;
procedure key;
begin
   ch:=readkey;
   case ch of
     RO,RO2:begin
         a2:=a2-1;
         if a2<1 then a2:=4;
         for c:=1 to 5 do
             if (Ff[l+fl[f[a1,a2,c]]]=1) then begin a2:=a2+1;if a2>4 then a2:=1;break end;
        end;
     LE:begin
         l:=l-1;
         for c:=1 to 5 do
             if (Ff[l+fl[f[a1,a2,c]]]=1) then begin l:=l+1;break end;
        end;
     RI:begin
          l:=l+1;
          for c:=1 to 5 do
              if (Ff[l+fl[f[a1,a2,c]]]=1) then begin l:=l-1;break end;
        end;
     ES:fin;
     dr:sp:=dely div 40;
   end;
end;
procedure Print(const co:byte);
begin
textcolor(co);
for c:=1 to 5 do
begin
gotoxy(((l-1+fl[f[a1,a2,c]])-trunc((l-1+fl[f[a1,a2,c]])/29)*29),(trunc((l-1+fl[f[a1,a2,c]])/29)));
write(chr(219));
end;
end;
Procedure Init;
var pe,c,o:shortint;
begin
textcolor(10);gotoxy(10,6);write('T E T R I S');textcolor(7);
gotoxy(9,15);write('Level : 1');
gotoxy(9,17);Write('Type  : Basic');
gotoxy(9,19);Write('Record: ',name);
lev:=8;dely:=1;c:=1;o:=0;pe:=1;
while true do
begin
          if c=1 then
          begin
               textcolor(10);gotoxy(9,15);write('Level :');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=Ro then begin dely:=dely+1;if dely>9 then dely:=1;gotoxy(17,15);write(dely,' ') end;
               if ch=Dr then begin dely:=dely-1;if dely<1 then dely:=9;gotoxy(17,15);write(dely,' ') end;
               if ch=chr(13) then exit;
               if ch=chr(9) then begin c:=2;break end;
               end;
               gotoxy(9,15);write('Level :');
          end;
          if c=2 then
          begin
               textcolor(10);gotoxy(9,17);Write('Type  :');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=Ro then begin o:=o+1;if o>2 then o:=0 end;
               if ch=Dr then begin o:=o-1;if o<0 then o:=2 end;
               case o of
                0:begin b:=0;lev:=8;gotoxy(17,17); write('Basic   ') end;
                1:begin b:=1;lev:=19;gotoxy(17,17);write('Extended') end;
                2:begin b:=2;lev:=42;gotoxy(17,17);write('Bizare  ') end;
               end;
               if ch=chr(13) then exit;
               if ch=chr(9) then begin c:=3;break end;
               end;
               gotoxy(9,17);Write('Type  :');
          end;
          if c=3 then
          begin
               textcolor(10);gotoxy(9,19);write('Record:');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=chr(9) then begin c:=1;break end;
               if ch=chr(13) then exit;
               if (ch=ro)or(ch=dr) then
               begin
                  gotoxy(17,19);
                  pe:=1-pe;
                  if pe=1 then Write(name,'         ') else write(lh,'         ');
               end;
               end;
               textcolor(7);gotoxy(9,19);write('Record:');
          end;
end;
end;
procedure Screen;
var as,bs:word;
    r:registers;
begin
 Mode:=lastmode;textmode(c80+font8X8);
 r.ah:=01;r.cx:=$2000;intr($10,r);
 textcolor(8);for c5:=1 to 3360 do Write(chr(random(3)+176));textcolor(7);
 for as:= 25 to 55 do
     begin
     gotoxy(as,4);write(chr(205));
     gotoxy(as,39);write(chr(205));
     end;
 for as:=5 to 38 do
     begin
     gotoxy(25,as);write(chr(186));
     gotoxy(55,as);write(chr(186));
     end;
 gotoxy(25,4);write(chr(201));gotoxy(55,4);write(chr(187));
 gotoxy(25,39);write(chr(200));gotoxy(55,39);write(chr(188));
 window(26,5,54,38);
end;
begin
randomize;
screen;
clrscr;textcolor(2);gotoxy(1,12);
for c5:=0 to 5 do writeln(pic2[c5]);
for c5:=1 to 22 do
begin
 gotoxy(29-c5,33);delay(80);for c4:=1 to c5 do write(t2[c4]);
 if keypressed then begin ch:=readkey;break end;
end;
delay(1000);
res:
ww:=0;rez:=0;clrscr;
for c5:=-29 to 1555 do ff[c5]:=0;
for c5:=-2 to 35 do begin Ff[c5*29+1]:=1;Ff[c5*29+2]:=1 end;
hscore;init;
delay(100);dely:=220-dely*20;
clrscr;write('Score :');score(0);sp:=dely;
co:=random(14)+2;l:=74;a1:=random(lev)+1;a2:=4;
While true do
begin
     if (ff[101]=1)or(ff[102]=1)or(ff[103]=1)or(ff[104]=1)or(ff[105]=1) then begin fin;goto res end;
     Print(0);
     l:=l+29;
     if keypressed then begin key;if rez=1 then goto res;print(0) end;
     Print(co);
     for c5:=0 to 30 do
      begin
         if keypressed then begin Print(0);key;if rez=1 then goto res;print(co) end;
         delay(sp div 30);
      end;
     if keypressed then begin print(0);key;if rez=1 then goto res;print(co) end;
          if (Ff[l+fl[f[a1,a2,1]]+29]=1) or (l+fl[f[a1,a2,1]]+29>986) or
             (Ff[l+fl[f[a1,a2,2]]+29]=1) or (l+fl[f[a1,a2,2]]+29>986) or
             (Ff[l+fl[f[a1,a2,3]]+29]=1) or (l+fl[f[a1,a2,3]]+29>986) or
             (Ff[l+fl[f[a1,a2,4]]+29]=1) or (l+fl[f[a1,a2,4]]+29>986) or
             (Ff[l+fl[f[a1,a2,5]]+29]=1) or (l+fl[f[a1,a2,5]]+29>986) then
          begin
               score(400 div dely+b);sp:=dely;sound(4000);delay(50);nosound;
               for c2:=1 to 5 do Ff[l+fl[f[a1,a2,c2]]]:=1;
               for c3:=-1 to 1 do
               begin
                   hh:=0;
                   for c4:=2 to 28 do
                   begin
                       if Ff[trunc(l/29+c3)*29+c4+1]=1 then hh:=hh+1;
                   end;
                   if hh>26 then
                   begin
                        Dely:=dely-1;if dely<0 then dely:=0;
                        score(8000 div dely+lev);
                        gotoxy(1,trunc(l/29)+c3);
                        sound(1000);
                        delline;
                        gotoxy(1,2);
                        insline;
                        delay(10);
                        nosound;
                        for c5:= trunc(l/29+1+c3)*29 downto 1 do
                        begin Ff[c5]:=Ff[c5-29] end;
                        delay(dely);
                   end;
               end;
               co:=random(14)+2;
               if co=8 then co:=10;
               a1:=random(lev)+1;
               l:=74;
          end;
end;
end.