uses graph,openbmp,crt;
var c,a,b:integer;
    f:file;
    p:pointer;
Begin
 assign(f,'c:\Ring.spr');
 Rewrite(f,1);
 initgraph(a,b,'');
 draw(0,0,'c:\a1.bmp',true);
 c:=imagesize(0,0,63,63);
 for a:=0 to 5 do
   for b:= 0 to 9 do
   Begin
     getmem(p,c);
     getimage(b*64,a*64,b*64+63,a*64+63,p^);
     blockwrite(f,p^,c);
     dispose(p);
   End;
 Close(f);
 closegraph;
End.