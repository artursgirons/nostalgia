{                    Uzrakstija _______ 2001.g (D11).
                        Si speles noteikumi ir sekojosi:
   speletajs no noteikta "prieksmetu" skaia drikst panemt tikai 1,2 vai 3
     prieksmetus. Zaude tas spellletajs , kurs panem pedejo "priensmetu".}
Program Bashe;
uses crt;
var n,pc,you,a,s,k1:integer;
    ke,ih:char;
    txt:string;
label 1,2,3;
begin
randomize;
     repeat
     clrscr;
     textcolor(2);
     gotoxy(1,1);
     if k1=1 then
        begin
        k1:=2;n:=round(random*95+5);a:=n;
        write ('Ievadiet priek˝metu skaitu :',n);
        delay(1000);gotoxy(1,1);
        clrscr;goto 2;
        end else k1:=1;
     write ('Ievadiet priek˝metu skaitu :');read(n);a:=n;
     gotoxy(1,1);write('                                     ');
         1:
         gotoxy(1,1);
         write('Cik tu ∑emsi [1..3]:');
         ih:=readkey;
         case ih of
         chr(49):you:=1;
         chr(50):you:=2;
         chr(51):you:=3;
         else goto 1;
         end;
         gotoxy(21,1);write(you,':');
         if (you>a)or(you<1)or(you>3)then goto 1;
         a:=a-you;
         gotoxy(60,1);
         writeln('Atlika :',a,' ');
           if (a=0) then
           begin
           txt:='Dators';
           goto 3;
           end;
         2:
         pc:=(a-1) mod 4;
         if (a=1) then pc:=1;
         if (pc=0) then pc:=round(random*2)+1;
         gotoxy(1,2);writeln('Dators ∑em :',pc);
         writeln;
         a:=a-pc;
         gotoxy(60,1);
         write('Atlika :',a,' ');
           if (a=0) then
           begin
           txt:='Úeimers';
           goto 3;
           end;
         goto 1;
         3:
         textcolor(12);
         gotoxy(1,2);
         writeln('Uzvar ',txt,'!');
         textcolor(3);
         writeln('Beigt - ESC  vai  Turpin∆t - ENTER');
         ke:=readkey;
     until ke=chr(27);
end.
