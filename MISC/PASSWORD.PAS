uses crt;
var b,aQ:byte;
    c:array[1..10]of char;
    g:char;
begin
clrscr;textcolor(2);
Write('Pleas enter the password:');
textcolor(7);
repeat
aQ:=aQ+1;
if aQ<10 then begin c[aQ]:=readkey;if ord(c[aQ])=13 then break;write('*');b:=aQ end else g:=readkey;
until (ord(g)=13);
writeln;
if not((c[1]='h')and(c[2]='e')and(c[3]='l')and(c[4]='l')and(c[5]='o')and(b=5)) then
begin
textcolor(12);
Writeln(' ACCSESS DENIED');
sound(500);delay(500);nosound;
readkey;
halt;
end;
textcolor(10);
Writeln(' ACCSESS GARANTED');
readkey;
end.