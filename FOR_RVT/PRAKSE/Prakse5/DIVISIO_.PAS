Program Prakse_Large_Numbers;
Uses crt;
Const N=81;
Var N1,N2,N3,N4:Array[1..N]of Shortint;
    L1,L2,a,b,cod:Integer;
    s1,s2:String[n];
    p:Shortint;
    sm,sn1,sn2:boolean;

Procedure Over;
var ff:boolean;
Begin
Writeln;ff:=false;Write('Rezult: ');
if sn1 xor sn2 then write('-');for a:=1 to n do Begin if n4[a]<>0 then ff:=true;if ff then Write(n4[a]) End;
if not ff then write(0);
Writeln;ff:=false;Write('Atlikums: ');for a:=1 to n do Begin if n3[a]<>0 then ff:=true;if ff then Write(n3[a]) End;
if not ff then write(0);
Halt;
end;

Procedure sum(const k:byte);Begin if n4[k]<9 then Begin inc(n4[k]);Exit End else Begin n4[k]:=0;sum(k-1);Exit End End;

Procedure Decy(const t:shortint);
Var u:integer;
Begin
  if t<n-l1+1 then Over;
  If n1[t]>0
  Then Begin n1[a]:=n1[a]+10-n2[a];dec(n1[t]);Sm:=True;exit End
  Else If (t=n-l1+1)and(n1[t]=0) then Over Else Begin Decy(t-1);n1[t]:=9;Exit End;
End;

Begin
  Clrscr;sn1:=false;sn2:=false;
  Writeln('Ievadiet Dalamo.');Write(':');Readln(s1);
  L1:=Length(s1);
  For a:=l1 downto 1 do Begin s2:=s1[a];if s2='-' then Begin sn1:=true;dec(l1);break End;Val(s2,p,cod);N1[n-l1+a]:=p End;
  S2:=s1;Writeln('Ievadiet Dalitaju.');Write(':');Readln(s1);
  L2:=Length(s1);If L2>L1 Then Begin Write('Rez: 0; Atlikums: ',s2);Readln;Halt End;
  For a:=l2 downto 1 do Begin s2:=s1[a];if s2='-' then Begin sn2:=true;dec(l2);break End;Val(s2,p,cod);N2[n-l2+a]:=p End;
  While true do
  Begin
    sm:=false;
    N3:=N1;
    For a:= N downto N-l2+1 do
    Begin
      If n1[a]>=n2[a]
      Then Begin n1[a]:=n1[a]-n2[a];Sm:=true End
      Else Begin Decy(a-1);End;
    End;
    if Sm then sum(n);
  End;
  Over;
End.
