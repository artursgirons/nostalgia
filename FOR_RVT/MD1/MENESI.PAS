Program Dimsanas_Menesis;
Uses Crt;
var a:string[2];
procedure fin(s:string);
begin
textcolor(138);
writeln('Apsveicu, Tu esi dzimis ',s);
textcolor(7);
readkey;
end;
Procedure wr(s2:string);
var l,i:byte;
begin
if s2[1]<>'U' then s2:='  '+chr(250)+s2;
L:=length(s2);
for i:=1 to l do
begin
delay(10);
sound(1000);
delay(5);
nosound;
write(s2[i]);
end;
if s2[1]<>'U' then Readln(a);
end;
begin
clrscr;
textcolor(2);
wr('Uz jautajumiem jaatbild tikai ar Ja vai Ne, jo preteja gadijuma...');writeln;
textcolor(7);
readkey;
Wr('Vai Tu esi dzimis pirmaja pusgada : ');
if a='Ja' then
begin
     Wr('Vai Tu esi dzimis pavasari : ');
     if a='Ja' then
     begin
          Wr('Vai Tava dzimsanas menesi ir 31 diena : ');
          if a='Ja' then
          begin
               Wr('Vai Tu dzimi pirmaja pavasara menesi : ');
               if a='Ja' then fin('MARTA')
               else fin('MAIJA');
          end
          else fin('APRILI');
     end
     else
     begin
          Wr('Vai Tu esi dzimis ziema : ');
          if a='Ja' then
          begin
               Wr('Vai Tava dzimsanas menesi ir 31 diena : ');
               if a='Ja' then fin('JANVARI')
               else fin('FEBRUARI');
          end
          else fin('JUNIJA');
     end;
end
else
begin
     Wr('Vai tu esi dzimis rudeni : ');
     if a='Ja' then
     begin
          Wr('Vai tava dzimsznas menesi ir 30 dienas : ');
          if a='Ja' then
          begin
               Wr('Vai tavs menesis ir menesis, kad sak iet skola : ');
               if a='Ja' then fin('SEPTEMBRI')
               else fin('NEVEMBRI');
          end
          else fin('OKTOBRI');
     end
     else
     begin
          Wr('Vai Tu esi dzimis vasara : ');
          if a='Ja' then
          begin
               Wr('Vai tas ir pedejais vasaras menesis : ');
               if a='Ja' then fin('AUGUSTA')
               else fin('JULIJA');
          end
          else fin('DECEMBRI');
     end;
end;
end.



