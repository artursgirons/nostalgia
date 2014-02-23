Program Crt2_4;
uses crt,dos;
var a,b:byte;
    s:string;
    t:integer;
procedure TextDrop(const x,y,c2,de:byte;const st:string);
var q,p,w,x2,y2:byte;
    c:char;
    r:registers;
begin
 q:=length(st);
 if q>80-x then exit;
  for p:=1 to q do
  begin
   if st[p]<>' ' then
   for w:=1 to y do
   begin
    gotoxy(x+p,w);r.ah:=08;r.bh:=00;intr($10,r);
    textcolor(c2);gotoxy(x+p,w);write(st[p]);
    delay(de);if w=y then break;
    textcolor(r.ah);gotoxy(x+p,w);write(chr(r.al));
   end;
  end;
end;
begin
randomize;
clrscr;
textcolor(8);
for t:=1 to 1920 do write(chr(random(170)+75));
textdrop(20,5,10,15,'Hello I am your PC and I work for you.');
readkey;
end.