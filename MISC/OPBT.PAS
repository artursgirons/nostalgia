uses graph,openbmp;
var x,y,a,b,c:integer;
    P:pointer;
    F:file;
    S1,S2:string;
Begin
  S1:='c:\b.bmp';{Sourse}
  S2:='c:\b.spr';{Result}
  InitGraph(x,y,'');
  Draw(x,y,0,0,s1,false);
  a:=imagesize(0,0,x,y);
  Getmem(p,a);
  getimage(0,0,x,y,p^);
  assign(f,s2);
  Rewrite(f,1);
  blockwrite(f,p^,a);
  close(f);
  Closegraph;
  dispose(p);
End.