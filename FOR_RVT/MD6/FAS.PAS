Program sort;
Uses crt;
const nx=10;
      ny=10;
var m:array[1..nx,1..ny]of byte;
    a,b,c:byte;
    r:boolean;
Begin
ClrScr;
for a:=1 to nx do
Begin
  for b:=1 to ny do
  Begin
    m[a,b]:=random(10);
    Write(m[a,b]:2);
  End;
  Writeln;
End;
for a:=1 to nx do
Begin
  Writeln;
  r:=true;
  while r do
  Begin
   r:=false;
    for b:=1 to ny-1 do
      if m[a,b]>m[a,b+1] then Begin c:=m[a,b];m[a,b]:=m[a,b+1];m[a,b+1]:=c;r:=true end;
  End;
  For b:=1 to ny do Write(m[a,b]:2);
End;
End.
