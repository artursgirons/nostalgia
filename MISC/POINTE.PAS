uses crt;
type Trec=^Tre1;
     Tre1=array[1..10]of record
     name,surn:string[15];
     date,year:string[8];
     end;
var dati:trec;
begin
new(dati);
readln(dati^[1].name);
readln(dati^[1].surn);
readln(dati^[1].date);
readln(dati^[1].year);
readln(dati^[2].name);
readln(dati^[2].surn);
readln(dati^[2].date);
readln(dati^[2].year);
dispose(dati);
end.