Program Find_A;
Var S:String;
    a,b:Byte;
Begin
Write('Ievadiet simbolu rindu : ');
Readln(S);
For a:=1 to Length(S) Do If S[a]='A' Then b:=b+1;
Writeln('Saja virkne ir ',b,' "A"');
Readln;
End.
