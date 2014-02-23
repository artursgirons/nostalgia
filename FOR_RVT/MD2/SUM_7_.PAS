Program Divu_ciparu_summa_ir_7;
uses crt;
var a:byte;
begin
clrscr;
for a:=10 to 99 do
begin
if ((a div 10)+(a-(a div 10)*10))mod 7 = 0 then write(a,' ');
end;
end.