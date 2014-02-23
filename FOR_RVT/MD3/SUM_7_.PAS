Program Divu_ciparu_summa_ir_7;
uses crt;
var a:byte;
begin
clrscr;
a:=10;
repeat
if ((a div 10)+(a-(a div 10)*10))mod 7 = 0 then write(a,' ');
inc(a);
until a>99;
end.