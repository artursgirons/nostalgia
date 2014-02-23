Program RVT;
Uses crt;
Var S:array[1..20]of char;
    a,b:byte;
Begin
ClrScr;
Write('Ievadiet Simbolu virkni : ');
For a:=1 to 20 do
Begin
s[a]:=Readkey;
if (ord(S[a])<34) or (ord(S[a])=0) then a:=a-1 Else Write(S[a]);
End;
b:=0;
For a:=1 to 18 do If (S[a]='R')And(S[a+1]='V')and(S[a+2]='T') Then inc(b);
Writeln;
Writeln('Virkne bija ',b,' " RVT " kombinacijas');
readkey;
End.