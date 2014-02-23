program Mainit_Vietam;
var m:array[0..29]of byte;
    a,b,c:byte;
Begin
Randomize;
for a:= 0 to 29 do Begin m[a]:=random(10);Write(m[a]) End;
for c:= 0 to 14 do Begin a:=c*2;b:=m[a];m[a]:=m[a+1];m[a+1]:=b End;
Writeln;for a:= 0 to 29 do Begin Write(m[a]) End;
End.
