Uses crt,graph;
Var x,y:integer;
Begin
initgraph(x,y,'');
Asm mov ax,13h;int(10h) End;
putpixel(10,10,10);
circle(10,10,10);
Readln;
Asm mov ax,03h;int(10h) End;
End.