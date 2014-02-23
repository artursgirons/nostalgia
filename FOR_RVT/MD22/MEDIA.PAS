Program Rotation_from_file;
Uses Graph,Crt;
Var p:array[1..60]of pointer;
    a,b,x,y:integer;
    f:file;
Begin
  assign(f,'c:\tp\programs.pas\for_rvt\md22\ring.spr');
  reset(f,1);
  for a:=1 to 60 do
  Begin
    Getmem(p[a],2054);
    BlockRead(f,p[a]^,2054);
  End;
  Close(f);
  initgraph(x,y,'');
  a:=0;
  setfillstyle(0,0);
  While not keypressed do
  Begin
    inc(a);if a>60 then a:=1;
    delay(1000);
    bar(288,208,352,272);
    putimage(288,208,p[a]^,1);
  End;
  readln;
  Closegraph;
  For a:=1 to 60 do Dispose(p[a]);
End.