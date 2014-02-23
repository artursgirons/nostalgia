Program Replace;
Uses Crt;
Var F1,F2:text;
    s,s1,s2:string;
    a,b,l1:integer;
Begin
 Clrscr;
 assign(F1,'c:\Txtfile.txt');
 assign(F2,'c:\Txtfile2.txt');
 Reset(f1);
 Rewrite(f2);
 Textcolor(7);
 While not eof(f1)do Begin Readln(f1,s);Writeln(s) End;
 Close(f1);
 Textcolor(2);
 Writeln;
 Write('Replace What :');Readln(s1);
 Write('Replace With :');readln(s2);
 Writeln;
 l1:=length(s1);
 reset(f1);
 Textcolor(15);
 while not eof(f1)do
 Begin
  readln(f1,s);
  repeat
   a:=pos(s1,s);
   if a<>0 then Begin delete(s,a,l1); insert(s2,s,a) End;
  until a=0;
  Writeln(f2,s);
  Writeln(s);
 End;
 Close(f1);
 close(f2);
 erase(f1);
 rename(f2,'c:\txtfile.txt');
 Readkey;
End.