program _2_2_Faili;
var F,F1,F2:text;
    m1,m2:array[1..20]of string[15];
    s:string[15];
    n,n1,n2,a,b:integer;
    fl:boolean;
Begin
  Assign(f,'c:\a11.txt');Reset(f); While not eof(f) do Begin inc(n1);readln(f,m1[n1]) End; close(f);inc(n1);m1[n1]:='***';
  Assign(f,'c:\a12.txt');Reset(f); While not eof(f) do Begin inc(n2);readln(f,m2[n2]) End; close(f);
  Assign(f1,'c:\f3.txt');Rewrite(f1); Assign(f2,'c:\f4.txt');Rewrite(f2);
  While True do
  Begin
    inc(n);
    for a:=(n+1) to n1 do Begin if n1>a then break;if m1[n]=m1[a] then Begin dec(n1) ;for b:=a to n1 do m1[b]:=m1[b+1] End;
    End;
    if (m1[n]='***')or(n>n1) then BREAK;
    fl:=false;
    for a:= 1 to n2 do
    Begin
      if a>n2 then break;
      if m1[n]=m2[a] then Begin fl:=true;dec(n2);for b:=a to n2 do m2[b]:=m2[b+1];End;
    End;
    if fl then Writeln(f1,m1[n]) else writeln(f2,m1[n]);
  End;
  writeln(f2,'*************');
  for a:=1 to n2 do
  Begin
    if a>n2 then break;
    for b:= 1 to n2 do
    Begin
      if  b>n2 then break;
      if m2[a]=m2[b] then Begin dec(n2);for n1:=b to n2 do m2[n1]:=m2[n1+1]; End;
    End;
    writeln(f2,m2[a]);
  End;
  Close(f1);Close(f2);
End.
