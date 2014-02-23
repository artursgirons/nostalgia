Program Menu;
uses crt;                      {        } {        } {        } {        } {        }
const t1:array[1..5]of string=('New     ','Open    ','Save    ','Save as ','Exit    ');
      t2:array[1..5]of string=('Games   ','Phones  ','Info +  ','Time    ','Help    ');
var a,c,d,x,y:byte;
    e,f,g,h:shortint;
    b1,b2:string;
Procedure MenuBar(const locX,locY,siz,n:byte;const topic:array of string;var No:string);
const chset=[77,75,80,72];
var a:shortint;
    ch:char;
begin
   window(locx,locy,locx+siz,locy+n+1);
   TextBackground(7);textcolor(0);
   clrscr;
     for a:=1 to n+2 do begin gotoxy(2,a);write(chr(179));gotoxy(siz,a);write(chr(179)) end;
     for a:=2 to siz do begin gotoxy(a,1);write(chr(196));gotoxy(a,n+2);write(chr(196)) end;
     gotoxy(2,1);write(chr(218));gotoxy(siz,1);write(chr(191));gotoxy(2,n+2);write(chr(192));gotoxy(siz,n+2);write(chr(217));
   textcolor(0);
   for a:=0 to n-1 do begin gotoxy(4,a+2);write(topic[a]) end;
a:=0;
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
      begin
           TextBackground(0);textcolor(15);No:=topic[a];clrscr;window(1,1,80,25);exit;
      end;
 end;
end;
begin
TextBackground(0);
clrscr;
MenuBar(10,5,13,5,t1,b1);
MenuBar(40,10,13,5,t2,b2);
Writeln('Your first option was  :',b1);
Writeln('Your second option was :',b2);
readkey;
end.
