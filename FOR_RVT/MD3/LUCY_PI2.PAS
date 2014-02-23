Program Laimiga_bilete;
uses crt;
var a,b,c:integer;
    s:string[2];
begin
clrscr;write(' ');
a:=0;
While a<1000 do
begin
  b:=0;
  While b<1000 do
  begin
    if (a div 100)+((a-a div 100*100) div 10)+a mod 10 =(b div 100)+((b-b div 100*100) div 10)+b mod 10 then
    begin
      s:='';if a div 100 =0 then s:='0';if a div 10 =0 then s:='00';
      write(' ',s,a);
      s:='';if b div 100 =0 then s:='0';if b div 10 =0 then s:='00';
      write(s,b,' ');
    end;
    inc(b);
  end;
  inc(a);
end;
end.