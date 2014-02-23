Program Funkcion_in_case;
Uses crt;
Var a,b:longint;
    r:real;
Begin
clrscr;
TextColor(10);
Writeln('< Programma, kas pec ievaditiem argumentiem izvelas funkciju un to aprekina >');
Writeln;
textcolor(7);
Write('Ievadiet argumentu "A" :');Readln(a);
Write('Ievadiet argumentu "B" :');Readln(b);
writeln;
textcolor(10);
case a of
1,2,3:begin
           if (a-b)=0 then
           begin
                Textcolor(12);
                Writeln('Kluda. Dalisana ar nulli.');
                readkey;
                halt;
           end;
           r:=(a+b)/(a-b);
           Writeln('Y = (A + B) / (A - B)');
           Writeln('Y = ',r:1:3);
           readkey;
           halt;
     end;
4,10..20:begin
              if a-b<0 then
              begin
                   Textcolor(12);
                   Writeln('Kluda. Kvadratsaknes vilksana no negariva skaitla.');
                   readkey;
                   halt;
              end;
              r:=sqrt(a+b)+sqr(b);
              Writeln('Y = SQRT(A + B) + SQR(B)');
              Writeln('Y = ',r:1:3);
              readkey;
              halt;
         end
else Writeln('Y = 0');
end;
readkey;
end.


