Program Find_A;
Uses Crt;
Var S:array[1..20] of Char;
    a,b:Byte;
Begin
ClrScr;
Write('Ievadiet 20 simbolus : ');
for a:=1 to 20 do
Begin
S[a]:=readkey;
Write(S[a]);
if S[a]='A' then b:=b+1;
End;
Writeln;
Writeln('Saja virkne ir ',b,' "A"');
Readln;
End.