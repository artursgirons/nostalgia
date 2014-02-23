Program TETRIS_2002;
uses crt,dos;
const F:array[1..42,1..4,1..5]of byte=
      (((2,5,8,9,0),(4,5,6,7,0),(1,2,5,8,0),(3,4,5,6,0)),
      ((2,5,8,7,0),(1,4,5,6,0),(2,3,5,8,0),(4,5,6,9,0)),
      ((2,4,5,6,0),(2,5,6,8,0),(4,5,6,8,0),(2,4,5,8,0)),
      ((1,2,5,6,0),(3,5,6,8,0),(1,2,5,6,0),(3,5,6,8,0)),
      ((2,3,4,5,0),(2,5,6,9,0),(2,3,4,5,0),(2,5,6,9,0)),
      ((4,5,6,0,0),(2,5,8,0,0),(4,5,6,0,0),(2,5,8,0,0)),
      ((2,5,6,0,0),(5,6,8,0,0),(4,5,8,0,0),(2,4,5,0,0)),
      ((4,5,7,8,0),(4,5,7,8,0),(4,5,7,8,0),(4,5,7,8,0)),
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
      ((1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9),(1,3,5,7,9)),
      ((1,3,5,8,0),(1,5,6,7,0),(2,5,7,9,0),(3,4,5,9,0)),
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
      ((4,6,7,8,0),(2,6,8,9,0),(2,3,4,6,0),(1,2,4,8,0)),
      ((4,6,8,9,0),(2,3,6,8,0),(1,2,4,6,0),(2,4,7,8,0)),
      ((1,3,5,7,0),(1,5,7,9,0),(3,5,7,9,0),(1,3,5,9,0)),
      ((1,2,4,5,9),(3,4,5,7,8),(1,5,6,8,9),(2,3,5,6,7)),
      ((3,4,6,8,0),(1,2,6,8,0),(2,4,6,7,0),(2,4,8,9,0)),
      ((1,4,6,8,0),(2,6,7,8,0),(2,4,6,9,0),(2,3,4,8,0)),
      ((1,5,9,0,0),(3,5,7,0,0),(1,5,9,0,0),(3,5,7,0,0)),
      ((2,4,6,0,0),(2,4,8,0,0),(4,6,8,0,0),(2,6,8,0,0)),
      ((3,5,6,7,0),(1,2,5,9,0),(3,4,5,7,0),(1,5,8,9,0)),
      ((1,4,5,9,0),(3,5,7,8,0),(1,5,6,9,0),(2,3,5,7,0)));
      Fl:array[1..9]of shortint=(-30,-29,-28,-1,0,1,28,29,30);
       ES=chr(27);
       ri=chr(77);
       ro=chr(72);
       ro2=chr(32);
       le=chr(75);
       dr=chr(80);
Pic:array[0..24]of string[28]=
('           лллллл',
'          ллллллллл',
' л       ллллллллл л       л',
' ллл     ллллллл   л     ллл',
'  ллл   л    ллл    л   ллл',
'  л лл   лллл л лллл   лл л',
'  л  лл лллллл лллллл ллл л',
'  лл л  ллл лл лл ллл  ллл',
'   лл лл лллл   лллл лл лл',
'   л лллл    ллл    лллл л',
'   л лл л лллллл   ллл   л',
'   ллл   лллллллллл лллл л',
'    л л лллллллллллл лл л',
'      л лллллллллллл  лл',
'      л  лллллллллл    лл',
'     л лл          ллл  лл',
'    л ллллл      лллллл лл',
'    лл  ллллллллл      лл',
'     лл лллллллллл    лл',
'       л          лллл',
'       ллллллллллллллл',
'         ллллллллл',
'                  л',
'          ллллллллл',
'           ллллллл');

var Ch:char;
    Mode:integer;
    Ff:array[-58..1555]of byte;
    rez,dely,lev,hh,a1,a2,a3:byte;
    cu,b,co,c,c1,c2,c3,c4:shortint;
    sp,ww,l:word;
    c5:integer;
    ck:array[1..5]of integer;
    cx,cy:array[1..5]of byte;
label res;
Procedure Init;
var c,o:shortint;
begin
textcolor(10);gotoxy(10,6);write('T E T R I S');textcolor(7);
gotoxy(10,15);write('Level : 1');
gotoxy(10,17);Write('Type  : Basic');
LEV:=8;dely:=1;c:=1;o:=0;
while true do
begin
          if c=1 then
          begin
               textcolor(10);gotoxy(10,15);write('Level :');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=Ro then begin dely:=dely+1;if dely>9 then dely:=1;gotoxy(18,15);write(dely,' ') end;
               if ch=Dr then begin dely:=dely-1;if dely<1 then dely:=9;gotoxy(18,15);write(dely,' ') end;
               if ch=chr(13) then exit;
               if ch=chr(9) then begin c:=0;break end;
               end;
               gotoxy(10,15);write('Level :');
          end
          else
          begin
               textcolor(10);gotoxy(10,17);Write('Type  :');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=Ro then begin o:=o+1;if o>2 then o:=0 end;
               if ch=Dr then begin o:=o-1;if o<0 then o:=2 end;
               case o of
                0:begin b:=0;lev:=8;gotoxy(18,17); write('Basic   ') end;
                1:begin b:=1;lev:=19;gotoxy(18,17);write('Extended') end;
                2:begin b:=2;lev:=42;gotoxy(18,17);write('Bizare  ') end;
               end;
               if ch=chr(13) then exit;
               if ch=chr(9) then begin c:=1;break end;
               end;
               gotoxy(10,17);Write('Type  :');
          end;
