Program Darbibas_in_case;
Uses Crt;
Var a,b,r:real;
    ch:char;
Begin
ClrScr;
Textcolor(10);
Writeln('<< Si programa veic darbibas ar diviem ievaditiem skaitliem >>':69);
Writeln;
Textcolor(7);
Write('Ievadiet pirmo skaitli :');readln(a);
Write('Ievadiet otro skaitli  :');readln(b);
Write('Tagad nospiediet vienu no darbibas zimem :');
ch:=ReadKey;
Writeln('"'+ch+'"');
Writeln;
Textcolor(10);
Case ch of
 '*':begin r:=a*b;write('So skaitlu reizinajums ir :',r:1:3) end;
 '+':begin r:=a+b;write('So skaitlu summa ir :',r:1:3) end;
 '-':begin r:=a-b;write('So skaitlu starpiba ir :',r:1:3) end;
 '/':begin
            if b=0 then
            begin
                 TextColor(12);
                 Writeln('Kluda. Dalisana ar nulli.');
                 readkey;
                 halt;
            end;
            r:=a/b;write('So skaitlu dalijums ir :',r:1:3);
       end
 Else begin
           TextColor(12);
           Writeln('Programma neparedzeta dzrbiba.');
           readkey;
           halt;
      end;
 end;
Readkey;
end.