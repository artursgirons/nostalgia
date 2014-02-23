{$I-}
uses dos,crt;
var old_dir,new_dir:dirstr;
procedure pdir(dir:dirstr);
var n:searchrec;
    attr:word;
    d:dirstr;
    f:namestr;
    e:extstr;
begin
dir:=fexpand(dir);
chdir(dir);
findfirst('*.*',anyfile,n);
while doserror=0 do
begin
if n.name='.' then
 begin
 findnext(n);
 findnext(n);
 end
else
begin
 fsplit((dir+n.name),d,f,e);
 if e='.EXE' then writeln(n.name);
 attr:=n.attr;
 if attr and directory = directory then pdir(n.name);
 findnext(n);
end;
end;
if dir<> new_dir then chdir('..');
end;

begin
clrscr;
new_dir:='c:\';
writeln;
pdir(new_dir);
chdir('c:\');
readln;
end.