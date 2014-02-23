Program Max_Skaitlis;
Var M:array[1..25]of integer;
    a,b:integer;
Begin
Randomize;
b:=-32768;
For a:=1 to 25 do
Begin M[a]:=Random(65535)-32768;if M[a]>b then b:=M[a] End;
For a:=1 to 12 do Writeln(M[a]:10,'  ',M[a+12]);Writeln(M[25]:10);
Writeln;
Writeln('Maximalais skaitlis : ',b);
End.