Program Testeris;
uses dos;
var f:file;
    c:char;
    l:longint;
    q:string[20];
    s:word;
    sct,Name:string[10];
    code:integer;
begin
q:='_______    1         ';
assign(f,'c:\tp\execute\tetris.exe');
reset(f,1);
s:=filesize(f);
seek(f,s);
writeln(s);
for l:=1 to 20 do blockwrite(f,q[l],1);
close(f);
readln;
end.
