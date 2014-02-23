Program Crt2_5;
uses crt;
var a,b,c:byte;
    s:string;
procedure Textprint(const x,y,de:byte;const at:boolean;const st:string);
var h,g,w:byte;
begin
 g:=length(st);
 if g>80-x then exit;
 gotoxy(x,y);
 for h:=1 to g do
 begin
  if at then
  begin
   sound(5000);
   delay(10);
   nosound
  end;
  Write(st[h]);
  delay(de);
 end;
end;
begin
clrscr;
textcolor(10);
textprint(25,10,30,True,'Hello World, I love you.');
readkey;
end.

