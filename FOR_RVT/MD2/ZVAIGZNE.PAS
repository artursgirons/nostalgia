uses crt;
const d=5;
var a,b,l,c:byte;
begin
clrscr;
textcolor(12);
Write('Ievadiet malas garumu :');readln(l);
if l>48 then halt;
textmode(c80+font8x8);
textcolor(10);
b:=1;l:=l+1;
for c:=1 to l div 2 do
begin
for a:=b to l-c do begin delay(d);gotoxy(a,b);write('*') end;
for b:=c+1 to a do begin delay(d);gotoxy(a,b);write('*') end;
for a:=b downto c do begin delay(d);gotoxy(a,b);write('*') end;
for b:=l-c downto c+1 do begin delay(d);gotoxy(a,b);write('*') end;
if c=l div 2 then begin readkey;TextMode(Lo(LastMode));halt end;
end;
end.
