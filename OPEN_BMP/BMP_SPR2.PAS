{$I-}
{$M 10000,0,300000}
program demonstrate_bmp;
uses graph,dos,{graphs,}openbmp3;
var xg,yg:integer;
    x,y:longint;
    p:pointer;
    n:namestr;
    pa:dirstr;
    ex:extstr;
    qq:real;
    f:file;
begin
InitGraph(xg,yg,'');
val(Paramstr(2),qq,xg);
if qq=2 then qq:=1.4 else qq:=1;
draw(x,y,Paramstr(1),false,qq);
if x>getmaxx then x:=getmaxx;
if round(y/qq)>getmaxy then y:=Getmaxy;
xg:=imagesize(0,0,x,Round(y/qq));
getmem(p,xg);
getimage(0,0,x,Round(y/qq),p^);
FSplit(Paramstr(1), pa, N,ex);
assign(f,n+'.Spr');
rewrite(f,1);
blockwrite(f,p^,xg);
close(f);
dispose(p);
readln;
closegraph;
end.