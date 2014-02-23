uses crt;
type Tre1=array[1..11]of record
     a,b:string[10];
     c:string[8];
     d:string[15];
     end;
var dati:tre1;
    k,g,u,o,l:integer;
    fn:text;
    a:char;
    f,na,ha,outp:string;

procedure adrese;
begin
case k of
1: dati[g].a:=na;
2: dati[g].b:=na;
3: dati[g].c:=na;
4: dati[g].d:=na;
end;end;

procedure izdruka;
begin
clrscr;
for u:=1 to o do
begin
Outp:=dati[u].a+' '+dati[u].b+'  '+dati[u].c+'  '+dati[u].d;
writeln(outp);
end;
end;

Procedure Faila_las;
begin
assign(fn,'c:\bp\pas\birojs.doc');
reset(fn);
writeln;
o:=0;g:=0;
while not eof(fn) do
      begin
      k:=0;g:=g+1;
      while not eoln(fn) do
      begin
         read(fn,a);
         if a=' ' then
           begin
           k:=k+1; adrese;na:='';
           end
           else na:=na+a
      end;
      o:=o+1;readln(fn);
      end;
close(fn);
izdruka;
end;

procedure Faila_pap;
begin
clrscr;
f:=('c:\bp\pas\birojs.doc');
assign(fn,f);
append(fn);
repeat
inc(o);
writeln('*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  ');
write('           VÆrds :');readln(dati[o].a);
write('         UzvÆrds :');readln(dati[o].b);
write('Dzimıanas datums :');readln(dati[o].c);
write('    Nodarbosanas :');readln(dati[o].d);
writeln(fn,dati[o].a+' '+dati[o].b+' '+dati[o].c+' '+dati[o].d+' ');
Writeln('Vñlaties turpinat:');
until (readkey=chr(27)) or(o=10);
close(fn);
end;

begin
faila_las;
writeln('*  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  ');
if o<10 then
begin
  writeln('Vñlaties papildinÆt:');
  if readkey=chr(13) then
  begin
    faila_pap;
    faila_las;
  end;
end else Write('>Faila ir pilns (10. cilveki)<');
gotoxy(1,25);write('Press any key to quit');readkey;
end.