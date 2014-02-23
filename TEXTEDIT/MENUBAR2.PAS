Program Menu;
uses crt,dos;                      {        } {        } {        } {        } {        }
const t1:array[1..5]of string=('New     ','Open    ','Save    ','Save as ','Exit    ');
      t2:array[1..5]of string=('Games   ','Phones  ','Info +  ','Time    ','Help    ');
var a,c,d,x,y:byte;
    e,f,g,h:shortint;
    b1,b2,b3,b4:string;
    rr:integer;
Procedure MenuBar(const locX,locY,siz,n:byte;const topic:array of string;var No:string);
var a,a2:shortint;
    ch:char;
    rmc,rms:array[1..50,1..20]of integer;
    r:registers;
Procedure ResetScreen;
var aa,aa2:shortint;
begin
      TextBackground(0);textcolor(7);clrscr;
      window(locx,locy,locx+siz+1,locy+n+1);
      for aa:=1 to siz+1 do
       for aa2:=1 to n+2 do
       begin
            textcolor(rmc[aa,aa2]-(rmc[aa,aa2] div 16)*16);
            textbackground(rmc[aa,aa2] div 16);
            gotoxy(aa,aa2);write(chr(rms[aa,aa2]));
       end;
      window(1,1,80,25);exit;
end;
begin
   window(locx,locy,locx+siz,locy+n+1);
   for a:=1 to siz+1 do
   for a2:=1 to n+2 do
   begin
      gotoxy(a,a2);
      r.ah:=08;
      r.bh:=$00;
      intr($10,r);
      rms[a,a2]:=r.al;
      rmc[a,a2]:=r.ah;
   end;
   TextBackground(7);textcolor(0);
   clrscr;
     for a:=1 to n+2 do begin gotoxy(2,a);write(chr(179));gotoxy(siz,a);write(chr(179)) end;
     for a:=2 to siz do begin gotoxy(a,1);write(chr(196));gotoxy(a,n+2);write(chr(196)) end;
     gotoxy(2,1);write(chr(218));gotoxy(siz,1);write(chr(191));gotoxy(2,n+2);write(chr(192));gotoxy(siz,n+2);write(chr(217));
   textcolor(0);
   for a:=0 to n-1 do begin gotoxy(4,a+2);write(topic[a]) end;
a:=0;No:='';
TextBackground(10);textcolor(0);Gotoxy(4,2+a);write(topic[a]);
 While true do
 begin
      ch:=readkey;
      if ord(ch)=80 then
      begin
           TextBackground(7);textcolor(0);Gotoxy(4,2+a);write(topic[a]);
           a:=a+1;if a=n then a:=0;
           TextBackground(10);textcolor(0);Gotoxy(4,2+a);write(topic[a]);
      end;
      if ord(ch)=72 then
      begin
           TextBackground(7);textcolor(0);Gotoxy(4,2+a);write(topic[a]);
           a:=a-1;if a=-1 then a:=n-1;
           TextBackground(10);textcolor(0);Gotoxy(4,2+a);write(topic[a]);
      end;
      if ord(ch)=13 then
      begin No:=topic[a];resetscreen;exit end;
      if ord(ch)=27 then
      begin resetScreen;exit end;
 end;
end;
begin
randomize;
TextBackground(0);
clrscr;
textcolor(7);
for rr:=1 to 1920 do begin TextBackground(random(random(10)+2));textcolor(random(10)+2);write(chr(random(100)+50)) end;
readkey;
MenuBar(1,1,13,5,t1,b1);
MenuBar(10,11,13,5,t2,b2);
MenuBar(50,7,13,5,t1,b3);
MenuBar(60,12,13,5,t2,b4);
textcolor(10);
TextBackground(0);
readkey;
clrscr;
Writeln('Your first option was  :',b1);
Writeln('Your second option was :',b2);
Writeln('Your third option was  :',b3);
Writeln('Your fourth option was :',b4);
readkey;
readkey;
end.
