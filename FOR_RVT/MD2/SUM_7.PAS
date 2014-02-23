Program Divu_ciparu_summa_ir_7;
uses crt;
var a,b:byte;
begin
clrscr;
for a:=1 to 9 do
for b:=0 to 9 do
if ((a+b) mod 7=0) then write(a,b,' ');
end.