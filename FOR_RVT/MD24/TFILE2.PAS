Program file_tip_mas;
Type t=array[1..5,1..5]of Byte;
Var m:t;
    n,a,b,c,d:Byte;
    F1:File of t;
    F:array[0..1]of Text;
    s:string[3];
Begin
  Assign(f1,'c:\a.rrr');Rewrite(f1);
  Assign(f[0],'c:\b1.txt');Rewrite(f[0]);
  Assign(f[1],'c:\b2.txt');Rewrite(f[1]);
  Write('Ievadiet masivu 5x5 skaitu: ');readln(n);
  for a:=1 to n do
  Begin
    For b:=1 to 5 do For  d:=1 to 5 do m[b,d]:=random(256);
    Write(f1,m);
  End;
  seek(f1,0);
  for a:=1 to n do
  Begin
    read(f1,m);
    if odd(a) then b:=0 else b:=1;
    for c:=1 to 5 do
      for d:=1 to 5 do Begin str(m[c,d],s); Write(f[b],s+' ') End;
    Writeln(f[b]);
  End;
  close(f1);close(f[0]);close(f[1]);
end.