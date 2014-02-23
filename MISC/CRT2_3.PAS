Program Crt2_3;
uses crt;
var a,b,d:byte;
    s:string;
procedure TextMove(const x,y:byte;st:string);
var q,r:byte;
    ch:char;
begin
 st:='     '+st+'     ';
 q:=length(st);
 while true do
 begin
  for r:=2 to q-4 do
  begin
   textcolor(7);
   gotoxy(x+r-1,y);
   write(st[r-1]);
   textcolor(10);
   write(st[r]);
   write(st[r+1]);
   write(st[r+2]);
   write(st[r+3]);
   write(st[r+4]);
   delay(100);
   if keypressed then exit;
  end;
 end;
end;
begin
clrscr;
textmove(10,10,'Hello I am _______.');
end.