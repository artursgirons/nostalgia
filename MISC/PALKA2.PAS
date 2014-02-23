uses graph,crt;
const n=4;
      dif=15;
      f=5;
var x,y:array[0..n,0..f]of real;
    xx,yy:array[0..n]of real;
    xg,yg,a,c,g,t,co:integer;
begin
initgraph(xg,yg,'');
randomize;
for c:=1 to n do
    begin
    x[c,1]:=random*630+5;
    y[c,1]:=random*340+5;
    xx[c]:=random*dif-(dif div 2);
    if abs(xx[c])<4 then xx[c]:=random*5+7;
    yy[c]:=random*dif-(dif div 2);
    if abs(yy[c])<4 then yy[c]:=-random*5+7;
    end;
co:=10;t:=0;
repeat
    FOR a:= f + 1 downto 2 do
    begin
        FOR c:= 1 TO n do
        begin
        x[c, a]:= x[c, a - 1]; y[c, a]:=y[c, a - 1];
        end;
    x[0, a - 1]:= x[n, a - 1]; y[0, a - 1]:= y[n, a - 1];
    end;
t:=t+1;
if t>50 then begin t:=0;co :=round(random*6+9) end;
for c:=1 to n do
    begin
    x[c,1]:=x[c,1]+xx[c];
    y[c,1]:=y[c,1]+yy[c];
    setcolor(co);
    for g:=1 to f do
    begin
    line(round(x[c,g]),round(y[c,g]),round(x[c-1,g]),round(y[c-1,g]));
{   line(round(x[c,g]),350-round(y[c,g]),round(x[c-1,g]),350-round(y[c-1,g]));
    line(640-round(x[c,g]),round(y[c,g]),640-round(x[c-1,g]),round(y[c-1,g]));
    line(640-round(x[c,g]),350-round(y[c,g]),640-round(x[c-1,g]),350-round(y[c-1,g]));
}   end;
    setcolor(0);
    line(round(x[c,f]),round(y[c,f]),round(x[c-1,f]),round(y[c-1,f]));
{    line(round(x[c,f]),350-round(y[c,f]),round(x[c-1,f]),350-round(y[c-1,f]));
    line(640-round(x[c,f]),round(y[c,f]),640-round(x[c-1,f]),round(y[c-1,f]));
    line(640-round(x[c,f]),350-round(y[c,f]),640-round(x[c-1,f]),350-round(y[c-1,f]));
}   if (x[c,1]>635) or (x[c,1]<5) then xx[c]:=-xx[c];
    if (y[c,1]>345) or (y[c,1]<5) then yy[c]:=-yy[c];
    end;
until keypressed;
closegraph;
end.