end;
end;
procedure score(const w:word);
begin
ww:=ww+w;textcolor(7);gotoxy(8,1);write(ww);
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
     begin if re=0 then begin rez:=1;exit end; textmode(Mode);halt; end;
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
             if (Ff[l+fl[f[a1,a2,c]]]<>0) then begin a2:=a2+1;if a2>4 then a2:=1;break end;
        end;
     LE:begin
         l:=l-1;
         for c:=1 to 5 do
             if (Ff[l+fl[f[a1,a2,c]]]<>0) then begin l:=l+1;break end;
        end;
     RI:begin
          l:=l+1;
          for c:=1 to 5 do
              if (Ff[l+fl[f[a1,a2,c]]]<>0) then begin l:=l-1;break end;
        end;
     ES:fin;
     dr:sp:=dely div 40;
   end;
end;
procedure Print(const co:byte);
var r:registers;
begin
for c:=1 to 5 do
begin
if f[a1,a2,c]=0 then break;
if co=0 then begin textcolor(8);gotoxy(cx[c],cy[c]); write(chr(ck[c]))end
else begin
gotoxy(((l-1+fl[f[a1,a2,c]])-trunc((l-1+fl[f[a1,a2,c]])/29)*29),(trunc((l-1+fl[f[a1,a2,c]])/29)));
r.ah:=08;r.bh:=00;
intr($10,r);ck[c]:=r.al;
cx[c]:=((l-1+fl[f[a1,a2,c]])-trunc((l-1+fl[f[a1,a2,c]])/29)*29);
cy[c]:=(trunc((l-1+fl[f[a1,a2,c]])/29));
textcolor(co);write(chr(219));
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
res:
ww:=0;rez:=0;clrscr;
for c5:=-29 to 1555 do ff[c5]:=0;
for c5:=-2 to 35 do begin Ff[c5*29+1]:=1;Ff[c5*29+2]:=1 end;
init;
delay(100);dely:=220-dely*20;
clrscr;write('Score :');score(0);sp:=dely;
co:=random(6)+9;l:=74;a1:=random(lev)+1;a2:=4;
textcolor(8);Writeln;Writeln;Writeln;for c5:=0 to 24 do Writeln(pic[c5]);
While true do
begin
     if (ff[101]<>0)or(ff[102]<>0)or(ff[103]<>0)or(ff[104]<>0)or(ff[105]<>0) then begin fin;goto res end;
     if cu=0 then Print(0);cu:=0;
     l:=l+29;
     Print(co);
     if keypressed then begin print(0);key;if rez=1 then goto res;print(co) end;
     for c5:=0 to 30 do
      begin
         if keypressed then begin Print(0);key;if rez=1 then goto res;print(co) end;
         delay(sp div 30);
      end;
     if keypressed then begin print(0);key;if rez=1 then goto res;print(2) end;
          if (Ff[l+fl[f[a1,a2,1]]+29]<>0) or (l+fl[f[a1,a2,1]]+29>986) or
             (Ff[l+fl[f[a1,a2,2]]+29]<>0) or (l+fl[f[a1,a2,2]]+29>986) or
             (Ff[l+fl[f[a1,a2,3]]+29]<>0) or (l+fl[f[a1,a2,3]]+29>986) or
             (Ff[l+fl[f[a1,a2,4]]+29]<>0) or (l+fl[f[a1,a2,4]]+29>986) or
             (Ff[l+fl[f[a1,a2,5]]+29]<>0) or (l+fl[f[a1,a2,5]]+29>986) then
          begin
               cu:=1;score(400 div dely+b);sp:=dely;sound(4000);delay(50);nosound;
               for c2:=1 to 5 do Ff[l+fl[f[a1,a2,c2]]]:=co;
               for c3:=-1 to 1 do
               begin
                   hh:=0;
                   for c4:=2 to 28 do
                   begin
                       if Ff[trunc(l/29+c3)*29+c4+1]<>0 then hh:=hh+1;
                   end;
                   if hh>26 then
                   begin
                        Dely:=dely-1;if dely<0 then dely:=0;
                        gotoxy(1,trunc(l/29)+c3);
                        sound(1000);
                        delline;
                        gotoxy(1,2);
                        insline;
                        delay(10);
                        nosound;
                        for c5:= trunc(l/29+1+c3)*29 downto 1 do
                        begin Ff[c5]:=Ff[c5-29] end;
                        clrscr;
                        Textcolor(8);
                        gotoxy(1,1);Writeln;Writeln;Writeln;
                        for c5:=0 to 24 do Writeln(pic[c5]);
                        for c5:=987 downto 29 do
                        begin
                             if not(((trunc(c5/29)*29+1)=c5) or ((trunc(c5/29)*29+2)=c5)) then
                             if ff[c5]<>0 then
                             begin
                             textcolor(ff[c5]);
                             gotoxy(c5-1-trunc((c5-1)/29)*29,trunc((c5-1)/29));
                             write(chr(219))
                             end;
                        end;
                        textcolor(7);
                        Gotoxy(1,1);write('Score :');
                        score(8000 div dely+lev);
                   end;
               end;
               a1:=random(lev)+1;
               l:=74;
               co:=random(14)+2;if co=8 then co:=10;
          end;
end;
end.