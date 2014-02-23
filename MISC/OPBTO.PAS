uses graph;
var x,y,a,b:integer;
    f:file;
    p:pointer;
Begin
  initgraph(x,y,'');
  Assign(f,'c:\b.spr');
  reset(f,1);
  a:=filesize(f);
  getmem(p,a);
  blockread(f,p^,a);
  close(f);
  putimage(0,0,p^,1);
  readln;
  closegraph;
End.