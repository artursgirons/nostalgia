uses graph,crt;
var x,y,r:integer;
Procedure Star(const xs,ys,sr,sr2:integer);
const d=pi*2/8;
var qp,qe,qt,qu:integer;
begin
for qp:=0 to 7 do
for qe:=0 to round(pi*2*100) div 3 do
line(round(xs+cos(qp*d)*sr),round(ys+sin(qp*d)*sr),round(xs+cos(qe/13)*sr2),round(ys+sin(qe/13)*sr2));
end;
begin
initgraph(x,y,'');
randomize;
while not keypressed do
begin
  setcolor(random(14)+1);
  star(random(400)+120,random(150)+72,random(100)+50,random(40)+5);
end;
end.