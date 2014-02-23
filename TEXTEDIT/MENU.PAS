Unit Menu;
interface
uses crt,dos;

Procedure MenuBar(locX,locY:byte;topic:array of string;var No:string);
Procedure simbol(const x,y,tx,bk,sk:byte;const simb:char);
Procedure CursorOn;
Procedure CursorOff;
implementation
var r:registers;

Procedure MenuBar(locX,locY:byte;topic:array of string;var No:string);
var si,si2,a,a2:shortint;
    ch:char;
    rmc,rms:array[1..50,1..20]of integer;
    cod:integer;
    n,siz:byte;
    topi:string;
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
   siz:=5;
   val(topic[0],n,cod);
   for a:=1 to n do
   if siz<length(topic[a]) then siz:=length(topic[a]);
   siz:=siz+5;
   if (locx+siz+1>80) then locx:=80-siz-1;
   if (locy+n+1>23) then locy:=23-n-1;
   window(locx,locy,locx+siz,locy+n+1);
   for a:=1 to siz+1 do
   for a2:=1 to n+2 do
   begin
      gotoxy(a,a2);
      r.ah:=08;r.bh:=$00;intr($10,r);
      rms[a,a2]:=r.al;rmc[a,a2]:=r.ah;
   end;
   TextBackground(7);textcolor(0);
   clrscr;
     for a:=1 to n+2 do begin gotoxy(2,a);write(chr(179));gotoxy(siz,a);write(chr(179)) end;
     for a:=2 to siz do begin gotoxy(a,1);write(chr(196));gotoxy(a,n+2);write(chr(196)) end;
     gotoxy(2,1);write(chr(218));gotoxy(siz,1);write(chr(191));gotoxy(2,n+2);write(chr(192));gotoxy(siz,n+2);write(chr(217));
   textcolor(0);
   for a:=1 to n do
   begin
       si2:=siz-4-length(topic[a]);
       for si:=1 to si2 do topic[a]:=topic[a]+' ';
       gotoxy(3,a+1);write(' ',topic[a])
   end;
a:=1;No:='';
TextBackground(10);textcolor(0);Gotoxy(3,1+a);write(' ',topic[a]);
 While true do
 begin
      ch:=readkey;
      if ord(ch)=80 then
      begin
           TextBackground(7);textcolor(0);Gotoxy(3,1+a);write(' ',topic[a]);
           a:=a+1;if a=n+1 then a:=1;
           TextBackground(10);textcolor(0);Gotoxy(3,1+a);write(' ',topic[a]);
      end;
      if ord(ch)=72 then
      begin
           TextBackground(7);textcolor(0);Gotoxy(3,1+a);write(' ',topic[a]);
           a:=a-1;if a=0 then a:=n;
           TextBackground(10);textcolor(0);Gotoxy(3,1+a);write(' ',topic[a]);
      end;
      if ord(ch)=13 then
      begin
        si2:=length(topic[a]);
        for si:= si2 downto 1 do
        begin
           if topic[a,si]<>' ' then break;
           topi:='';
           for a2:=1 to si-1 do topi:=topi+topic[a,a2];
        end;
        No:=topi;resetscreen;exit
      end;
      if ord(ch)=27 then
      begin resetScreen;exit end;
 end;
end;
Procedure simbol(const x,y,tx,bk,sk:byte;const simb:char);
begin
 r.ah:=02;
 r.bh:=00;
 r.dh:=y-1;
 r.dl:=x-1;
 intr($10,r);
 r.ah:=09;
 r.al:=ord(simb);
 r.bh:=00;
 r.bl:=bk*16+tx;
 r.cx:=sk;
 intr($10,r);
end;
Procedure CursorOn;
begin
 r.ah:=01;
 r.ch:=06;
 r.cl:=07;
 intr($10,r);
end;
Procedure CursorOff;
begin
 r.ah:=01;
 r.cx:=$2000;
 intr($10,r);
end;
end.