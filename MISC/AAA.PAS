uses crt;
const d=10000;
var a,b,l,c:byte;
begin
clrscr;
textmode(c80+font8x8);
textcolor(10);
b:=20;
for c:=1 to 20 do
begin
for a:=b downto 20-c do begin delay(d);gotoxy(b,a);write('*') end;
for b:=20+c-2 downto 20-c do begin delay(d);gotoxy(b,a);write('*') end;
for a:=b+1 to 20+c do begin delay(d);gotoxy(b,a);write('*') end;
for b:=b+1 to c+20 do begin delay(d);gotoxy(b,a);write('*') end;
end;
end.
