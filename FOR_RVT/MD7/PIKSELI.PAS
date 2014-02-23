uses graph,crt;
var v,a,b,c,g:Integer;
    x,y:array[1..1000]of real;
    xx,yy:array[1..1000]of real;
Begin
a:=3;b:=1;
Write('Ievadiet Punktu skaitu : ');
Readln(c);
Write('Ievadiet lenki : ');
Readln(g);
Initgraph(a,b,'');
For a:=1 to c do
Begin
 x[a]:=random(638)+1;
 y[a]:=random(348)+1;
 xx[a]:=cos(-6.28/360*g);
 yy[a]:=sin(-6.28/360*g);
End;
v:=0;
While not keypressed do
Begin
v:=1-v;
setactivepage(v);
cleardevice;
for a:=1 to c do
Begin
 x[a]:=x[a]+xx[a];
 y[a]:=y[a]+yy[a];
 if (x[a]<0)or(x[a]>640)then xx[a]:=-xx[a];
 if (y[a]<0)or(y[a]>350)then yy[a]:=-yy[a];
 putpixel(round(x[a]),round(y[a]),10);
 if keypressed then break;
End;
Setvisualpage(v);
Delay(500);
End;
Closegraph;
End.
