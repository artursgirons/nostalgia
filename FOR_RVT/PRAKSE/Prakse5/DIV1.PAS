Program Dam_Large_Number_Division_Prakse;
Uses Crt;
Const n=5;
Var N1,N2,Nb,Nr:Array[1..N]of Shortint;
    S,s2:String;
    L1,L2,l3,a,b,c:Byte;
    d:Shortint;
    Cod:integer;
Procedure IncR; Begin L3:=L3+1; End;
Procedure Over; Begin Writeln('Hello, Result is: ',l3);Halt; End;
Begin
  Clrscr;
  Writeln('Ievadiet ludzu DALAMO skaitli');Write(':');Readln(S);
  l1:=Length(s);If l1<=n then For a:=l1 Downto 1 do Begin s2:=s[a];val(s2,d,cod);N1[n-Length(S)+a]:=d End Else Halt;
  Writeln('Ievadiet ludzu DALITAJU');Write(':');Readln(S);
  l2:=Length(s);If l2<=n then For a:=l2 Downto 1 do Begin s2:=s[a];val(s2,d,cod);N2[n-Length(S)+a]:=d End Else Halt;
{****************************************************************************}
  While True do
  Begin
    For a:=l1 downto 1 do
      For b:=l2 downto 1 do
      Begin
        If n1[n-l1+a]>=n2[n-l2+b] then Begin n1[n-l1+a]:=n1[n-l1+a]-n2[n-l2+b];incR End Else
        Begin
          N1[n-l1+a]:=10+n1[n-l1+a]-n2[n-l2+b];
          for c:=b-1 downto 1 do
            If n1[n-l1+c]>0 then Begin n1[n-l1+c]:=n1[n-l1+c]-1;Incr;Break End else
            if (c<>1) or(n1[n-l1+l1]>0) then n1[n-l1+c]:=9 else Over;
        End;
      End;
  End;
{****************************************************************************}
End.

