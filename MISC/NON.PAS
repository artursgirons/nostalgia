{$I-}
uses dos,crt;
var n:searchrec;
    dirn,diro:dirstr;
procedure _filef(dirn:dirstr);
begin
chdir(dirn);
findfirst('*.*',anyfile,n);
while doserror=0 do
begin
 if ioresult <>0 then exit;
 if n.name='.' then begin findnext(n);findnext(n) end;
 writeln(n.name);
 if n.attr and directory = directory then _filef(n.name);
 findnext(n);
end;
if dirn<>diro then chdir('..');
end;
begin
clrscr;
writeln('File search...');
getdir(0,diro);
diro:=fexpand(diro);
_filef(diro);
end.