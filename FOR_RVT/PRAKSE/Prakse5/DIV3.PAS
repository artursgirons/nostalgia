Program Prakse_Large_Numbers;
Uses crt;
Const N=6;
Var N1,N2,N3:Array[1..N]of Shortint;
    L1,L2,Rez,a,b,c,d,cod:Integer;
    s1,s2:String[n];
    p:Shortint;
    sm:boolean;

Procedure Sum;Begin rez:=rez+1;end;

Procedure Over;Begin Writeln('Rez: ',rez);Halt;end;

Procedure Decy(const t:shortint);
Var u:integer;
Begin
  For u:=t downto n-l1+1 do
  Begin
    if n1[u]>0
    Then Begin dec(n1[u]);inc(d);exit End
    Else
    If (u=n-l1+1)and(n1[u]<1) then Over else Begin n1[t+1]:=9;Decy(u-1);End;
  End;
End;

Begin
  Clrscr;
  Writeln('Ievadiet Dalamo.');Write(':');Readln(s1);
  L1:=Length(s1);For a:=l1 downto 1 do Begin s2:=s1[a];Val(s2,p,cod);N1[n-l1+a]:=p End;
  S2:=s1;Writeln('Ievadiet Dalitaju.');Write(':');Readln(s1);
  L2:=Length(s1);If L2>L1 Then Begin Write('Rez: 0; Atlikums: ',s2);Readln;Halt End;
  For a:=l2 downto 1 do Begin s2:=s1[a];Val(s2,p,cod);N2[n-l2+a]:=p End;
  While true do
  Begin
    sm:=false;
    For a:= N downto N-l2+1 do
    Begin
      If n1[a]>=n2[a]
      Then Begin n1[a]:=n1[a]-n2[a];Sm:=true End
      Else Begin d:=0;Decy(a-1);if d>0 then sm:=true;End;
    End;
    if sm then sum;
  End;
  Over;
End.
