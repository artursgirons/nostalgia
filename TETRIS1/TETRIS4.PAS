Program TETRIS_2002;
uses crt,dos;
const F:array[1..18,1..4,1..5]of byte=
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
      ((4,5,6,7,8),(2,5,6,8,9),(2,3,4,5,6),(1,2,4,5,8)),
      ((1,2,5,8,9),(3,4,5,6,7),(1,2,5,8,9),(3,4,5,6,7)));
      Fl:array[1..9]of shortint=(-30,-29,-28,-1,0,1,28,29,30);
       ES=chr(27);
       ri=chr(77);
       ro=chr(72);
       le=chr(75);
       dr=chr(80);
pic:array[0..35]of string[50]=
('                   ���������             ',
'          ���     ���������       ���    ',
'           ����  �������������  ����     ',
'           �� �� ������ ������ �����     ',
'            �����������������������      ',
'      �     ���� ���������������� �      ',
'     ���     � � ������������ ����       ',
'      ���     ����������������� ���      ',
'   ������ �  ����������������������      ',
'  ����������  �������������������        ',
'   ������� �    ���������������          ',
'     ������        ���������             ',
'      �����   ��������������������       ',
'   �� ������ ��������������������� �     ',
'   ���������� ����������������������     ',
'     � ������� ��������������������      ',
'       �������� ������������������       ',
'        �������� �������������� �        ',
'         ������  ������������  �         ',
'           ��   ���������� ����          ',
'                  ��������  ��           ',
'                                         ',
'������� ������� ������� ������� � ������� ',
'   �    �          �    �     � � �       ',
'   �    �          �    �     � � �       ',
'   �    �����      �    ������  � ������� ',
'   �    �          �    �     � �       � ',
'   �    �������    �    �     � � ������� ',
'                                          ',
'         ����� ����� ����� �����          ',
'             � �   � �   �     �          ',
'            �  �   � �   �     �          ',
'           �   �   � �   � �����          ',
'          �    �   � �   �     �          ',
'         �     �   � �   �     �          ',
'         ����� ����� ����� �����          ');

var Ch:char;
    Mode:integer;
    Ff:array[-29..1555]of byte;
    rez,dely,lev,hh,a1,a2,a3:byte;
    co,c,c1,c2,c3,c4:shortint;
    sp,ww,l:word;
    c5:integer;
label res;
Procedure Init;
var c:byte;
begin
textcolor(10);gotoxy(10,6);write('T E T R I S');textcolor(7);
gotoxy(10,15);write('Level : 1');
gotoxy(10,17);Write('Type  : Basic');
lev:=8;dely:=1;c:=1;
while true do
begin
          if c=1 then
          begin
               textcolor(10);gotoxy(10,15);write('Level :');
               textcolor(7);
               while true do
               begin
               ch:=readkey;
               if ch=Ro then begin dely:=dely+1;if dely>10 then dely:=dely-1;gotoxy(18,15);write(dely,' ') end;
               if ch=Dr then begin dely:=dely-1;if dely<1 then dely:=dely+1;gotoxy(18,15);write(dely,' ') end;
               if ch=chr(13) then exit;
               if ch=chr(9) then begin c:=1-c;break end;
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
               if ch=Ro then begin lev:=8;gotoxy(18,17);write('Basic   ') end;
               if ch=Dr then begin lev:=18;gotoxy(18,17);write('Extended') end;
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
   ch:=readkey;ch:=readkey;
   case ch of
     RO:begin
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
procedure Screen;
var as,bs:word;
    r:registers;
begin
 Mode:=lastmode;textmode(c80+font8X8);
 textcolor(7);
 r.ah:=01;r.cx:=$2000;intr($10,r);
 for as:= 46 to 76 do
     begin
     gotoxy(as,5);write(chr(205));
     gotoxy(as,40);write(chr(205));
     end;
 for as:=5 to 40 do
     begin
     gotoxy(46,as);write(chr(186));
     gotoxy(76,as);write(chr(186));
     end;
 gotoxy(46,5);write(chr(201));gotoxy(76,5);write(chr(187));
 gotoxy(46,40);write(chr(200));gotoxy(76,40);write(chr(188));
 window(1,4,51,41);
 textcolor(2);for c5:=0 to 21 do writeln(pic[c5]);
 textcolor(10);for c5:=21 to 35 do writeln(pic[c5]);
 window(47,6,75,39);
end;
begin
randomize;
screen;
res:
ww:=0;rez:=0;clrscr;
for c5:=-29 to 1555 do ff[c5]:=0;
for c5:=0 to 35 do begin Ff[c5*29+1]:=1;Ff[c5*29+2]:=1 end;
init;
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
     delay(sp);
     if keypressed then begin print(0);key;if rez=1 then goto res;print(co) end;
          if (Ff[l+fl[f[a1,a2,1]]+29]=1) or (l+fl[f[a1,a2,1]]+29>986) or
             (Ff[l+fl[f[a1,a2,2]]+29]=1) or (l+fl[f[a1,a2,2]]+29>986) or
             (Ff[l+fl[f[a1,a2,3]]+29]=1) or (l+fl[f[a1,a2,3]]+29>986) or
             (Ff[l+fl[f[a1,a2,4]]+29]=1) or (l+fl[f[a1,a2,4]]+29>986) or
             (Ff[l+fl[f[a1,a2,5]]+29]=1) or (l+fl[f[a1,a2,5]]+29>986) then
          begin
               score(400 div dely+lev div 17);sp:=dely;sound(4000);delay(50);nosound;
               for c2:=1 to 5 do Ff[l+fl[f[a1,a2,c2]]]:=1;
               for c3:=-1 to 1 do
               begin
                   hh:=0;
                   for c4:=2 to 28 do
                   begin
                       if Ff[trunc(l/29+c3)*29+c4]=1 then hh:=hh+1;
                   end;
                   if hh>26 then
                   begin
                        Dely:=dely-5;if dely<0 then dely:=0;
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