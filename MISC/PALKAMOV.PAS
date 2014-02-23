uses graph,crt;
const n=5;
      dif=10;
      f=10;
var x,y:array[0..n,0..f]of real;
    xx,yy:array[0..n]of real;
    xg,yg,a,c,g:integer;
begin
initgraph(xg,yg,'');
randomize;
for c:=1 to n do
    begin
    x[c,1]:=random*630+5;
    y[c,1]:=random*340+5;
    xx[c]:=random*dif-(dif div 2);
    yy[c]:=random*dif-(dif div 2);
    end;
repeat
for c:=1 to n do
    begin
    x[c,1]:=x[c,1]+xx[c];
    y[c,1]:=y[c,1]+yy[c];
    if (c-1)=0 then begin x[0,1]:=x[n,1]+xx[n];y[0,1]:=y[n,1]+yy[n] end;
    setcolor(10);
    line(round(x[c,1]),round(y[c,1]),round(x[c-1,1]),round(y[c-1,1]));
    for a:=f+1 downto 2 do
        begin
        x[c,a]:=x[c,a-1];
        y[c,a]:=y[c,a-1];
        end;
    x[0,f]:=x[n,f-1];
    y[0,f]:=y[n,f-1];
    setcolor(0);
    line(round(x[c,f]),round(y[c,f]),round(x[c-1,f]),round(y[c-1,f]));
    if (x[c,1]>635) or (x[c,1]<5) then xx[c]:=-xx[c];
    if (y[c,1]>345) or (y[c,1]<5) then yy[c]:=-yy[c];
    end;
until keypressed;
closegraph;
end.
{FOR g = f + 1 TO 2 STEP -1
FOR c = 1 TO b
x(c, g) = x(c, g - 1): y(c, g) = y(c, g - 1)
NEXT
x(0, g - 1) = x(b, g - 1): y(0, g - 1) = y(b, g - 1)
NEXT}

