Program Laimiga_bilete;
uses crt;
var a1,a2,a3,a4,a5,a6:byte;
begin
clrscr;
for a1:=0 to 9 do
for a2:=0 to 9 do
for a3:=0 to 9 do
for a4:=0 to 9 do
for a5:=0 to 9 do
for a6:=0 to 9 do
if a1+a2+a3=a4+a5+a6 then write(a1,a2,a3,a4,a5,a6,'  ');
end.