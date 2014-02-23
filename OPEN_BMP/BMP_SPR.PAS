program demonstrate_bmp;
uses graph,dos,{graphs,}openbmp3;
var xg,yg:integer;
    x,y:longint;
    p:pointer;
    n:namestr;
    pa:dirstr;
    ex:extstr;
    f:file;
begin
InitGraph(xg,yg,'');
draw(x,y,Paramstr(1),false,1);
if x>getmaxx then x:=getmaxx;
if y>getmaxy then y:=getmaxy;
xg:=imagesize(0,0,x,y);
getmem(p,xg);
getimage(0,0,x,y,p^);
FSplit(Paramstr(1), pa, N,ex);
assign(f,n+'.Spr');
rewrite(f,1);
blockwrite(f,p^,xg);
close(f);
dispose(p);
readln;
closegraph;
end.