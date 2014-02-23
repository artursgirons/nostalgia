uses graph,crt;
var f:file of word;
    bmp:file of byte;
    xs,ys:word;
    a,b:byte;
    p,p1:pointer;
    x,y:integer;
Begin
clrscr;
  Assign(bmp,'c:\a.spr');
  reset(bmp);
  seek(bmp,4);
    Read(bmp,a);
    Write(a,' ');
End.